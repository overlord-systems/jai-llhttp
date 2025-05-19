//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



LLHTTP_VERSION_MAJOR :: 9;
LLHTTP_VERSION_MINOR :: 3;
LLHTTP_VERSION_PATCH :: 0;

llhttp__internal_t :: llhttp__internal_s;
llhttp__internal_s :: struct {
    _index:                    s32;
    _span_pos0:                *void;
    _span_cb0:                 *void;
    error:                     s32;
    reason:                    *u8;
    error_pos:                 *u8;
    data:                      *void;
    _current:                  *void;
    content_length:            u64;
    type:                      u8;
    method:                    u8;
    http_major:                u8;
    http_minor:                u8;
    header_state:              u8;
    lenient_flags:             u16;
    upgrade:                   u8;
    finish:                    u8;
    flags:                     u16;
    status_code:               u16;
    initial_message_completed: u8;
    settings:                  *void;
}

llhttp_errno :: enum s32 {
    OK                                :: 0;
    INTERNAL                          :: 1;
    STRICT                            :: 2;
    CR_EXPECTED                       :: 25;
    LF_EXPECTED                       :: 3;
    UNEXPECTED_CONTENT_LENGTH         :: 4;
    UNEXPECTED_SPACE                  :: 30;
    CLOSED_CONNECTION                 :: 5;
    INVALID_METHOD                    :: 6;
    INVALID_URL                       :: 7;
    INVALID_CONSTANT                  :: 8;
    INVALID_VERSION                   :: 9;
    INVALID_HEADER_TOKEN              :: 10;
    INVALID_CONTENT_LENGTH            :: 11;
    INVALID_CHUNK_SIZE                :: 12;
    INVALID_STATUS                    :: 13;
    INVALID_EOF_STATE                 :: 14;
    INVALID_TRANSFER_ENCODING         :: 15;
    CB_MESSAGE_BEGIN                  :: 16;
    CB_HEADERS_COMPLETE               :: 17;
    CB_MESSAGE_COMPLETE               :: 18;
    CB_CHUNK_HEADER                   :: 19;
    CB_CHUNK_COMPLETE                 :: 20;
    PAUSED                            :: 21;
    PAUSED_UPGRADE                    :: 22;
    PAUSED_H2_UPGRADE                 :: 23;
    USER                              :: 24;
    CB_URL_COMPLETE                   :: 26;
    CB_STATUS_COMPLETE                :: 27;
    CB_METHOD_COMPLETE                :: 32;
    CB_VERSION_COMPLETE               :: 33;
    CB_HEADER_FIELD_COMPLETE          :: 28;
    CB_HEADER_VALUE_COMPLETE          :: 29;
    CB_CHUNK_EXTENSION_NAME_COMPLETE  :: 34;
    CB_CHUNK_EXTENSION_VALUE_COMPLETE :: 35;
    CB_RESET                          :: 31;
    CB_PROTOCOL_COMPLETE              :: 38;

    HPE_OK                                :: OK;
    HPE_INTERNAL                          :: INTERNAL;
    HPE_STRICT                            :: STRICT;
    HPE_CR_EXPECTED                       :: CR_EXPECTED;
    HPE_LF_EXPECTED                       :: LF_EXPECTED;
    HPE_UNEXPECTED_CONTENT_LENGTH         :: UNEXPECTED_CONTENT_LENGTH;
    HPE_UNEXPECTED_SPACE                  :: UNEXPECTED_SPACE;
    HPE_CLOSED_CONNECTION                 :: CLOSED_CONNECTION;
    HPE_INVALID_METHOD                    :: INVALID_METHOD;
    HPE_INVALID_URL                       :: INVALID_URL;
    HPE_INVALID_CONSTANT                  :: INVALID_CONSTANT;
    HPE_INVALID_VERSION                   :: INVALID_VERSION;
    HPE_INVALID_HEADER_TOKEN              :: INVALID_HEADER_TOKEN;
    HPE_INVALID_CONTENT_LENGTH            :: INVALID_CONTENT_LENGTH;
    HPE_INVALID_CHUNK_SIZE                :: INVALID_CHUNK_SIZE;
    HPE_INVALID_STATUS                    :: INVALID_STATUS;
    HPE_INVALID_EOF_STATE                 :: INVALID_EOF_STATE;
    HPE_INVALID_TRANSFER_ENCODING         :: INVALID_TRANSFER_ENCODING;
    HPE_CB_MESSAGE_BEGIN                  :: CB_MESSAGE_BEGIN;
    HPE_CB_HEADERS_COMPLETE               :: CB_HEADERS_COMPLETE;
    HPE_CB_MESSAGE_COMPLETE               :: CB_MESSAGE_COMPLETE;
    HPE_CB_CHUNK_HEADER                   :: CB_CHUNK_HEADER;
    HPE_CB_CHUNK_COMPLETE                 :: CB_CHUNK_COMPLETE;
    HPE_PAUSED                            :: PAUSED;
    HPE_PAUSED_UPGRADE                    :: PAUSED_UPGRADE;
    HPE_PAUSED_H2_UPGRADE                 :: PAUSED_H2_UPGRADE;
    HPE_USER                              :: USER;
    HPE_CB_URL_COMPLETE                   :: CB_URL_COMPLETE;
    HPE_CB_STATUS_COMPLETE                :: CB_STATUS_COMPLETE;
    HPE_CB_METHOD_COMPLETE                :: CB_METHOD_COMPLETE;
    HPE_CB_VERSION_COMPLETE               :: CB_VERSION_COMPLETE;
    HPE_CB_HEADER_FIELD_COMPLETE          :: CB_HEADER_FIELD_COMPLETE;
    HPE_CB_HEADER_VALUE_COMPLETE          :: CB_HEADER_VALUE_COMPLETE;
    HPE_CB_CHUNK_EXTENSION_NAME_COMPLETE  :: CB_CHUNK_EXTENSION_NAME_COMPLETE;
    HPE_CB_CHUNK_EXTENSION_VALUE_COMPLETE :: CB_CHUNK_EXTENSION_VALUE_COMPLETE;
    HPE_CB_RESET                          :: CB_RESET;
    HPE_CB_PROTOCOL_COMPLETE              :: CB_PROTOCOL_COMPLETE;
}

