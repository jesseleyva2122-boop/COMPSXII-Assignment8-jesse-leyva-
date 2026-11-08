	.file	"cache_lab.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	traverse_row_major
	.type	traverse_row_major, @function
traverse_row_major:
.LFB26:
	.cfi_startproc
	endbr64
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L5
	mov	rdi, QWORD PTR matrix[rip]
	lea	r8, 0[0+rax*4]
	xor	edx, edx
	lea	r9, [rdi+rax*8]
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rax, QWORD PTR [rdi]
	lea	rsi, [r8+rax]
	.p2align 4,,10
	.p2align 3
.L4:
	movsx	rcx, DWORD PTR [rax]
	add	rax, 4
	add	rdx, rcx
	cmp	rsi, rax
	jne	.L4
	add	rdi, 8
	cmp	rdi, r9
	jne	.L3
	mov	rax, rdx
	ret
.L5:
	xor	edx, edx
	mov	rax, rdx
	ret
	.cfi_endproc
.LFE26:
	.size	traverse_row_major, .-traverse_row_major
	.p2align 4
	.globl	traverse_column_major
	.type	traverse_column_major, @function
traverse_column_major:
.LFB27:
	.cfi_startproc
	endbr64
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L12
	mov	r8, QWORD PTR matrix[rip]
	lea	r9, 0[0+rax*4]
	xor	esi, esi
	xor	edx, edx
	lea	rdi, [r8+rax*8]
	.p2align 4,,10
	.p2align 3
.L10:
	mov	rax, r8
	.p2align 4,,10
	.p2align 3
.L11:
	mov	rcx, QWORD PTR [rax]
	add	rax, 8
	movsx	rcx, DWORD PTR [rcx+rsi]
	add	rdx, rcx
	cmp	rdi, rax
	jne	.L11
	add	rsi, 4
	cmp	r9, rsi
	jne	.L10
	mov	rax, rdx
	ret
.L12:
	xor	edx, edx
	mov	rax, rdx
	ret
	.cfi_endproc
.LFE27:
	.size	traverse_column_major, .-traverse_column_major
	.p2align 4
	.globl	free_matrix
	.type	free_matrix, @function
