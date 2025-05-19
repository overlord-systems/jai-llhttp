#run build();

build :: () {

    set_build_options_dc(.{do_output=false});

	options := get_build_options();

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

DECLARATIONS_TO_OMIT :: string.[
];

generate_bindings :: () -> bool {

    output_filename: string;
    opts: Generate_Bindings_Options;

    {
        using opts;

        #if OS == .WINDOWS {
            strip_flags = 0;
            output_filename = "windows/windows.jai";
            array_add(*libpaths, "windows/bin");

            // DLL provided by user not in bin, so use our own footer not generated library declaration
            footer = FOOTER_WIN;
            generate_library_declarations = false;

        } else #if OS == .LINUX {
            strip_flags = 0;
            output_filename = "linux/linux.jai";
            array_add(*libpaths, "linux/bin");
        } /*else #if OS == .MACOS {
            strip_flags = 0;
            output_filename = "macos/macos.jai";
        }*/ else {
            assert(false, "this OS is currently unsupported. You might be able to add support for it though!");
        }

        array_add(*libnames, "libllhttp");
        array_add(*include_paths, "include");
        array_add(*source_files, "include/llhttp.h");

        // Names are very generic and one is 'llhttp_t', so doesn't feel
        // worth it to strip this
        // array_add(*strip_prefixes, "llhttp_");

        visitor = llhttp_visitor;
        generate_compile_time_struct_checks = false;
    }

    return generate_bindings(opts, output_filename);
}

llhttp_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl && array_find(DECLARATIONS_TO_OMIT, decl.name) {
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }
    return .RECURSE;
}

#scope_file

#import "Basic";
#import "Compiler";
#import "BuildCpp";
#import "Check";
#import "Bindings_Generator";
#import "File";

FOOTER_WIN :: #string END

libllhttp :: #library,no_dll "bin/libllhttp";

END