llhttp_errno_t :: llhttp_errno;

llhttp_flags :: enum s32 {
    CONNECTION_KEEP_ALIVE :: 1;
    CONNECTION_CLOSE      :: 2;
    CONNECTION_UPGRADE    :: 4;
    CHUNKED               :: 8;
    UPGRADE               :: 16;
    CONTENT_LENGTH        :: 32;
    SKIPBODY              :: 64;
    TRAILING              :: 128;
    TRANSFER_ENCODING     :: 512;

    F_CONNECTION_KEEP_ALIVE :: CONNECTION_KEEP_ALIVE;
    F_CONNECTION_CLOSE      :: CONNECTION_CLOSE;
    F_CONNECTION_UPGRADE    :: CONNECTION_UPGRADE;
    F_CHUNKED               :: CHUNKED;
    F_UPGRADE               :: UPGRADE;
    F_CONTENT_LENGTH        :: CONTENT_LENGTH;
    F_SKIPBODY              :: SKIPBODY;
    F_TRAILING              :: TRAILING;
    F_TRANSFER_ENCODING     :: TRANSFER_ENCODING;
}

llhttp_flags_t :: llhttp_flags;

llhttp_lenient_flags :: enum s32 {
    HEADERS                   :: 1;
    CHUNKED_LENGTH            :: 2;
    KEEP_ALIVE                :: 4;
    TRANSFER_ENCODING         :: 8;
    VERSION                   :: 16;
    DATA_AFTER_CLOSE          :: 32;
    OPTIONAL_LF_AFTER_CR      :: 64;
    OPTIONAL_CRLF_AFTER_CHUNK :: 128;
    OPTIONAL_CR_BEFORE_LF     :: 256;
    SPACES_AFTER_CHUNK_SIZE   :: 512;

    LENIENT_HEADERS                   :: HEADERS;
    LENIENT_CHUNKED_LENGTH            :: CHUNKED_LENGTH;
    LENIENT_KEEP_ALIVE                :: KEEP_ALIVE;
    LENIENT_TRANSFER_ENCODING         :: TRANSFER_ENCODING;
    LENIENT_VERSION                   :: VERSION;
    LENIENT_DATA_AFTER_CLOSE          :: DATA_AFTER_CLOSE;
    LENIENT_OPTIONAL_LF_AFTER_CR      :: OPTIONAL_LF_AFTER_CR;
    LENIENT_OPTIONAL_CRLF_AFTER_CHUNK :: OPTIONAL_CRLF_AFTER_CHUNK;
    LENIENT_OPTIONAL_CR_BEFORE_LF     :: OPTIONAL_CR_BEFORE_LF;
    LENIENT_SPACES_AFTER_CHUNK_SIZE   :: SPACES_AFTER_CHUNK_SIZE;
}

llhttp_lenient_flags_t :: llhttp_lenient_flags;

llhttp_type :: enum s32 {
    BOTH     :: 0;
    REQUEST  :: 1;
    RESPONSE :: 2;

    HTTP_BOTH     :: BOTH;
    HTTP_REQUEST  :: REQUEST;
    HTTP_RESPONSE :: RESPONSE;
}

llhttp_type_t :: llhttp_type;

