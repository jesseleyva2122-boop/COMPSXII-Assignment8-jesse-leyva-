	.file	"cache_lab.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	allocate_matrix
	.type	allocate_matrix, @function
allocate_matrix:
.LFB39:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	mov	ebx, edi
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	mov	rdi, QWORD PTR matrix[rip]
	test	rdi, rdi
	je	.L2
	mov	eax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L3
	xor	ebp, ebp
	.p2align 4,,10
	.p2align 3
.L5:
	mov	rdi, QWORD PTR [rdi+rbp*8]
	add	rbp, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebp
	mov	rdi, QWORD PTR matrix[rip]
	jg	.L5
.L3:
	call	free@PLT
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
.L2:
	test	ebx, ebx
	jle	.L7
	movsx	r14, ebx
	lea	rdi, 0[0+r14*8]
	mov	QWORD PTR 40[rsp], r14
	call	malloc@PLT
	mov	QWORD PTR matrix[rip], rax
	mov	r12, rax
	test	rax, rax
	je	.L7
	lea	rax, 0[0+r14*4]
	movdqa	xmm3, XMMWORD PTR .LC2[rip]
	mov	r13d, ebx
	mov	ebp, ebx
	pxor	xmm5, xmm5
	mov	QWORD PTR 24[rsp], rax
	lea	eax, -1[rbx]
	shr	r13d, 2
	movdqa	xmm6, xmm5
	mov	DWORD PTR 36[rsp], eax
	sal	r13, 4
	and	ebp, -4
	pcmpgtd	xmm6, xmm3
	xor	r14d, r14d
	.p2align 4,,10
	.p2align 3
.L16:
	mov	rdi, QWORD PTR 24[rsp]
	movaps	XMMWORD PTR [rsp], xmm6
	mov	r15d, r14d
	call	malloc@PLT
	movdqa	xmm6, XMMWORD PTR [rsp]
	pxor	xmm5, xmm5
	movdqa	xmm8, XMMWORD PTR .LC1[rip]
	test	rax, rax
	mov	QWORD PTR [r12+r14*8], rax
	movdqa	xmm3, XMMWORD PTR .LC2[rip]
	mov	rdx, rax
	je	.L28
	cmp	DWORD PTR 36[rsp], 2
	jbe	.L17
	movd	xmm7, r14d
	movdqa	xmm4, XMMWORD PTR .LC0[rip]
	lea	rsi, [rax+r13]
	pshufd	xmm7, xmm7, 0
	.p2align 4,,10
	.p2align 3
.L14:
	movdqa	xmm1, xmm4
	movdqa	xmm2, xmm5
	movdqa	xmm9, xmm6
	add	rax, 16
	paddd	xmm1, xmm7
	movdqa	xmm10, xmm6
	paddd	xmm4, xmm8
	pcmpgtd	xmm2, xmm1
	pmuludq	xmm9, xmm1
	movdqa	xmm0, xmm1
	pmuludq	xmm0, xmm3
	pmuludq	xmm2, xmm3
	paddq	xmm2, xmm9
	movdqa	xmm9, xmm5
	psllq	xmm2, 32
	paddq	xmm0, xmm2
	movdqa	xmm2, xmm1
	psrlq	xmm2, 32
	pcmpgtd	xmm9, xmm2
	pmuludq	xmm10, xmm2
	pmuludq	xmm2, xmm3
	pmuludq	xmm9, xmm3
	paddq	xmm9, xmm10
	psllq	xmm9, 32
	paddq	xmm2, xmm9
	shufps	xmm0, xmm2, 221
	pshufd	xmm0, xmm0, 216
	psrad	xmm0, 5
	movdqa	xmm2, xmm0
	pslld	xmm2, 1
	paddd	xmm2, xmm0
	pslld	xmm2, 3
	paddd	xmm0, xmm2
	pslld	xmm0, 2
	psubd	xmm1, xmm0
	movups	XMMWORD PTR -16[rax], xmm1
	cmp	rax, rsi
	jne	.L14
	mov	eax, ebp
	cmp	ebx, ebp
	je	.L15
.L13:
	lea	esi, [r15+rax]
	movsx	r10, eax
	mov	r9, rsi
	imul	rsi, rsi, 1374389535
	lea	rdi, 0[0+r10*4]
	shr	rsi, 37
	imul	esi, esi, 100
	sub	r9d, esi
	lea	esi, 1[rax]
	mov	DWORD PTR [rdx+r10*4], r9d
	cmp	ebx, esi
	jle	.L15
	lea	r9d, [rsi+r15]
	add	eax, 2
	mov	rsi, r9
	imul	r9, r9, 1374389535
	shr	r9, 37
	imul	r9d, r9d, 100
	sub	esi, r9d
	mov	DWORD PTR 4[rdx+rdi], esi
	cmp	ebx, eax
	jle	.L15
	lea	esi, [rax+r15]
	mov	rax, rsi
	imul	rsi, rsi, 1374389535
	shr	rsi, 37
	imul	esi, esi, 100
	sub	eax, esi
	mov	DWORD PTR 8[rdx+rdi], eax
