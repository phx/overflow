CFLAGS := -fno-stack-protector -D_FORTIFY_SOURCE=0 -Wl,-no_pie,-allow_stack_execute -g

overflow: overflow.c
	$(CC) -o overflow $(CFLAGS) overflow.c
	codesign -s 'Personal Code Signing Certificate' overflow

llvm: overflow.c
	$(CC) -o overflow.ll -S -emit-llvm $(CFLAGS) overflow.c
	codesign -s 'Personal Code Signing Certificate' overflow.ll

macos:
	$(CC) -o macos.overflow $(CFLAGS) overflow.c

macos-llvm:
	$(CC) -o macos.overflow.ll -S -emit-llvm $(CFLAGS) overflow.c

clean:
	rm -f overflow overflow.ll