llhttp_method :: enum s32 {
    DELETE        :: 0;
    GET           :: 1;
    HEAD          :: 2;
    POST          :: 3;
    PUT           :: 4;
    CONNECT       :: 5;
    OPTIONS       :: 6;
    TRACE         :: 7;
    COPY          :: 8;
    LOCK          :: 9;
    MKCOL         :: 10;
    MOVE          :: 11;
    PROPFIND      :: 12;
    PROPPATCH     :: 13;
    SEARCH        :: 14;
    UNLOCK        :: 15;
    BIND          :: 16;
    REBIND        :: 17;
    UNBIND        :: 18;
    ACL           :: 19;
    REPORT        :: 20;
    MKACTIVITY    :: 21;
    CHECKOUT      :: 22;
    MERGE         :: 23;
    MSEARCH       :: 24;
    NOTIFY        :: 25;
    SUBSCRIBE     :: 26;
    UNSUBSCRIBE   :: 27;
    PATCH         :: 28;
    PURGE         :: 29;
    MKCALENDAR    :: 30;
    LINK          :: 31;
    UNLINK        :: 32;
    SOURCE        :: 33;
    PRI           :: 34;
    DESCRIBE      :: 35;
    ANNOUNCE      :: 36;
    SETUP         :: 37;
    PLAY          :: 38;
    PAUSE         :: 39;
    TEARDOWN      :: 40;
    GET_PARAMETER :: 41;
    SET_PARAMETER :: 42;
    REDIRECT      :: 43;
    RECORD        :: 44;
    FLUSH         :: 45;
    QUERY         :: 46;

    HTTP_DELETE        :: DELETE;
    HTTP_GET           :: GET;
    HTTP_HEAD          :: HEAD;
    HTTP_POST          :: POST;
    HTTP_PUT           :: PUT;
    HTTP_CONNECT       :: CONNECT;
    HTTP_OPTIONS       :: OPTIONS;
    HTTP_TRACE         :: TRACE;
    HTTP_COPY          :: COPY;
    HTTP_LOCK          :: LOCK;
    HTTP_MKCOL         :: MKCOL;
    HTTP_MOVE          :: MOVE;
    HTTP_PROPFIND      :: PROPFIND;
    HTTP_PROPPATCH     :: PROPPATCH;
    HTTP_SEARCH        :: SEARCH;
    HTTP_UNLOCK        :: UNLOCK;
    HTTP_BIND          :: BIND;
    HTTP_REBIND        :: REBIND;
    HTTP_UNBIND        :: UNBIND;
    HTTP_ACL           :: ACL;
    HTTP_REPORT        :: REPORT;
    HTTP_MKACTIVITY    :: MKACTIVITY;
    HTTP_CHECKOUT      :: CHECKOUT;
    HTTP_MERGE         :: MERGE;
    HTTP_MSEARCH       :: MSEARCH;
    HTTP_NOTIFY        :: NOTIFY;
    HTTP_SUBSCRIBE     :: SUBSCRIBE;
    HTTP_UNSUBSCRIBE   :: UNSUBSCRIBE;
    HTTP_PATCH         :: PATCH;
    HTTP_PURGE         :: PURGE;
    HTTP_MKCALENDAR    :: MKCALENDAR;
    HTTP_LINK          :: LINK;
    HTTP_UNLINK        :: UNLINK;
    HTTP_SOURCE        :: SOURCE;
    HTTP_PRI           :: PRI;
    HTTP_DESCRIBE      :: DESCRIBE;
    HTTP_ANNOUNCE      :: ANNOUNCE;
    HTTP_SETUP         :: SETUP;
    HTTP_PLAY          :: PLAY;
    HTTP_PAUSE         :: PAUSE;
    HTTP_TEARDOWN      :: TEARDOWN;
    HTTP_GET_PARAMETER :: GET_PARAMETER;
    HTTP_SET_PARAMETER :: SET_PARAMETER;
    HTTP_REDIRECT      :: REDIRECT;
    HTTP_RECORD        :: RECORD;
    HTTP_FLUSH         :: FLUSH;
    HTTP_QUERY         :: QUERY;
}

llhttp_method_t :: llhttp_method;

