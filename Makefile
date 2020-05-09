CFLAGS := -fno-stack-protector -D_FORTIFY_SOURCE=0 -g

overflow: overflow.c
	$(CC) -o overflow $(CFLAGS) -Wl,-no_pie,-allow_stack_execute overflow.c
	codesign -s 'Personal Code Signing Certificate' overflow

llvm: overflow.c
	$(CC) -o overflow.ll -S -emit-llvm $(CFLAGS) -Wl,-no_pie,-allow_stack_execute overflow.c
	codesign -s 'Personal Code Signing Certificate' overflow.ll

linux: overflow.c
	$(CC) -o linux.overflow $(CFLAGS) -z execstack overflow.c

macos: overflow.c
	$(CC) -o macos.overflow $(CFLAGS) -Wl,-no_pie,-allow_stack_execute overflow.c

macos-llvm: overflow.c
	$(CC) -o macos.overflow.ll -S -emit-llvm $(CFLAGS) overflow.c

clean:
	rm -f overflow overflow.ll
