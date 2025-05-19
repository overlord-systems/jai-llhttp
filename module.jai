#if OS == .WINDOWS {
    #load "windows/windows.jai";
} else #if OS == .LINUX {
    #load "linux/linux.jai";
}