llhttp_status :: enum s32 {
    CONTINUE                                   :: 100;
    SWITCHING_PROTOCOLS                        :: 101;
    PROCESSING                                 :: 102;
    EARLY_HINTS                                :: 103;
    RESPONSE_IS_STALE                          :: 110;
    REVALIDATION_FAILED                        :: 111;
    DISCONNECTED_OPERATION                     :: 112;
    HEURISTIC_EXPIRATION                       :: 113;
    MISCELLANEOUS_WARNING                      :: 199;
    OK                                         :: 200;
    CREATED                                    :: 201;
    ACCEPTED                                   :: 202;
    NON_AUTHORITATIVE_INFORMATION              :: 203;
    NO_CONTENT                                 :: 204;
    RESET_CONTENT                              :: 205;
    PARTIAL_CONTENT                            :: 206;
    MULTI_STATUS                               :: 207;
    ALREADY_REPORTED                           :: 208;
    TRANSFORMATION_APPLIED                     :: 214;
    IM_USED                                    :: 226;
    MISCELLANEOUS_PERSISTENT_WARNING           :: 299;
    MULTIPLE_CHOICES                           :: 300;
    MOVED_PERMANENTLY                          :: 301;
    FOUND                                      :: 302;
    SEE_OTHER                                  :: 303;
    NOT_MODIFIED                               :: 304;
    USE_PROXY                                  :: 305;
    SWITCH_PROXY                               :: 306;
    TEMPORARY_REDIRECT                         :: 307;
    PERMANENT_REDIRECT                         :: 308;
    BAD_REQUEST                                :: 400;
    UNAUTHORIZED                               :: 401;
    PAYMENT_REQUIRED                           :: 402;
    FORBIDDEN                                  :: 403;
    NOT_FOUND                                  :: 404;
    METHOD_NOT_ALLOWED                         :: 405;
    NOT_ACCEPTABLE                             :: 406;
    PROXY_AUTHENTICATION_REQUIRED              :: 407;
    REQUEST_TIMEOUT                            :: 408;
    CONFLICT                                   :: 409;
    GONE                                       :: 410;
    LENGTH_REQUIRED                            :: 411;
    PRECONDITION_FAILED                        :: 412;
    PAYLOAD_TOO_LARGE                          :: 413;
    URI_TOO_LONG                               :: 414;
    UNSUPPORTED_MEDIA_TYPE                     :: 415;
    RANGE_NOT_SATISFIABLE                      :: 416;
    EXPECTATION_FAILED                         :: 417;
    IM_A_TEAPOT                                :: 418;
    PAGE_EXPIRED                               :: 419;
    ENHANCE_YOUR_CALM                          :: 420;
    MISDIRECTED_REQUEST                        :: 421;
    UNPROCESSABLE_ENTITY                       :: 422;
    LOCKED                                     :: 423;
    FAILED_DEPENDENCY                          :: 424;
    TOO_EARLY                                  :: 425;
    UPGRADE_REQUIRED                           :: 426;
    PRECONDITION_REQUIRED                      :: 428;
    TOO_MANY_REQUESTS                          :: 429;
    REQUEST_HEADER_FIELDS_TOO_LARGE_UNOFFICIAL :: 430;
    REQUEST_HEADER_FIELDS_TOO_LARGE            :: 431;
    LOGIN_TIMEOUT                              :: 440;
    NO_RESPONSE                                :: 444;
    RETRY_WITH                                 :: 449;
    BLOCKED_BY_PARENTAL_CONTROL                :: 450;
    UNAVAILABLE_FOR_LEGAL_REASONS              :: 451;
    CLIENT_CLOSED_LOAD_BALANCED_REQUEST        :: 460;
    INVALID_X_FORWARDED_FOR                    :: 463;
    REQUEST_HEADER_TOO_LARGE                   :: 494;
    SSL_CERTIFICATE_ERROR                      :: 495;
    SSL_CERTIFICATE_REQUIRED                   :: 496;
    HTTP_REQUEST_SENT_TO_HTTPS_PORT            :: 497;
    INVALID_TOKEN                              :: 498;
    CLIENT_CLOSED_REQUEST                      :: 499;
    INTERNAL_SERVER_ERROR                      :: 500;
    NOT_IMPLEMENTED                            :: 501;
    BAD_GATEWAY                                :: 502;
    SERVICE_UNAVAILABLE                        :: 503;
    GATEWAY_TIMEOUT                            :: 504;
    HTTP_VERSION_NOT_SUPPORTED                 :: 505;
    VARIANT_ALSO_NEGOTIATES                    :: 506;
    INSUFFICIENT_STORAGE                       :: 507;
    LOOP_DETECTED                              :: 508;
    BANDWIDTH_LIMIT_EXCEEDED                   :: 509;
    NOT_EXTENDED                               :: 510;
    NETWORK_AUTHENTICATION_REQUIRED            :: 511;
    WEB_SERVER_UNKNOWN_ERROR                   :: 520;
    WEB_SERVER_IS_DOWN                         :: 521;
    CONNECTION_TIMEOUT                         :: 522;
    ORIGIN_IS_UNREACHABLE                      :: 523;
    TIMEOUT_OCCURED                            :: 524;
    SSL_HANDSHAKE_FAILED                       :: 525;
    INVALID_SSL_CERTIFICATE                    :: 526;
    RAILGUN_ERROR                              :: 527;
    SITE_IS_OVERLOADED                         :: 529;
    SITE_IS_FROZEN                             :: 530;
    IDENTITY_PROVIDER_AUTHENTICATION_ERROR     :: 561;
    NETWORK_READ_TIMEOUT                       :: 598;
    NETWORK_CONNECT_TIMEOUT                    :: 599;

    HTTP_STATUS_CONTINUE                                   :: CONTINUE;
    HTTP_STATUS_SWITCHING_PROTOCOLS                        :: SWITCHING_PROTOCOLS;
    HTTP_STATUS_PROCESSING                                 :: PROCESSING;
    HTTP_STATUS_EARLY_HINTS                                :: EARLY_HINTS;
    HTTP_STATUS_RESPONSE_IS_STALE                          :: RESPONSE_IS_STALE;
    HTTP_STATUS_REVALIDATION_FAILED                        :: REVALIDATION_FAILED;
    HTTP_STATUS_DISCONNECTED_OPERATION                     :: DISCONNECTED_OPERATION;
    HTTP_STATUS_HEURISTIC_EXPIRATION                       :: HEURISTIC_EXPIRATION;
    HTTP_STATUS_MISCELLANEOUS_WARNING                      :: MISCELLANEOUS_WARNING;
    HTTP_STATUS_OK                                         :: OK;
    HTTP_STATUS_CREATED                                    :: CREATED;
    HTTP_STATUS_ACCEPTED                                   :: ACCEPTED;
    HTTP_STATUS_NON_AUTHORITATIVE_INFORMATION              :: NON_AUTHORITATIVE_INFORMATION;
    HTTP_STATUS_NO_CONTENT                                 :: NO_CONTENT;
    HTTP_STATUS_RESET_CONTENT                              :: RESET_CONTENT;
    HTTP_STATUS_PARTIAL_CONTENT                            :: PARTIAL_CONTENT;
    HTTP_STATUS_MULTI_STATUS                               :: MULTI_STATUS;
    HTTP_STATUS_ALREADY_REPORTED                           :: ALREADY_REPORTED;
    HTTP_STATUS_TRANSFORMATION_APPLIED                     :: TRANSFORMATION_APPLIED;
    HTTP_STATUS_IM_USED                                    :: IM_USED;
    HTTP_STATUS_MISCELLANEOUS_PERSISTENT_WARNING           :: MISCELLANEOUS_PERSISTENT_WARNING;
    HTTP_STATUS_MULTIPLE_CHOICES                           :: MULTIPLE_CHOICES;
    HTTP_STATUS_MOVED_PERMANENTLY                          :: MOVED_PERMANENTLY;
    HTTP_STATUS_FOUND                                      :: FOUND;
    HTTP_STATUS_SEE_OTHER                                  :: SEE_OTHER;
    HTTP_STATUS_NOT_MODIFIED                               :: NOT_MODIFIED;
    HTTP_STATUS_USE_PROXY                                  :: USE_PROXY;
    HTTP_STATUS_SWITCH_PROXY                               :: SWITCH_PROXY;
    HTTP_STATUS_TEMPORARY_REDIRECT                         :: TEMPORARY_REDIRECT;
    HTTP_STATUS_PERMANENT_REDIRECT                         :: PERMANENT_REDIRECT;
    HTTP_STATUS_BAD_REQUEST                                :: BAD_REQUEST;
    HTTP_STATUS_UNAUTHORIZED                               :: UNAUTHORIZED;
    HTTP_STATUS_PAYMENT_REQUIRED                           :: PAYMENT_REQUIRED;
    HTTP_STATUS_FORBIDDEN                                  :: FORBIDDEN;
    HTTP_STATUS_NOT_FOUND                                  :: NOT_FOUND;
    HTTP_STATUS_METHOD_NOT_ALLOWED                         :: METHOD_NOT_ALLOWED;
    HTTP_STATUS_NOT_ACCEPTABLE                             :: NOT_ACCEPTABLE;
    HTTP_STATUS_PROXY_AUTHENTICATION_REQUIRED              :: PROXY_AUTHENTICATION_REQUIRED;
    HTTP_STATUS_REQUEST_TIMEOUT                            :: REQUEST_TIMEOUT;
    HTTP_STATUS_CONFLICT                                   :: CONFLICT;
    HTTP_STATUS_GONE                                       :: GONE;
    HTTP_STATUS_LENGTH_REQUIRED                            :: LENGTH_REQUIRED;
    HTTP_STATUS_PRECONDITION_FAILED                        :: PRECONDITION_FAILED;
    HTTP_STATUS_PAYLOAD_TOO_LARGE                          :: PAYLOAD_TOO_LARGE;
    HTTP_STATUS_URI_TOO_LONG                               :: URI_TOO_LONG;
    HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE                     :: UNSUPPORTED_MEDIA_TYPE;
    HTTP_STATUS_RANGE_NOT_SATISFIABLE                      :: RANGE_NOT_SATISFIABLE;
    HTTP_STATUS_EXPECTATION_FAILED                         :: EXPECTATION_FAILED;
    HTTP_STATUS_IM_A_TEAPOT                                :: IM_A_TEAPOT;
    HTTP_STATUS_PAGE_EXPIRED                               :: PAGE_EXPIRED;
    HTTP_STATUS_ENHANCE_YOUR_CALM                          :: ENHANCE_YOUR_CALM;
    HTTP_STATUS_MISDIRECTED_REQUEST                        :: MISDIRECTED_REQUEST;
    HTTP_STATUS_UNPROCESSABLE_ENTITY                       :: UNPROCESSABLE_ENTITY;
    HTTP_STATUS_LOCKED                                     :: LOCKED;
    HTTP_STATUS_FAILED_DEPENDENCY                          :: FAILED_DEPENDENCY;
    HTTP_STATUS_TOO_EARLY                                  :: TOO_EARLY;
    HTTP_STATUS_UPGRADE_REQUIRED                           :: UPGRADE_REQUIRED;
    HTTP_STATUS_PRECONDITION_REQUIRED                      :: PRECONDITION_REQUIRED;
    HTTP_STATUS_TOO_MANY_REQUESTS                          :: TOO_MANY_REQUESTS;
    HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE_UNOFFICIAL :: REQUEST_HEADER_FIELDS_TOO_LARGE_UNOFFICIAL;
    HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE            :: REQUEST_HEADER_FIELDS_TOO_LARGE;
    HTTP_STATUS_LOGIN_TIMEOUT                              :: LOGIN_TIMEOUT;
    HTTP_STATUS_NO_RESPONSE                                :: NO_RESPONSE;
    HTTP_STATUS_RETRY_WITH                                 :: RETRY_WITH;
    HTTP_STATUS_BLOCKED_BY_PARENTAL_CONTROL                :: BLOCKED_BY_PARENTAL_CONTROL;
    HTTP_STATUS_UNAVAILABLE_FOR_LEGAL_REASONS              :: UNAVAILABLE_FOR_LEGAL_REASONS;
    HTTP_STATUS_CLIENT_CLOSED_LOAD_BALANCED_REQUEST        :: CLIENT_CLOSED_LOAD_BALANCED_REQUEST;
    HTTP_STATUS_INVALID_X_FORWARDED_FOR                    :: INVALID_X_FORWARDED_FOR;
    HTTP_STATUS_REQUEST_HEADER_TOO_LARGE                   :: REQUEST_HEADER_TOO_LARGE;
    HTTP_STATUS_SSL_CERTIFICATE_ERROR                      :: SSL_CERTIFICATE_ERROR;
    HTTP_STATUS_SSL_CERTIFICATE_REQUIRED                   :: SSL_CERTIFICATE_REQUIRED;
    HTTP_STATUS_HTTP_REQUEST_SENT_TO_HTTPS_PORT            :: HTTP_REQUEST_SENT_TO_HTTPS_PORT;
    HTTP_STATUS_INVALID_TOKEN                              :: INVALID_TOKEN;
    HTTP_STATUS_CLIENT_CLOSED_REQUEST                      :: CLIENT_CLOSED_REQUEST;
    HTTP_STATUS_INTERNAL_SERVER_ERROR                      :: INTERNAL_SERVER_ERROR;
    HTTP_STATUS_NOT_IMPLEMENTED                            :: NOT_IMPLEMENTED;
    HTTP_STATUS_BAD_GATEWAY                                :: BAD_GATEWAY;
    HTTP_STATUS_SERVICE_UNAVAILABLE                        :: SERVICE_UNAVAILABLE;
    HTTP_STATUS_GATEWAY_TIMEOUT                            :: GATEWAY_TIMEOUT;
    HTTP_STATUS_HTTP_VERSION_NOT_SUPPORTED                 :: HTTP_VERSION_NOT_SUPPORTED;
    HTTP_STATUS_VARIANT_ALSO_NEGOTIATES                    :: VARIANT_ALSO_NEGOTIATES;
    HTTP_STATUS_INSUFFICIENT_STORAGE                       :: INSUFFICIENT_STORAGE;
    HTTP_STATUS_LOOP_DETECTED                              :: LOOP_DETECTED;
    HTTP_STATUS_BANDWIDTH_LIMIT_EXCEEDED                   :: BANDWIDTH_LIMIT_EXCEEDED;
    HTTP_STATUS_NOT_EXTENDED                               :: NOT_EXTENDED;
    HTTP_STATUS_NETWORK_AUTHENTICATION_REQUIRED            :: NETWORK_AUTHENTICATION_REQUIRED;
    HTTP_STATUS_WEB_SERVER_UNKNOWN_ERROR                   :: WEB_SERVER_UNKNOWN_ERROR;
    HTTP_STATUS_WEB_SERVER_IS_DOWN                         :: WEB_SERVER_IS_DOWN;
    HTTP_STATUS_CONNECTION_TIMEOUT                         :: CONNECTION_TIMEOUT;
    HTTP_STATUS_ORIGIN_IS_UNREACHABLE                      :: ORIGIN_IS_UNREACHABLE;
    HTTP_STATUS_TIMEOUT_OCCURED                            :: TIMEOUT_OCCURED;
    HTTP_STATUS_SSL_HANDSHAKE_FAILED                       :: SSL_HANDSHAKE_FAILED;
    HTTP_STATUS_INVALID_SSL_CERTIFICATE                    :: INVALID_SSL_CERTIFICATE;
    HTTP_STATUS_RAILGUN_ERROR                              :: RAILGUN_ERROR;
    HTTP_STATUS_SITE_IS_OVERLOADED                         :: SITE_IS_OVERLOADED;
    HTTP_STATUS_SITE_IS_FROZEN                             :: SITE_IS_FROZEN;
    HTTP_STATUS_IDENTITY_PROVIDER_AUTHENTICATION_ERROR     :: IDENTITY_PROVIDER_AUTHENTICATION_ERROR;
    HTTP_STATUS_NETWORK_READ_TIMEOUT                       :: NETWORK_READ_TIMEOUT;
    HTTP_STATUS_NETWORK_CONNECT_TIMEOUT                    :: NETWORK_CONNECT_TIMEOUT;
}

