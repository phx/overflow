# overflow

LibTerm Segfault:

```sh
curl -skLO https://raw.githubusercontent.com/phx/overflow/master/overflow.c
clang -v -S -emit-llvm -fno-stack-protector -o overflow.ll overflow.c
mv overflow.ll ~/Library/bin/
overflow
[type a bunch of text]
[segfault]
```

