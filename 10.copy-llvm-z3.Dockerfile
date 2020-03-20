copy --from=0 /z3/ z3/
run cd z3/build && ninja install -j10

copy --from=0 /llvm-project/ llvm-project/
run cd llvm-project/build && ninja install -j10