llhttp_status_t :: llhttp_status;

llhttp_t :: llhttp__internal_t;
llhttp_settings_t :: llhttp_settings_s;

llhttp_data_cb :: #type (unknown0: *llhttp_t, at: *u8, length: u64) -> s32 #c_call;
llhttp_cb :: #type (unknown0: *llhttp_t) -> s32 #c_call;

llhttp_settings_s :: struct {
    /* Possible return values 0, -1, `HPE_PAUSED` */
    on_message_begin:                  llhttp_cb;

    /* Possible return values 0, -1, HPE_USER */
    on_protocol:                       llhttp_data_cb;
    on_url:                            llhttp_data_cb;
    on_status:                         llhttp_data_cb;
    on_method:                         llhttp_data_cb;
    on_version:                        llhttp_data_cb;
    on_header_field:                   llhttp_data_cb;
    on_header_value:                   llhttp_data_cb;
    on_chunk_extension_name:           llhttp_data_cb;
    on_chunk_extension_value:          llhttp_data_cb;

    /* Possible return values:
    * 0  - Proceed normally
    * 1  - Assume that request/response has no body, and proceed to parsing the
    *      next message
    * 2  - Assume absence of body (as above) and make `llhttp_execute()` return
    *      `HPE_PAUSED_UPGRADE`
    * -1 - Error
    * `HPE_PAUSED`
    */
    on_headers_complete:               llhttp_cb;

    /* Possible return values 0, -1, HPE_USER */
    on_body:                           llhttp_data_cb;

    /* Possible return values 0, -1, `HPE_PAUSED` */
    on_message_complete:               llhttp_cb;
    on_protocol_complete:              llhttp_cb;
    on_url_complete:                   llhttp_cb;
    on_status_complete:                llhttp_cb;
    on_method_complete:                llhttp_cb;
    on_version_complete:               llhttp_cb;
    on_header_field_complete:          llhttp_cb;
    on_header_value_complete:          llhttp_cb;
    on_chunk_extension_name_complete:  llhttp_cb;
    on_chunk_extension_value_complete: llhttp_cb;

    /* When on_chunk_header is called, the current chunk length is stored
    * in parser->content_length.
    * Possible return values 0, -1, `HPE_PAUSED`
    */
    on_chunk_header:                   llhttp_cb;
    on_chunk_complete:                 llhttp_cb;
    on_reset:                          llhttp_cb;
}

