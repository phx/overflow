CFLAGS := -fno-stack-protector

overflow: overflow.c
	$(CC) -o overflow $(CFLAGS) overflow.c
	codesign -s 'Personal Code Signing Certificate' overflow

llvm: overflow.c
	$(CC) -o overflow.ll -S -emit-llvm $(CFLAGS) overflow.c
	codesign -s 'Personal Code Signing Certificate' overflow.ll

clean:
	rm -f overflow overflow.llvm
