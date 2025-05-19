#import "Basic";
#import,file "../module.jai";

Request :: struct {
    url: string;
    body: string;
    header_keys: [..]string;
    header_values: [..]string;
}

on_url :: (parser: *llhttp_t, at: *u8, length: u64) -> s32 #c_call {

    if !at || !parser.data return 0;

    req := parser.data.(*Request);
    url := string.{count=length.(s64), data=at};

    push_context {
        req.url = copy_string(url);
    }

    return 0;
}

on_body :: (parser: *llhttp_t, at: *u8, length: u64) -> s32 #c_call {

    if !at || !parser.data return 0;

    req := parser.data.(*Request);
    body := string.{count=length.(s64), data=at};

    push_context {
        req.body = copy_string(body);
    }

    return 0;
}

on_header_key :: (parser: *llhttp_t, at: *u8, length: u64) -> s32 #c_call {

    if !at || !parser.data return 0;

    req := parser.data.(*Request);
    header_key := string.{count=length.(s64), data=at};

    push_context {
        array_add(*req.header_keys, copy_string(header_key));
    }

    return 0;
}

on_header_value :: (parser: *llhttp_t, at: *u8, length: u64) -> s32 #c_call {

    if !at || !parser.data return 0;

    req := parser.data.(*Request);
    header_value := string.{count=length.(s64), data=at};

    push_context {
        array_add(*req.header_values, copy_string(header_value));
    }

    return 0;
}

main :: () {

    // Setup settings
    hparser_settings: llhttp_settings_t;
    llhttp_settings_init(*hparser_settings);
    hparser_settings = .{
        on_url = on_url,
        on_body = on_body,
        on_header_field = on_header_key,
        on_header_value = on_header_value,
    };

    // Setup parser
    hparser: llhttp_t;
    llhttp_init(*hparser, .REQUEST, *hparser_settings);

    req: Request;
    hparser.data = *req;

    // Parse
    req_string := "POST /hello/there/friend HTTP/1.1\r\nHost: overlordsystems.com\r\nContent-Length: 31\r\n\r\n{\"name\":\"Overlord\",\"age\":999}";

    status := llhttp_execute(*hparser, req_string.data, req_string.count.(u64));
    print("parser execute status = %\n", status);
    assert(status == .OK);

    // Read info
    method := llhttp_get_method(*hparser).(llhttp_method_t);
    print("method = %\n", method);
    assert(method == .POST);

    major := llhttp_get_http_major(*hparser);
    minor := llhttp_get_http_minor(*hparser);
    print("http version = %.%\n", major, minor);
    assert(major == 1 && minor == 1);

    print("request = %\n", req);
    assert(req.url == "/hello/there/friend");
    assert(req.body == "{\"name\":\"Overlord\",\"age\":999}");
    assert(req.header_keys.count == 2);
    assert(req.header_keys[0] == "Host");
    assert(req.header_keys[1] == "Content-Length");
    assert(req.header_values.count == 2);
    assert(req.header_values[0] == "overlordsystems.com");
    assert(req.header_values[1] == "31");

    print("\nTEST SUCCESS!\n");
}