/* Initialize the parser with specific type and user settings.
*
* NOTE: lifetime of `settings` has to be at least the same as the lifetime of
* the `parser` here. In practice, `settings` has to be either a static
* variable or be allocated with `malloc`, `new`, etc.
*/
llhttp_init :: (parser: *llhttp_t, type: llhttp_type_t, settings: *llhttp_settings_t) -> void #foreign libllhttp;

llhttp_get_type :: (parser: *llhttp_t) -> u8 #foreign libllhttp;

llhttp_get_http_major :: (parser: *llhttp_t) -> u8 #foreign libllhttp;

llhttp_get_http_minor :: (parser: *llhttp_t) -> u8 #foreign libllhttp;

llhttp_get_method :: (parser: *llhttp_t) -> u8 #foreign libllhttp;

llhttp_get_status_code :: (parser: *llhttp_t) -> s32 #foreign libllhttp;

llhttp_get_upgrade :: (parser: *llhttp_t) -> u8 #foreign libllhttp;

/* Reset an already initialized parser back to the start state, preserving the
* existing parser type, callback settings, user data, and lenient flags.
*/
llhttp_reset :: (parser: *llhttp_t) -> void #foreign libllhttp;

/* Initialize the settings object */
llhttp_settings_init :: (settings: *llhttp_settings_t) -> void #foreign libllhttp;

