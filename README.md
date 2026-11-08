# Assignment 8: Cache Behavior Lab
Jesse Leyva

Completed row-major and column-major matrix summation, measured across 1000, 2000, 4000, and 8000 square matrices at `-O0`, `-O2`, and `-O3`.

## Submission files

- [cache_lab.c](cache_lab.c): both traversals, allocation failure cleanup, and timing instrumentation.
- [analysis.md](analysis.md): measurements, optimization comparison, Compiler Explorer screenshots, RISC/CISC comparison, and cache explanation.
- [evidence/](evidence/): raw timing logs, CSV, assembly, screenshots, environment, and check results.
- [tests.c](tests.c): correctness and memory lifecycle tests, including injected allocation failures.
- [benchmark.py](benchmark.py): reproduces three runs per optimization level.

## Run

```bash
gcc -std=c11 -Wall -Wextra -Wpedantic cache_lab.c -o cache_lab
./cache_lab
python3 benchmark.py
```

## Check memory and correctness

```bash
gcc -O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer tests.c -o cache_tests
ASAN_OPTIONS=detect_leaks=0 ./cache_tests
```

LeakSanitizer is disabled here because its process inspection is blocked in the measurement environment. Allocation accounting independently checks that every tracked allocation is freed, including partial failures. On a machine that supports LeakSanitizer, try `ASAN_OPTIONS=detect_leaks=1 ./cache_tests`.

Measured times depend on hardware and system conditions. All committed timings came from actual runs in the environment identified in the analysis. The final-project connection is a proposed warehouse-routing application.
