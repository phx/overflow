# iOS Buffer Overflow Testing

**LibTerm Segfault:**

```sh
curl -skLO https://raw.githubusercontent.com/phx/overflow/master/overflow.c
clang -v -S -emit-llvm -fno-stack-protector -o overflow.ll overflow.c
mv overflow.ll ~/Library/bin/
```

**Example:**
 
```
thewatchman $ overflow
dfgffddggf
dgghhhhh
dghhjjjhdffg
dghhjjjjjfddd
sfghhjjjjjhffdf
dgghhhhhgfddghlli: CommandLine Error: Option 'asm-instrumentation' registered more than once!
hhfatal error: error in backend: inconsistency in registered CommandLine options
dddd

0  libLLVM                  0x0000000129036f74 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 160
1  libLLVM                  0x0000000129037518 PrintStackTraceSignalHandler(void*) + 24
2  libLLVM                  0x0000000129033560 llvm::sys::RunSignalHandlers() + 420
3  libLLVM                  0x0000000129037b8c SignalHandler(int) + 528
4  libsystem_platform.dylib 0x00000001966b6884 <redacted> + 40
5  libsystem_pthread.dylib  0x00000001966ba288 pthread_exit + 64
6  ios_system               0x00000001053d10bc ios_getCommandStatus + 0
7  clang                    0x00000001113741b0 clang::CompilerInstance::getDiagnostics() const + 0
8  libLLVM                  0x0000000128edfa00 llvm::report_fatal_error(llvm::Twine const&, bool) + 136
9  libLLVM                  0x0000000128edf978 llvm::report_fatal_error(llvm::Twine const&, bool) + 0
10 libLLVM                  0x0000000128ea1304 (anonymous namespace)::CommandLineParser::addOption(llvm::cl::Option*, llvm::cl::SubCommand*) + 832
11 libLLVM                  0x0000000128e90700 (anonymous namespace)::CommandLineParser::addOption(llvm::cl::Option*) + 108
12 libLLVM                  0x0000000128e8dab4 llvm::cl::Option::addArgument() + 56
13 lli                      0x000000011cad3328 llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::done() + 36
14 lli                      0x000000011cad3050 llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::opt<char [20], llvm::cl::desc, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation>, llvm::cl::ValuesClass>(char const (&) [20], llvm::cl::desc const&, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation> const&, llvm::cl::ValuesClass const&) + 180
15 lli                      0x000000011ca6e78c llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::opt<char [20], llvm::cl::desc, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation>, llvm::cl::ValuesClass>(char const (&) [20], llvm::cl::desc const&, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation> const&, llvm::cl::ValuesClass const&) + 60
16 lli                      0x000000011caf668c __cxx_global_var_init + 892
17 lli                      0x000000011cb02038 _GLOBAL__sub_I_lli.cpp + 12
18 libdyld.dylib            0x00000001967bbf2c <redacted> + 136
19 libdyld.dylib            0x00000001967ae81c <redacted> + 96
20 libdyld.dylib            0x00000001967bbd88 <redacted> + 296
21 libdyld.dylib            0x00000001967af064 <redacted> + 92
22 libdyld.dylib            0x00000001967bc6a0 <redacted> + 612
23 libdyld.dylib            0x00000001967bc2a8 <redacted> + 848
24 libdyld.dylib            0x00000001967bdb74 <redacted> + 360
25 libdyld.dylib            0x00000001967b18d8 dlopen + 108
26 ios_system               0x00000001053d3e04 ios_system + 6912
27 LibTerm                  0x0000000104c08270 main + 112320
28 LibTerm                  0x0000000104c09a30 main + 118400
29 LibTerm                  0x0000000104c080f0 main + 111936
30 LibTerm                  0x0000000104bf3a80 main + 28368
31 LibTerm                  0x0000000104bf3d00 main + 29008
32 libdispatch.dylib        0x00000001966729a8 <redacted> + 24
33 libdispatch.dylib        0x0000000196673524 <redacted> + 16
34 libdispatch.dylib        0x000000019662856c <redacted> + 684
35 libdispatch.dylib        0x0000000196628bf8 <redacted> + 124
36 libsystem_pthread.dylib  0x00000001966c4b38 _pthread_wqthread + 212
37 libsystem_pthread.dylib  0x00000001966c7740 start_wqthread + 8
0  libLLVM                  0x0000000129036f74 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 160
1  libLLVM                  0x0000000129037518 PrintStackTraceSignalHandler(void*) + 24
2  libLLVM                  0x0000000129033560 llvm::sys::RunSignalHandlers() + 420
3  libLLVM                  0x0000000129037b8c SignalHandler(int) + 528
4  libsystem_platform.dylib 0x00000001966b6884 <redacted> + 40
5  libsystem_pthread.dylib  0x00000001966ba288 pthread_exit + 64
6  ios_system               0x00000001053d10bc ios_getCommandStatus + 0
7  clang                    0x00000001113741b0 clang::CompilerInstance::getDiagnostics() const + 0
8  libLLVM                  0x0000000128edfa00 llvm::report_fatal_error(llvm::Twine const&, bool) + 136
9  libLLVM                  0x0000000128edf978 llvm::report_fatal_error(llvm::Twine const&, bool) + 0
10 libLLVM                  0x0000000128ea1304 (anonymous namespace)::CommandLineParser::addOption(llvm::cl::Option*, llvm::cl::SubCommand*) + 832
11 libLLVM                  0x0000000128e90700 (anonymous namespace)::CommandLineParser::addOption(llvm::cl::Option*) + 108
12 libLLVM                  0x0000000128e8dab4 llvm::cl::Option::addArgument() + 56
13 lli                      0x000000011cad3328 llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::done() + 36
14 lli                      0x000000011cad3050 llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::opt<char [20], llvm::cl::desc, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation>, llvm::cl::ValuesClass>(char const (&) [20], llvm::cl::desc const&, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation> const&, llvm::cl::ValuesClass const&) + 180
15 lli                      0x000000011ca6e78c llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::opt<char [20], llvm::cl::desc, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation>, llvm::cl::ValuesClass>(char const (&) [20], llvm::cl::desc const&, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation> const&, llvm::cl::ValuesClass const&) + 60
16 lli                      0x000000011caf668c __cxx_global_var_init + 892
17 lli                      0x000000011cb02038 _GLOBAL__sub_I_lli.cpp + 12
18 libdyld.dylib            0x00000001967bbf2c <redacted> + 136
19 libdyld.dylib            0x00000001967ae81c <redacted> + 96
20 libdyld.dylib            0x00000001967bbd88 <redacted> + 296
21 libdyld.dylib            0x00000001967af064 <redacted> + 92
22 libdyld.dylib            0x00000001967bc6a0 <redacted> + 612
23 libdyld.dylib            0x00000001967bc2a8 <redacted> + 848
24 libdyld.dylib            0x00000001967bdb74 <redacted> + 360
25 libdyld.dylib            0x00000001967b18d8 dlopen + 108
26 ios_system               0x00000001053d3e04 ios_system + 6912
27 LibTerm                  0x0000000104c08270 main + 112320
28 LibTerm                  0x0000000104c09a30 main + 118400
29 LibTerm                  0x0000000104c080f0 main + 111936
30 LibTerm                  0x0000000104bf3a80 main + 28368
31 LibTerm                  0x0000000104bf3d00 main + 29008
32 libdispatch.dylib        0x00000001966729a8 <redacted> + 24
33 libdispatch.dylib        0x0000000196673524 <redacted> + 16
34 libdispatch.dylib        0x000000019662856c <redacted> + 684
35 libdispatch.dylib        0x0000000196628bf8 <redacted> + 124
36 libsystem_pthread.dylib  0x00000001966c4b38 _pthread_wqthread + 212
37 libsystem_pthread.dylib  0x00000001966c7740 start_wqthread + 8
0  libLLVM                  0x0000000129036f74 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 160
1  libLLVM                  0x0000000129037518 PrintStackTraceSignalHandler(void*) + 24
2  libLLVM                  0x0000000129033560 llvm::sys::RunSignalHandlers() + 420
3  libLLVM                  0x0000000129037b8c SignalHandler(int) + 528
4  libsystem_platform.dylib 0x00000001966b6884 <redacted> + 40
5  libsystem_pthread.dylib  0x00000001966ba288 pthread_exit + 64
6  ios_system               0x00000001053d10bc ios_getCommandStatus + 0
7  clang                    0x00000001113741b0 clang::CompilerInstance::getDiagnostics() const + 0
8  libLLVM                  0x0000000128edfa00 llvm::report_fatal_error(llvm::Twine const&, bool) + 136
9  libLLVM                  0x0000000128edf978 llvm::report_fatal_error(llvm::Twine const&, bool) + 0
10 libLLVM                  0x0000000128ea1304 (anonymous namespace)::CommandLineParser::addOption(llvm::cl::Option*, llvm::cl::SubCommand*) + 832
11 libLLVM                  0x0000000128e90700 (anonymous namespace)::CommandLineParser::addOption(llvm::cl::Option*) + 108
12 libLLVM                  0x0000000128e8dab4 llvm::cl::Option::addArgument() + 56
13 lli                      0x000000011cad3328 llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::done() + 36
14 lli                      0x000000011cad3050 llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::opt<char [20], llvm::cl::desc, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation>, llvm::cl::ValuesClass>(char const (&) [20], llvm::cl::desc const&, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation> const&, llvm::cl::ValuesClass const&) + 180
15 lli                      0x000000011ca6e78c llvm::cl::opt<llvm::MCTargetOptions::AsmInstrumentation, false, llvm::cl::parser<llvm::MCTargetOptions::AsmInstrumentation> >::opt<char [20], llvm::cl::desc, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation>, llvm::cl::ValuesClass>(char const (&) [20], llvm::cl::desc const&, llvm::cl::initializer<llvm::MCTargetOptions::AsmInstrumentation> const&, llvm::cl::ValuesClass const&) + 60
16 lli                      0x000000011caf668c __cxx_global_var_init + 892
17 lli                      0x000000011cb02038 _GLOBAL__sub_I_lli.cpp + 12
18 libdyld.dylib            0x00000001967bbf2c <redacted> + 136
19 libdyld.dylib            0x00000001967ae81c <redacted> + 96
20 libdyld.dylib            0x00000001967bbd88 <redacted> + 296
21 libdyld.dylib            0x00000001967af064 <redacted> + 92
22 libdyld.dylib            0x00000001967bc6a0 <redacted> + 612
23 libdyld.dylib            0x00000001967bc2a8 <redacted> + 848
24 libdyld.dylib            0x00000001967bdb74 <redacted> + 360
25 libdyld.dylib            0x00000001967b18d8 dlopen + 108
26 ios_system               0x00000001053d3e04 ios_system + 6912
27 LibTerm                  0x0000000104c08270 main + 112320
28 LibTerm                  0x0000000104c09a30 main + 118400
29 LibTerm                  0x0000000104c080f0 main + 111936
30 LibTerm                  0x0000000104bf3a80 main + 28368
31 LibTerm                  0x0000000104bf3d00 main + 29008
32 libdispatch.dylib        0x00000001966729a8 <redacted> + 24
33 libdispatch.dylib        0x0000000196673524 <redacted> + 16
34 libdispatch.dylib        0x000000019662856c <redacted> + 684
35 libdispatch.dylib        0x0000000196628bf8 <redacted> + 124
36 libsystem_pthread.dylib  0x00000001966c4b38 _pthread_wqthread + 212
37 libsystem_pthread.dylib  0x00000001966c7740 start_wqthread + 8
segmentation fault
```