/* Parse full or partial request/response, invoking user callbacks along the
* way.
*
* If any of `llhttp_data_cb` returns errno not equal to `HPE_OK` - the parsing
* interrupts, and such errno is returned from `llhttp_execute()`. If
* `HPE_PAUSED` was used as a errno, the execution can be resumed with
* `llhttp_resume()` call.
*
* In a special case of CONNECT/Upgrade request/response `HPE_PAUSED_UPGRADE`
* is returned after fully parsing the request/response. If the user wishes to
* continue parsing, they need to invoke `llhttp_resume_after_upgrade()`.
*
* NOTE: if this function ever returns a non-pause type error, it will continue
* to return the same error upon each successive call up until `llhttp_init()`
* is called.
*/
llhttp_execute :: (parser: *llhttp_t, data: *u8, len: u64) -> llhttp_errno_t #foreign libllhttp;

/* This method should be called when the other side has no further bytes to
* send (e.g. shutdown of readable side of the TCP connection.)
*
* Requests without `Content-Length` and other messages might require treating
* all incoming bytes as the part of the body, up to the last byte of the
* connection. This method will invoke `on_message_complete()` callback if the
* request was terminated safely. Otherwise a error code would be returned.
*/
llhttp_finish :: (parser: *llhttp_t) -> llhttp_errno_t #foreign libllhttp;

/* Returns `1` if the incoming message is parsed until the last byte, and has
* to be completed by calling `llhttp_finish()` on EOF
*/
llhttp_message_needs_eof :: (parser: *llhttp_t) -> s32 #foreign libllhttp;

/* Returns `1` if there might be any other messages following the last that was
* successfully parsed.
*/
llhttp_should_keep_alive :: (parser: *llhttp_t) -> s32 #foreign libllhttp;

/* Make further calls of `llhttp_execute()` return `HPE_PAUSED` and set
* appropriate error reason.
*
* Important: do not call this from user callbacks! User callbacks must return
* `HPE_PAUSED` if pausing is required.
*/
llhttp_pause :: (parser: *llhttp_t) -> void #foreign libllhttp;

/* Might be called to resume the execution after the pause in user's callback.
* See `llhttp_execute()` above for details.
*
* Call this only if `llhttp_execute()` returns `HPE_PAUSED`.
*/
llhttp_resume :: (parser: *llhttp_t) -> void #foreign libllhttp;

