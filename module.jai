#if OS == .WINDOWS {
    #load "windows/windows.jai";
} else #if OS == .LINUX {
    #load "linux/linux.jai";
} else #if OS == .MACOS {
    #load "macos/macos.jai";
} else {
    #assert false "this OS is not currently supported by llhttp. You must generate bindings for it. Check the README for information.";
}