free_matrix:
.LFB25:
	.cfi_startproc
	endbr64
	mov	rdi, QWORD PTR matrix[rip]
	test	rdi, rdi
	je	.L23
	mov	eax, DWORD PTR current_size[rip]
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	test	eax, eax
	jle	.L16
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L18:
	mov	rdi, QWORD PTR [rdi+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	mov	rdi, QWORD PTR matrix[rip]
	jg	.L18
.L16:
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE25:
	.size	free_matrix, .-free_matrix
	.p2align 4
	.globl	allocate_matrix
	.type	allocate_matrix, @function
allocate_matrix:
.LFB24:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r15d, edi
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	DWORD PTR 12[rsp], edi
	call	free_matrix
	test	r15d, r15d
	jle	.L28
	movsx	rbp, r15d
	lea	rdi, 0[0+rbp*8]
	call	malloc@PLT
	mov	QWORD PTR matrix[rip], rax
	mov	rbx, rax
	test	rax, rax
	je	.L28
	sal	rbp, 2
	lea	r12d, [r15+r15]
	xor	r13d, r13d
	.p2align 4,,10
	.p2align 3
.L33:
	mov	rdi, rbp
	mov	r14d, r13d
	call	malloc@PLT
	mov	QWORD PTR [rbx+r13*8], rax
	test	rax, rax
	je	.L40
	.p2align 4,,10
	.p2align 3
.L32:
	mov	edx, r14d
	mov	esi, r14d
	add	r14d, 1
	add	rax, 4
	imul	rdx, rdx, 1374389535
	shr	rdx, 37
	imul	edx, edx, 100
	sub	esi, edx
	mov	DWORD PTR -4[rax], esi
	cmp	r14d, r15d
	jne	.L32
	lea	r15d, 1[r14]
	add	r13, 1
	cmp	r15d, r12d
	jne	.L33
	mov	eax, DWORD PTR 12[rsp]
	mov	DWORD PTR current_size[rip], eax
	mov	eax, 1
.L26:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L40:
	.cfi_restore_state
	mov	DWORD PTR current_size[rip], r13d
	call	free_matrix
.L28:
	xor	eax, eax
	jmp	.L26
	.cfi_endproc
.LFE24:
	.size	allocate_matrix, .-allocate_matrix
	.p2align 4
	.globl	measure_time
	.type	measure_time, @function
measure_time:
.LFB28:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rsi
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	clock@PLT
	mov	rbx, rax
	call	r12
	mov	QWORD PTR 0[rbp], rax
	call	clock@PLT
	pxor	xmm0, xmm0
	sub	rax, rbx
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	cvtsi2sd	xmm0, rax
	pop	r12
	.cfi_def_cfa_offset 8
	divsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, QWORD PTR .LC1[rip]
	ret
	.cfi_endproc
.LFE28:
	.size	measure_time, .-measure_time
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"\n--- Matrix Size: %d x %d ---\n"
	.align 8
.LC3:
	.string	"Failed to allocate matrix of size %d\n"
	.align 8
.LC4:
	.string	"Row-major:    %.4f ms (sum: %lld)\n"
	.align 8
.LC5:
	.string	"Column-major: %.4f ms (sum: %lld)\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"Ratio (col/row): %.2fx\n"
.LC8:
	.string	"ERROR: Sums do not match!\n"
	.text
	.p2align 4
	.globl	run_test
	.type	run_test, @function
run_test:
.LFB29:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	ecx, edi
	mov	edx, edi
	lea	rsi, .LC2[rip]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	ebx, edi
	mov	edi, 2
	sub	rsp, 48
	.cfi_def_cfa_offset 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, ebx
	call	allocate_matrix
	test	eax, eax
	je	.L54
	lea	rsi, 24[rsp]
	lea	rdi, traverse_row_major[rip]
	call	measure_time
	lea	rsi, 32[rsp]
	lea	rdi, traverse_column_major[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	measure_time
	mov	r12, QWORD PTR 24[rsp]
	mov	edi, 2
	lea	rsi, .LC4[rip]
	movq	rbx, xmm0
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	eax, 1
	mov	rdx, r12
	call	__printf_chk@PLT
	mov	rbp, QWORD PTR 32[rsp]
	movq	xmm0, rbx
	lea	rsi, .LC5[rip]
	mov	edi, 2
	mov	eax, 1
	mov	rdx, rbp
	call	__printf_chk@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	pxor	xmm0, xmm0
	comisd	xmm1, xmm0
	ja	.L55
.L46:
	cmp	r12, rbp
	jne	.L56
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L53
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	free_matrix
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
	movq	xmm0, rbx
	mov	edi, 2
	mov	eax, 1
	divsd	xmm0, xmm1
	lea	rsi, .LC7[rip]
	call	__printf_chk@PLT
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L54:
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L53
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	mov	edx, ebx
	lea	rsi, .LC3[rip]
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 24
	mov	edi, 2
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
.L53:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L56:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 26
	mov	esi, 1
	lea	rdi, .LC8[rip]
	call	fwrite@PLT
	call	free_matrix
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE29:
	.size	run_test, .-run_test
	.section	.rodata.str1.1
.LC9:
	.string	"Cache Behavior Lab"
.LC10:
	.string	"=================="
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Comparing row-major vs column-major matrix traversal"
	.section	.rodata.str1.1
.LC13:
	.string	"\n=================="
.LC14:
	.string	"Tests complete."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB30:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	rdi, .LC9[rip]
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 40
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	rbx, rsp
	lea	rbp, 16[rsp]
	call	puts@PLT
	lea	rdi, .LC10[rip]
	call	puts@PLT
	lea	rdi, .LC11[rip]
	call	puts@PLT
	movdqa	xmm0, XMMWORD PTR .LC12[rip]
	movaps	XMMWORD PTR [rsp], xmm0
.L58:
	mov	edi, DWORD PTR [rbx]
	add	rbx, 4
	call	run_test
	cmp	rbx, rbp
	jne	.L58
	lea	rdi, .LC13[rip]
	call	puts@PLT
	lea	rdi, .LC14[rip]
	call	puts@PLT
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L62
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L62:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE30:
	.size	main, .-main
	.globl	current_size
	.bss
	.align 4
	.type	current_size, @object
	.size	current_size, 4
current_size:
	.zero	4
	.globl	matrix
	.align 8
	.type	matrix, @object
	.size	matrix, 8
matrix:
	.zero	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC1:
	.long	0
	.long	1083129856
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	1000
	.long	2000
	.long	4000
	.long	8000
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
