#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
static long fail_at = -1, calls = 0, live = 0;
static void *checked_malloc(size_t n) {
    if (calls++ == fail_at) return NULL;
    void *p = malloc(n); if (p) ++live; return p;
}
static void checked_free(void *p) { if (p) --live; free(p); }
#define malloc checked_malloc
#define free checked_free
#define main lab_main
#include "cache_lab.c"
#undef main
#undef malloc
#undef free
int main(void) {
    assert(traverse_row_major() == 0 && traverse_column_major() == 0);
    assert(!allocate_matrix(0)); assert(!allocate_matrix(-1));
    for (long k=0; k<9; ++k) {
        calls=0; fail_at=k;
        assert(!allocate_matrix(8));
        assert(matrix==NULL && current_size==0 && live==0);
        free_matrix(); assert(live==0);
    }
    fail_at=-1;
    int sizes[]={1,2,3,17,1000,2000,4000,8000};
    for (unsigned k=0; k<sizeof sizes/sizeof *sizes; ++k) {
        assert(allocate_matrix(sizes[k]));
        long long expected=0;
        for(int i=0;i<sizes[k];++i)for(int j=0;j<sizes[k];++j)expected+=(i+j)%100;
        assert(traverse_row_major()==expected);
        assert(traverse_column_major()==expected);
        free_matrix(); free_matrix(); assert(live==0);
    }
    assert(allocate_matrix(3)); assert(allocate_matrix(4));
    free_matrix(); assert(live==0);
    puts("PASS: exact sums, all four required sizes, empty/small cases, repeated allocation/free, and every allocation failure in an 8-row matrix; no tracked allocations remain.");
}