.L15:
	add	r14, 1
	cmp	QWORD PTR 40[rsp], r14
	jne	.L16
	mov	DWORD PTR current_size[rip], ebx
	mov	eax, 1
.L1:
	add	rsp, 56
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
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	xor	eax, eax
	jmp	.L13
.L28:
	mov	DWORD PTR current_size[rip], r14d
	test	r14d, r14d
	je	.L10
	xor	ebx, ebx
	jmp	.L11
.L29:
	mov	r12, QWORD PTR matrix[rip]
.L11:
	mov	rdi, QWORD PTR [r12+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	jg	.L29
.L10:
	mov	rdi, QWORD PTR matrix[rip]
	call	free@PLT
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
.L7:
	xor	eax, eax
	jmp	.L1
	.cfi_endproc
.LFE39:
	.size	allocate_matrix, .-allocate_matrix
	.p2align 4
	.globl	free_matrix
	.type	free_matrix, @function
free_matrix:
.LFB40:
	.cfi_startproc
	endbr64
	mov	rdi, QWORD PTR matrix[rip]
	test	rdi, rdi
	je	.L39
	mov	eax, DWORD PTR current_size[rip]
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	test	eax, eax
	jle	.L32
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L34:
	mov	rdi, QWORD PTR [rdi+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	mov	rdi, QWORD PTR matrix[rip]
	jg	.L34
.L32:
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE40:
	.size	free_matrix, .-free_matrix
	.p2align 4
	.globl	traverse_row_major
	.type	traverse_row_major, @function
traverse_row_major:
.LFB41:
	.cfi_startproc
	endbr64
	mov	r8d, DWORD PTR current_size[rip]
	test	r8d, r8d
	jle	.L51
	mov	rdi, QWORD PTR matrix[rip]
	mov	r9d, r8d
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movsx	rax, r8d
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	shr	r9d, 2
	mov	ebp, r8d
	mov	r11d, r8d
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	lea	r10, [rdi+rax*8]
	lea	ebx, -1[r8]
	sal	r9, 4
	and	ebp, -4
	xor	ecx, ecx
	pxor	xmm4, xmm4
	and	r11d, 3
	.p2align 4,,10
	.p2align 3
.L44:
	mov	rsi, QWORD PTR [rdi]
	cmp	ebx, 2
	jbe	.L52
.L49:
	mov	rax, rsi
	lea	rdx, [rsi+r9]
	pxor	xmm1, xmm1
	.p2align 4,,10
	.p2align 3
.L47:
	movdqu	xmm0, XMMWORD PTR [rax]
	movdqa	xmm2, xmm4
	add	rax, 16
	pcmpgtd	xmm2, xmm0
	movdqa	xmm3, xmm0
	punpckldq	xmm3, xmm2
	punpckhdq	xmm0, xmm2
	paddq	xmm1, xmm3
	paddq	xmm1, xmm0
	cmp	rax, rdx
	jne	.L47
	movdqa	xmm0, xmm1
	psrldq	xmm0, 8
	paddq	xmm1, xmm0
	movq	rax, xmm1
	add	rcx, rax
	test	r11d, r11d
	je	.L45
	mov	eax, ebp
.L50:
	movsx	rdx, eax
	lea	r12, 0[0+rdx*4]
	movsx	rdx, DWORD PTR [rsi+rdx*4]
	add	rcx, rdx
	lea	edx, 1[rax]
	cmp	edx, r8d
	jge	.L46
	movsx	rdx, DWORD PTR 4[rsi+r12]
	add	eax, 2
	add	rcx, rdx
	cmp	r8d, eax
	jle	.L46
	movsx	rax, DWORD PTR 8[rsi+r12]
	add	rcx, rax
.L46:
	add	rdi, 8
	cmp	rdi, r10
	jne	.L44
.L42:
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rax, rcx
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
	add	rdi, 8
	cmp	rdi, r10
	je	.L42
	mov	rsi, QWORD PTR [rdi]
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L52:
	xor	eax, eax
	jmp	.L50
.L51:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	xor	eax, eax
	ret
	.cfi_endproc
.LFE41:
	.size	traverse_row_major, .-traverse_row_major
	.p2align 4
	.globl	traverse_column_major
	.type	traverse_column_major, @function
traverse_column_major:
.LFB42:
	.cfi_startproc
	endbr64
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L63
	mov	r8, QWORD PTR matrix[rip]
	lea	r9, 0[0+rax*4]
	xor	esi, esi
	xor	edx, edx
	lea	rdi, [r8+rax*8]
	.p2align 4,,10
	.p2align 3
.L61:
	mov	rax, r8
	.p2align 4,,10
	.p2align 3
.L62:
	mov	rcx, QWORD PTR [rax]
	add	rax, 8
	movsx	rcx, DWORD PTR [rcx+rsi]
	add	rdx, rcx
	cmp	rdi, rax
	jne	.L62
	add	rsi, 4
	cmp	r9, rsi
	jne	.L61
	mov	rax, rdx
	ret
.L63:
	xor	edx, edx
	mov	rax, rdx
	ret
	.cfi_endproc
.LFE42:
	.size	traverse_column_major, .-traverse_column_major
	.p2align 4
	.globl	measure_time
	.type	measure_time, @function
measure_time:
.LFB43:
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
	divsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, QWORD PTR .LC4[rip]
	ret
	.cfi_endproc
.LFE43:
	.size	measure_time, .-measure_time
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"\n--- Matrix Size: %d x %d ---\n"
	.align 8
.LC6:
	.string	"Failed to allocate matrix of size %d\n"
	.align 8
.LC7:
	.string	"Row-major:    %.4f ms (sum: %lld)\n"
	.align 8
.LC8:
	.string	"Column-major: %.4f ms (sum: %lld)\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC10:
	.string	"Ratio (col/row): %.2fx\n"
.LC11:
	.string	"ERROR: Sums do not match!\n"
	.text
	.p2align 4
	.globl	run_test
	.type	run_test, @function
run_test:
.LFB44:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	ecx, edi
	mov	edx, edi
	xor	eax, eax
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	rsi, .LC5[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	ebx, edi
	mov	edi, 2
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	call	__printf_chk@PLT
	mov	edi, ebx
	call	allocate_matrix
	test	eax, eax
	je	.L104
	call	clock@PLT
	mov	edi, DWORD PTR current_size[rip]
	mov	rbx, rax
	test	edi, edi
	jle	.L90
	mov	rsi, QWORD PTR matrix[rip]
	mov	r8d, edi
	movsx	rax, edi
	mov	r12d, edi
	shr	r8d, 2
	mov	r10d, edi
	lea	r11d, -1[rdi]
	and	r12d, -4
	lea	r9, [rsi+rax*8]
	sal	r8, 4
	xor	ebp, ebp
	and	r10d, 3
	pxor	xmm4, xmm4
	.p2align 4,,10
	.p2align 3
.L70:
	mov	rcx, QWORD PTR [rsi]
	cmp	r11d, 2
	jbe	.L91
.L75:
	mov	rax, rcx
	lea	rdx, [rcx+r8]
	pxor	xmm1, xmm1
	.p2align 4,,10
	.p2align 3
.L73:
	movdqu	xmm0, XMMWORD PTR [rax]
	movdqa	xmm2, xmm4
	add	rax, 16
	pcmpgtd	xmm2, xmm0
	movdqa	xmm3, xmm0
	punpckldq	xmm3, xmm2
	punpckhdq	xmm0, xmm2
	paddq	xmm1, xmm3
	paddq	xmm1, xmm0
	cmp	rax, rdx
	jne	.L73
	movdqa	xmm0, xmm1
	psrldq	xmm0, 8
	paddq	xmm1, xmm0
	movq	rax, xmm1
	add	rbp, rax
	test	r10d, r10d
	je	.L71
	mov	eax, r12d
.L76:
	movsx	rdx, eax
	lea	r13, 0[0+rdx*4]
	movsx	rdx, DWORD PTR [rcx+rdx*4]
	add	rbp, rdx
	lea	edx, 1[rax]
	cmp	edx, edi
	jge	.L72
	movsx	rdx, DWORD PTR 4[rcx+r13]
	add	eax, 2
	add	rbp, rdx
	cmp	eax, edi
	jge	.L72
	movsx	rax, DWORD PTR 8[rcx+r13]
	add	rbp, rax
.L72:
	add	rsi, 8
	cmp	rsi, r9
	jne	.L70
.L69:
	call	clock@PLT
	pxor	xmm0, xmm0
	sub	rax, rbx
	cvtsi2sd	xmm0, rax
	divsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	clock@PLT
	mov	r12, rax
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L92
	mov	rdi, QWORD PTR matrix[rip]
	lea	r8, 0[0+rax*4]
	xor	ecx, ecx
	xor	ebx, ebx
	lea	rsi, [rdi+rax*8]
	.p2align 4,,10
	.p2align 3
.L78:
	mov	rax, rdi
	.p2align 4,,10
	.p2align 3
.L79:
	mov	rdx, QWORD PTR [rax]
	add	rax, 8
	movsx	rdx, DWORD PTR [rdx+rcx]
	add	rbx, rdx
	cmp	rsi, rax
	jne	.L79
	add	rcx, 4
	cmp	r8, rcx
	jne	.L78
.L77:
	call	clock@PLT
	pxor	xmm0, xmm0
	mov	rdx, rbp
	lea	rsi, .LC7[rip]
	sub	rax, r12
	mov	edi, 2
	cvtsi2sd	xmm0, rax
	divsd	xmm0, QWORD PTR .LC3[rip]
	mov	eax, 1
	mulsd	xmm0, QWORD PTR .LC4[rip]
	movq	r12, xmm0
	movsd	xmm0, QWORD PTR 8[rsp]
	call	__printf_chk@PLT
	movq	xmm0, r12
	mov	rdx, rbx
	lea	rsi, .LC8[rip]
	mov	edi, 2
	mov	eax, 1
	call	__printf_chk@PLT
	movsd	xmm5, QWORD PTR 8[rsp]
	pxor	xmm0, xmm0
	comisd	xmm5, xmm0
	ja	.L105
.L80:
	cmp	rbp, rbx
	jne	.L106
	mov	rdi, QWORD PTR matrix[rip]
	test	rdi, rdi
	je	.L67
	mov	eax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L87
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L89:
	mov	rdi, QWORD PTR [rdi+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	mov	rdi, QWORD PTR matrix[rip]
	jg	.L89
.L87:
	call	free@PLT
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
.L67:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L71:
	.cfi_restore_state
	add	rsi, 8
	cmp	rsi, r9
	je	.L69
	mov	rcx, QWORD PTR [rsi]
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L91:
	xor	eax, eax
	jmp	.L76
.L105:
	movq	xmm0, r12
	mov	edi, 2
	mov	eax, 1
	divsd	xmm0, xmm5
	lea	rsi, .LC10[rip]
	call	__printf_chk@PLT
	jmp	.L80
.L104:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	edx, ebx
	mov	edi, 2
	pop	rbx
	.cfi_def_cfa_offset 32
	lea	rsi, .LC6[rip]
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
.L90:
	.cfi_restore_state
	xor	ebp, ebp
	jmp	.L69
.L92:
	xor	ebx, ebx
	jmp	.L77
.L106:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 26
	mov	esi, 1
	lea	rdi, .LC11[rip]
	call	fwrite@PLT
	cmp	QWORD PTR matrix[rip], 0
	je	.L83
	xor	ebx, ebx
	cmp	DWORD PTR current_size[rip], 0
	jle	.L85
.L84:
	mov	rax, QWORD PTR matrix[rip]
	mov	rdi, QWORD PTR [rax+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	jg	.L84
.L85:
	mov	rdi, QWORD PTR matrix[rip]
	call	free@PLT
	xor	edx, edx
	xor	ecx, ecx
	mov	QWORD PTR matrix[rip], rdx
	mov	DWORD PTR current_size[rip], ecx
.L83:
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE44:
	.size	run_test, .-run_test
	.section	.rodata.str1.1
.LC12:
	.string	"Cache Behavior Lab"
.LC13:
	.string	"=================="
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Comparing row-major vs column-major matrix traversal"
	.section	.rodata.str1.1
.LC16:
	.string	"\n=================="
.LC17:
	.string	"Tests complete."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB45:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	rdi, .LC12[rip]
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
	lea	rdi, .LC13[rip]
	call	puts@PLT
	lea	rdi, .LC14[rip]
	call	puts@PLT
	movdqa	xmm0, XMMWORD PTR .LC15[rip]
	movaps	XMMWORD PTR [rsp], xmm0
.L108:
	mov	edi, DWORD PTR [rbx]
	add	rbx, 4
	call	run_test
	cmp	rbx, rbp
	jne	.L108
	lea	rdi, .LC16[rip]
	call	puts@PLT
	lea	rdi, .LC17[rip]
	call	puts@PLT
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L112
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L112:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE45:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC2:
	.long	1374389535
	.long	1374389535
	.long	1374389535
	.long	1374389535
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.align 8
.LC4:
	.long	0
	.long	1083129856
	.section	.rodata.cst16
	.align 16
.LC15:
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