/* Might be called to resume the execution after the pause in user's callback.
* See `llhttp_execute()` above for details.
*
* Call this only if `llhttp_execute()` returns `HPE_PAUSED_UPGRADE`
*/
llhttp_resume_after_upgrade :: (parser: *llhttp_t) -> void #foreign libllhttp;

/* Returns the latest return error */
llhttp_get_errno :: (parser: *llhttp_t) -> llhttp_errno_t #foreign libllhttp;

/* Returns the verbal explanation of the latest returned error.
*
* Note: User callback should set error reason when returning the error. See
* `llhttp_set_error_reason()` for details.
*/
llhttp_get_error_reason :: (parser: *llhttp_t) -> *u8 #foreign libllhttp;

/* Assign verbal description to the returned error. Must be called in user
* callbacks right before returning the errno.
*
* Note: `HPE_USER` error code might be useful in user callbacks.
*/
llhttp_set_error_reason :: (parser: *llhttp_t, reason: *u8) -> void #foreign libllhttp;

/* Returns the pointer to the last parsed byte before the returned error. The
* pointer is relative to the `data` argument of `llhttp_execute()`.
*
* Note: this method might be useful for counting the number of parsed bytes.
*/
llhttp_get_error_pos :: (parser: *llhttp_t) -> *u8 #foreign libllhttp;

/* Returns textual name of error code */
llhttp_errno_name :: (err: llhttp_errno_t) -> *u8 #foreign libllhttp;

/* Returns textual name of HTTP method */
llhttp_method_name :: (method: llhttp_method_t) -> *u8 #foreign libllhttp;

/* Returns textual name of HTTP status */
llhttp_status_name :: (status: llhttp_status_t) -> *u8 #foreign libllhttp;

/* Enables/disables lenient header value parsing (disabled by default).
*
* Lenient parsing disables header value token checks, extending llhttp's
* protocol support to highly non-compliant clients/server. No
* `HPE_INVALID_HEADER_TOKEN` will be raised for incorrect header values when
* lenient parsing is "on".
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_headers :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of conflicting `Transfer-Encoding` and
* `Content-Length` headers (disabled by default).
*
* Normally `llhttp` would error when `Transfer-Encoding` is present in
* conjunction with `Content-Length`. This error is important to prevent HTTP
* request smuggling, but may be less desirable for small number of cases
* involving legacy servers.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_chunked_length :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of `Connection: close` and HTTP/1.0
* requests responses.
*
* Normally `llhttp` would error on (in strict mode) or discard (in loose mode)
* the HTTP request/response after the request/response with `Connection: close`
* and `Content-Length`. This is important to prevent cache poisoning attacks,
* but might interact badly with outdated and insecure clients. With this flag
* the extra request/response will be parsed normally.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* poisoning attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_keep_alive :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of `Transfer-Encoding` header.
*
* Normally `llhttp` would error when a `Transfer-Encoding` has `chunked` value
* and another value after it (either in a single header or in multiple
* headers whose value are internally joined using `, `).
* This is mandated by the spec to reliably determine request body size and thus
* avoid request smuggling.
* With this flag the extra value will be parsed normally.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_transfer_encoding :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of HTTP version.
*
* Normally `llhttp` would error when the HTTP version in the request or status line
* is not `0.9`, `1.0`, `1.1` or `2.0`.
* With this flag the invalid value will be parsed normally.
*
* **Enabling this flag can pose a security issue since you will allow unsupported
* HTTP versions. USE WITH CAUTION!**
*/
llhttp_set_lenient_version :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of additional data received after a message ends
* and keep-alive is disabled.
*
* Normally `llhttp` would error when additional unexpected data is received if the message
* contains the `Connection` header with `close` value.
* With this flag the extra data will discarded without throwing an error.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* poisoning attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_data_after_close :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of incomplete CRLF sequences.
*
* Normally `llhttp` would error when a CR is not followed by LF when terminating the
* request line, the status line, the headers or a chunk header.
* With this flag only a CR is required to terminate such sections.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_optional_lf_after_cr :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/*
* Enables/disables lenient handling of line separators.
*
* Normally `llhttp` would error when a LF is not preceded by CR when terminating the
* request line, the status line, the headers, a chunk header or a chunk data.
* With this flag only a LF is required to terminate such sections.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_optional_cr_before_lf :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of chunks not separated via CRLF.
*
* Normally `llhttp` would error when after a chunk data a CRLF is missing before
* starting a new chunk.
* With this flag the new chunk can start immediately after the previous one.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_optional_crlf_after_chunk :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

/* Enables/disables lenient handling of spaces after chunk size.
*
* Normally `llhttp` would error when after a chunk size is followed by one or more
* spaces are present instead of a CRLF or `;`.
* With this flag this check is disabled.
*
* **Enabling this flag can pose a security issue since you will be exposed to
* request smuggling attacks. USE WITH CAUTION!**
*/
llhttp_set_lenient_spaces_after_chunk_size :: (parser: *llhttp_t, enabled: s32) -> void #foreign libllhttp;

#scope_file


libllhttp :: #library,no_dll "bin/libllhttp";

