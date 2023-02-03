	.file	"csort.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"table [%d] : [%s] ?= key[%s]\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4
	.globl	keyfromstring
	.type	keyfromstring, @function
keyfromstring:
.LFB28:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	debug(%rip), %r8d
	movq	lookuptable(%rip), %rdi
	testl	%r8d, %r8d
	jne	.L31
	movq	%rbp, %rsi
	call	strcmp@PLT
	movslq	%eax, %rbx
	movl	$1, %eax
	testl	%ebx, %ebx
	je	.L29
.L11:
	movslq	%eax, %r12
	leaq	lookuptable(%rip), %r13
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	xorl	%esi, %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movq	lookuptable(%rip), %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	movslq	%eax, %rbx
	testl	%ebx, %ebx
	je	.L29
	movl	debug(%rip), %esi
	movq	16+lookuptable(%rip), %rdi
	testl	%esi, %esi
	jne	.L32
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L17
	movl	$2, %eax
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%rdi, %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movq	16+lookuptable(%rip), %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L17
	movl	debug(%rip), %ecx
	movq	32+lookuptable(%rip), %rdi
	testl	%ecx, %ecx
	jne	.L33
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L16
	movl	$3, %eax
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%rdi, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movq	32+lookuptable(%rip), %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L16
	movl	debug(%rip), %edx
	movq	48+lookuptable(%rip), %rdi
	testl	%edx, %edx
	jne	.L34
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L15
	movl	$4, %eax
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L34:
	movq	%rdi, %rdx
	movl	$3, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movq	48+lookuptable(%rip), %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L15
	movl	debug(%rip), %eax
	movq	64+lookuptable(%rip), %rdi
	testl	%eax, %eax
	jne	.L35
.L7:
	movq	%rbp, %rsi
	movl	$4, %ebx
	leaq	lookuptable(%rip), %r13
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L3
.L8:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$-1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	movl	$4, %esi
	call	printf@PLT
	movq	64+lookuptable(%rip), %rdi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L17:
	movl	$1, %ebx
.L29:
	leaq	lookuptable(%rip), %r13
.L3:
	salq	$4, %rbx
	movl	8(%r13,%rbx), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movl	$2, %ebx
	leaq	lookuptable(%rip), %r13
	jmp	.L3
.L15:
	movl	$3, %ebx
	leaq	lookuptable(%rip), %r13
	jmp	.L3
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	keyfromstring.cold, @function
keyfromstring.cold:
.LFSB28:
.L36:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	addq	$1, %r12
	cmpl	$5, %r12d
	je	.L8
.L10:
	movq	%r12, %rax
	movq	%rbp, %rsi
	movslq	%r12d, %rbx
	salq	$4, %rax
	movq	0(%r13,%rax), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L36
	jmp	.L3
	.cfi_endproc
.LFE28:
	.text
	.size	keyfromstring, .-keyfromstring
	.section	.text.unlikely
	.size	keyfromstring.cold, .-keyfromstring.cold
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.1
.LC2:
	.string	"csort"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Try `%s --help' for more information.\n"
	.text
	.p2align 4
	.globl	usage
	.type	usage, @function
usage:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	testl	%edi, %edi
	je	.L38
	movq	stderr(%rip), %rdi
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
.L39:
	movl	%ebp, %edi
	call	exit@PLT
.L38:
	movq	stdout(%rip), %rdi
	leaq	README(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	jmp	.L39
	.cfi_endproc
.LFE29:
	.size	usage, .-usage
	.p2align 4
	.globl	error
	.type	error, @function
error:
.LFB30:
	.cfi_startproc
	testl	%edi, %edi
	je	.L42
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	movq	stdout(%rip), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	%ebp, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L42:
	.cfi_def_cfa_offset 8
	.cfi_restore 6
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	jmp	fprintf@PLT
	.cfi_endproc
.LFE30:
	.size	error, .-error
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"fatal: memory exhausted (xmalloc of %.ld bytes).\n"
	.text
	.p2align 4
	.globl	xmalloc
	.type	xmalloc, @function
xmalloc:
.LFB31:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	call	malloc@PLT
	testq	%rax, %rax
	je	.L49
	popq	%r12
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L49:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r12, %rdx
	leaq	.LC4(%rip), %rsi
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE31:
	.size	xmalloc, .-xmalloc
	.p2align 4
	.globl	xmemdup
	.type	xmemdup, @function
xmemdup:
.LFB32:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	movl	$1, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	movq	%r12, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	calloc@PLT
	testq	%rax, %rax
	je	.L53
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L53:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r12, %rdx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE32:
	.size	xmemdup, .-xmemdup
	.p2align 4
	.globl	xmemfree
	.type	xmemfree, @function
xmemfree:
.LFB33:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L54
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L54:
	ret
	.cfi_endproc
.LFE33:
	.size	xmemfree, .-xmemfree
	.p2align 4
	.globl	strdup
	.type	strdup, @function
strdup:
.LFB34:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strlen@PLT
	movl	$1, %esi
	leaq	1(%rax), %r12
	movq	%r12, %rdi
	call	calloc@PLT
	testq	%rax, %rax
	je	.L59
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L59:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r12, %rdx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE34:
	.size	strdup, .-strdup
	.p2align 4
	.globl	isneeded
	.type	isneeded, @function
isneeded:
.LFB35:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%esi, %edi
	setne	%al
	ret
	.cfi_endproc
.LFE35:
	.size	isneeded, .-isneeded
	.p2align 4
	.globl	getcolstats
	.type	getcolstats, @function
getcolstats:
.LFB36:
	.cfi_startproc
	movl	$-1, %eax
	cmpl	$2, %edi
	je	.L67
	cmpl	$4, %edi
	je	.L63
	cmpl	$1, %edi
	je	.L68
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	xorl	%edx, %edx
.L64:
	andl	$1, %esi
	cmovne	%edx, %eax
.L61:
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	testb	$4, %sil
	je	.L61
	xorl	%eax, %eax
	movl	$2, %edx
	movl	$1, %ecx
	testb	$2, %sil
	je	.L61
	movl	%ecx, %eax
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L67:
	movl	$1, %edx
	xorl	%ecx, %ecx
	testb	$2, %sil
	je	.L61
	movl	%ecx, %eax
	jmp	.L64
	.cfi_endproc
.LFE36:
	.size	getcolstats, .-getcolstats
	.p2align 4
	.globl	push
	.type	push, @function
push:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	testq	%rax, %rax
	je	.L79
	movq	(%rbx), %rdx
	movq	%rbp, (%rax)
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rax)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L79:
	.cfi_restore_state
	movl	$4, %edi
	call	exit@PLT
	.cfi_endproc
.LFE37:
	.size	push, .-push
	.p2align 4
	.globl	clear
	.type	clear, @function
clear:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L80
	movq	%rdi, %rbp
	.p2align 4,,10
	.p2align 3
.L82:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	movq	%rbx, 0(%rbp)
	testq	%rbx, %rbx
	jne	.L82
.L80:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	clear, .-clear
	.p2align 4
	.globl	scan
	.type	scan, @function
scan:
.LFB39:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L102
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L89:
	movq	0(%r13), %rdi
	testl	%r12d, %r12d
	js	.L90
	leaq	8(%rdi), %rbp
	xorl	%ebx, %ebx
	leaq	statcolumn(%rip), %r15
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L106:
	cmpl	%ebx, 4+statcolumn(%rip)
	je	.L91
.L92:
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, %r12d
	jl	.L105
.L93:
	cmpl	%ebx, (%r15)
	jne	.L106
.L91:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L92
	call	*%r14
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, %r12d
	jge	.L93
.L105:
	movq	0(%r13), %rdi
.L90:
	call	*%r14
	movq	8(%r13), %r13
	testq	%r13, %r13
	jne	.L89
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L102:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE39:
	.size	scan, .-scan
	.p2align 4
	.globl	key_init
	.type	key_init, @function
key_init:
.LFB40:
	.cfi_startproc
	pxor	%xmm0, %xmm0
	movq	%rdi, %rax
	movups	%xmm0, (%rdi)
	movl	$-1, (%rdi)
	ret
	.cfi_endproc
.LFE40:
	.size	key_init, .-key_init
	.p2align 4
	.globl	insertkey
	.type	insertkey, @function
insertkey:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, 8(%rsp)
	call	malloc@PLT
	testq	%rax, %rax
	je	.L116
	movdqu	(%rbx), %xmm0
	movq	8(%rsp), %rdx
	leaq	8(%rsp), %rcx
	movups	%xmm0, (%rax)
	testq	%rdx, %rdx
	je	.L110
.L111:
	movq	%rdx, %rcx
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L111
	addq	$8, %rcx
.L110:
	movq	%rax, (%rcx)
	movq	$0, 8(%rax)
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L116:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movl	$16, %edx
	leaq	.LC4(%rip), %rsi
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	insertkey, .-insertkey
	.p2align 4
	.globl	searchkey
	.type	searchkey, @function
searchkey:
.LFB42:
	.cfi_startproc
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L119:
	cmpl	%edi, (%rsi)
	je	.L121
	movq	8(%rsi), %rsi
.L123:
	testq	%rsi, %rsi
	jne	.L119
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L121:
	movl	%edi, %eax
	ret
	.cfi_endproc
.LFE42:
	.size	searchkey, .-searchkey
	.p2align 4
	.globl	freekeylist
	.type	freekeylist, @function
freekeylist:
.LFB43:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L132
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L126:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L126
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L132:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE43:
	.size	freekeylist, .-freekeylist
	.section	.rodata.str1.1
.LC5:
	.string	"list dump: "
.LC6:
	.string	"%ld,"
	.text
	.p2align 4
	.globl	keydump
	.type	keydump, @function
keydump:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	leaq	.LC5(%rip), %rdi
	call	printf@PLT
	movq	8(%rsp), %rax
	testq	%rax, %rax
	jne	.L143
.L136:
	movl	$10, %edi
	call	putchar@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L143:
	.cfi_restore_state
	leaq	8(%rsp), %rbx
	leaq	.LC6(%rip), %rbp
.L137:
	movl	(%rax), %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	(%rbx), %rax
	leaq	8(%rax), %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L136
	jmp	.L137
	.cfi_endproc
.LFE44:
	.size	keydump, .-keydump
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"strtoul: [%ld] - suffix is [%s]\n"
	.text
	.p2align 4
	.globl	parse_optarg
	.type	parse_optarg, @function
parse_optarg:
.LFB45:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$10, %edx
	movq	%rsi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	leaq	8(%rsp), %rsi
	call	strtol@PLT
	movl	%eax, (%rbx)
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L147
	movq	8(%rsp), %rax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L147:
	.cfi_restore_state
	movq	8(%rsp), %rdx
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	8(%rsp), %rax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE45:
	.size	parse_optarg, .-parse_optarg
	.section	.rodata.str1.1
.LC8:
	.string	"%c"
.LC9:
	.string	" Key length is [%d]\n"
	.text
	.p2align 4
	.globl	getfieldcount
	.type	getfieldcount, @function
getfieldcount:
.LFB46:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movsbl	%sil, %edx
	xorl	%eax, %eax
	leaq	.LC8(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	leaq	6(%rsp), %rbx
	movq	%rbx, %rdi
	call	sprintf@PLT
	movq	%rbp, %rdi
	call	strlen@PLT
	movl	$1, %esi
	leaq	1(%rax), %r12
	movq	%r12, %rdi
	call	calloc@PLT
	testq	%rax, %rax
	je	.L160
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	xorl	%r12d, %r12d
	call	memcpy@PLT
	leaq	8(%rsp), %rbp
	leaq	.LC9(%rip), %r13
	movq	%rax, 8(%rsp)
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L152:
	addl	$1, %r12d
.L150:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	strsep@PLT
	testq	%rax, %rax
	je	.L161
	cmpl	%r12d, keycolumn(%rip)
	jne	.L152
	movq	%rax, %rdi
	call	strlen@PLT
	movl	debug(%rip), %edx
	movl	%eax, keylength(%rip)
	testl	%edx, %edx
	je	.L152
	movl	%eax, %esi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L161:
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L148
	call	free@PLT
.L148:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L160:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r12, %rdx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE46:
	.size	getfieldcount, .-getfieldcount
	.section	.rodata.str1.1
.LC10:
	.string	""
.LC11:
	.string	"field[%d]=%f\n"
	.text
	.p2align 4
	.globl	parserecord
	.type	parserecord, @function
parserecord:
.LFB47:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	movsbl	%sil, %edx
	leaq	.LC8(%rip), %rsi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	leaq	6(%rsp), %r12
	movq	%r12, %rdi
	call	sprintf@PLT
	movq	%rbp, %rdi
	call	strlen@PLT
	movl	$1, %esi
	leaq	1(%rax), %r13
	movq	%r13, %rdi
	call	calloc@PLT
	testq	%rax, %rax
	je	.L173
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	xorl	%ebp, %ebp
	call	memcpy@PLT
	leaq	8(%rsp), %r13
	leaq	.LC10(%rip), %r14
	movq	%rax, 8(%rsp)
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L166:
	addl	$1, %ebp
	addq	$16, %rbx
.L164:
	movq	%r13, %rdi
	movq	%r12, %rsi
	call	strsep@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L174
	cmpb	$0, (%rdi)
	cmove	%r14, %rdi
	xorl	%esi, %esi
	call	strtod@PLT
	movl	debug(%rip), %eax
	movq	$0, 8(%rbx)
	movsd	%xmm0, (%rbx)
	testl	%eax, %eax
	je	.L166
	movl	%ebp, %esi
	leaq	.LC11(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L174:
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L168
	call	free@PLT
.L168:
	movl	%ebp, (%r15)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L173:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r13, %rdx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE47:
	.size	parserecord, .-parserecord
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"-----------------------------------------------"
	.section	.rodata.str1.1
.LC13:
	.string	"Key Column is [%d]\n"
.LC14:
	.string	"Nb Stat Columns is [%d]\n"
.LC15:
	.string	"Stat Columns are [%d] [%d]\n"
.LC16:
	.string	"flag stats is [%d]\n"
.LC17:
	.string	"fields count is [%d] \n"
.LC18:
	.string	"Nb stat values is [%d] \n"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"cmax: %d cmin: %d csum:%d ccnt:%d\n"
	.text
	.p2align 4
	.globl	prepcontext
	.type	prepcontext, @function
prepcontext:
.LFB48:
	.cfi_startproc
	movl	flagstats(%rip), %eax
	movl	%eax, %ecx
	movl	%eax, %r8d
	andl	$1, %ecx
	andl	$4, %r8d
	andl	$2, %eax
	leal	-1(%rcx), %edx
	movl	%edx, col_max(%rip)
	movl	%eax, %edx
	je	.L176
	movl	%ecx, col_min(%rip)
	testl	%r8d, %r8d
	jne	.L201
	xorl	%eax, %eax
	movl	$-1, %r9d
.L177:
	movl	%eax, col_cnt(%rip)
	movl	(%rdi), %eax
	movl	(%rsi), %edi
	movl	%r9d, col_sum(%rip)
	subl	$1, %eax
	movl	%eax, keycolumn(%rip)
	testl	%edi, %edi
	movl	$0, %eax
	cmovns	(%rsi), %eax
	movq	8(%rsi), %rsi
	subl	$1, %eax
	movl	%eax, statcolumn(%rip)
	testq	%rsi, %rsi
	je	.L178
	movl	(%rsi), %esi
	testl	%esi, %esi
	jle	.L178
	subl	$1, %esi
	cmpl	$-1, %eax
	setne	%al
	movl	%esi, 4+statcolumn(%rip)
	movzbl	%al, %eax
	addl	$1, %eax
	movl	%eax, nbstatcolumns(%rip)
	testl	%ecx, %ecx
	jne	.L180
.L203:
	movl	$3, %ecx
	movl	$2, %eax
	movl	$1, %esi
	movl	$0, nbstats(%rip)
.L181:
	testl	%edx, %edx
	je	.L182
	movl	%esi, nbstats(%rip)
	movl	%ecx, %eax
.L182:
	testl	%r8d, %r8d
	je	.L183
	movl	%eax, nbstats(%rip)
.L183:
	movl	debug(%rip), %eax
	testl	%eax, %eax
	jne	.L202
	ret
	.p2align 4,,10
	.p2align 3
.L201:
	leal	1(%rcx), %r9d
	leal	2(%rcx), %eax
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L178:
	movl	$-1, 4+statcolumn(%rip)
	cmpl	$-1, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, nbstatcolumns(%rip)
	testl	%ecx, %ecx
	je	.L203
.L180:
	movl	$4, %ecx
	movl	$3, %eax
	movl	$2, %esi
	movl	$1, nbstats(%rip)
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L176:
	movl	$-1, col_min(%rip)
	xorl	%eax, %eax
	testl	%r8d, %r8d
	setne	%al
	leal	-1(%rax), %r9d
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L202:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	movl	keycolumn(%rip), %esi
	leaq	.LC13(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	nbstatcolumns(%rip), %esi
	leaq	.LC14(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	4+statcolumn(%rip), %edx
	movl	statcolumn(%rip), %esi
	xorl	%eax, %eax
	leaq	.LC15(%rip), %rdi
	call	printf@PLT
	movl	flagstats(%rip), %esi
	leaq	.LC16(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	fieldcnt(%rip), %esi
	leaq	.LC17(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	nbstats(%rip), %esi
	leaq	.LC18(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	col_cnt(%rip), %r8d
	xorl	%eax, %eax
	movl	col_sum(%rip), %ecx
	movl	col_min(%rip), %edx
	movl	col_max(%rip), %esi
	leaq	.LC19(%rip), %rdi
	call	printf@PLT
	leaq	.LC12(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	puts@PLT
	.cfi_endproc
.LFE48:
	.size	prepcontext, .-prepcontext
	.section	.rodata.str1.1
.LC20:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"error opening input file : %s\n"
	.section	.rodata.str1.1
.LC22:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"error opening output file : %s\n"
	.section	.rodata.str1.1
.LC24:
	.string	"record before parsing : %s \n"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"line %d - fields count : %d - %s\n"
	.align 8
.LC26:
	.string	"no fields or invalid field separator \n"
	.align 8
.LC27:
	.string	"inconsistency in number of fields \n"
	.section	.rodata.str1.1
.LC28:
	.string	"HEAD Change from %g to %g \n"
	.text
	.p2align 4
	.globl	sort
	.type	sort, @function
sort:
.LFB49:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	leaq	.LC20(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$392, %rsp
	.cfi_def_cfa_offset 448
	movl	%edi, 36(%rsp)
	movq	%r14, %rdi
	call	fopen@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L259
	leaq	.LC22(%rip), %rsi
	movq	%r13, %rdi
	call	fopen@PLT
	movq	%rax, outfile(%rip)
	testq	%rax, %rax
	je	.L260
	leaq	80(%rsp), %rax
	movl	$0, 32(%rsp)
	movq	%rax, 8(%rsp)
	leaq	72(%rsp), %rax
	movq	$0, 16(%rsp)
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L206:
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rdi
	movl	$300, %esi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L261
	movl	debug(%rip), %ecx
	movl	$0, 72(%rsp)
	testl	%ecx, %ecx
	jne	.L262
.L207:
	movl	fieldcnt(%rip), %eax
	addl	$1, 32(%rsp)
	testl	%eax, %eax
	je	.L263
.L208:
	movslq	%eax, %rbx
	salq	$4, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L264
	movsbl	field_separator(%rip), %esi
	movq	40(%rsp), %rcx
	movq	%rax, %rdx
	movq	8(%rsp), %rdi
	call	parserecord
	movl	fieldcnt(%rip), %r14d
	testl	%r14d, %r14d
	je	.L265
	cmpl	72(%rsp), %r14d
	jne	.L211
	testl	%r14d, %r14d
	jle	.L220
	movl	statcolumn(%rip), %ebx
	leaq	8(%rbp), %r12
	xorl	%r13d, %r13d
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L216:
	addl	$1, %r13d
	movq	$0, (%r12)
	addq	$16, %r12
	cmpl	%r13d, %r14d
	je	.L220
.L219:
	cmpl	%r13d, %ebx
	je	.L215
	cmpl	%r13d, 4+statcolumn(%rip)
	jne	.L216
.L215:
	movslq	nbstats(%rip), %r8
	leaq	0(,%r8,8), %r15
	movq	%r15, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L266
	addl	$1, %r13d
	movq	%rax, (%r12)
	addq	$16, %r12
	cmpl	%r13d, %r14d
	jne	.L219
.L220:
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L258
	movq	%rbp, %xmm0
	movhps	16(%rsp), %xmm0
	movups	%xmm0, (%rax)
	movl	36(%rsp), %eax
	cmpl	$2, %eax
	je	.L221
	cmpl	$3, %eax
	je	.L222
	cmpl	$1, %eax
	je	.L267
.L223:
	movq	%rbx, 16(%rsp)
	jmp	.L206
	.p2align 4,,10
	.p2align 3
.L263:
	movsbl	field_separator(%rip), %esi
	movq	8(%rsp), %rdi
	call	getfieldcount
	movl	debug(%rip), %edx
	movl	%eax, fieldcnt(%rip)
	testl	%edx, %edx
	je	.L208
	movq	8(%rsp), %rcx
	movl	32(%rsp), %esi
	movl	%eax, %edx
	leaq	.LC25(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	fieldcnt(%rip), %eax
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L262:
	movq	8(%rsp), %rsi
	leaq	.LC24(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L267:
	cmpl	$1, 32(%rsp)
	je	.L268
	movq	56(%rsp), %rdi
	leaq	76(%rsp), %rdx
	movq	%rbp, %rsi
	movl	$1, 76(%rsp)
	call	avlInsertion@PLT
	movq	%rax, 56(%rsp)
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L222:
	cmpl	$1, 32(%rsp)
	je	.L269
	movq	pHead(%rip), %rdi
	movq	%rbp, %rsi
	call	addNode@PLT
	movq	%rax, %rbp
	movq	pHead(%rip), %rax
	cmpq	%rbp, %rax
	je	.L223
	movsd	(%rax), %xmm0
	movsd	0(%rbp), %xmm1
	leaq	.LC28(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movq	%rbp, pHead(%rip)
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L221:
	cmpl	$1, 32(%rsp)
	je	.L270
	movq	48(%rsp), %rdi
	movq	%rbp, %rsi
	call	bstInsertion@PLT
	movq	%rax, 48(%rsp)
	jmp	.L223
.L268:
	movq	%rbp, %rdi
	call	createTree@PLT
	movq	%rax, 56(%rsp)
	movq	%rax, pRoot(%rip)
	jmp	.L223
.L269:
	movq	%rbp, %rdi
	call	createNode@PLT
	movq	%rax, pHead(%rip)
	jmp	.L223
.L270:
	movq	%rbp, %rdi
	call	createTree@PLT
	movq	%rax, 48(%rsp)
	movq	%rax, pRoot(%rip)
	jmp	.L223
.L261:
	movl	36(%rsp), %eax
	cmpl	$2, %eax
	jle	.L271
	cmpl	$3, 36(%rsp)
	jne	.L230
	movq	pHead(%rip), %rdi
	call	printList@PLT
	movq	pHead(%rip), %rdi
	call	deleteList@PLT
.L230:
	movq	24(%rsp), %rdi
	call	fclose@PLT
	movq	outfile(%rip), %rdi
	call	fclose@PLT
	movl	fieldcnt(%rip), %r14d
	movq	16(%rsp), %rax
	leal	1(%r14), %r12d
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L255
	.p2align 4,,10
	.p2align 3
.L232:
	movq	0(%r13), %rdi
	testl	%r14d, %r14d
	js	.L233
	leaq	8(%rdi), %rbp
	xorl	%ebx, %ebx
	leaq	statcolumn(%rip), %r15
	jmp	.L236
	.p2align 4,,10
	.p2align 3
.L273:
	cmpl	4+statcolumn(%rip), %ebx
	je	.L234
.L235:
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, %r12d
	je	.L272
.L236:
	cmpl	(%r15), %ebx
	jne	.L273
.L234:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L235
	call	free@PLT
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, %r12d
	jne	.L236
.L272:
	movq	0(%r13), %rdi
.L233:
	testq	%rdi, %rdi
	je	.L237
	call	free@PLT
	movq	8(%r13), %r13
	testq	%r13, %r13
	jne	.L232
	.p2align 4,,10
	.p2align 3
.L240:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	8(%rax), %rax
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L240
.L255:
	addq	$392, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L271:
	.cfi_restore_state
	testl	%eax, %eax
	jle	.L230
	movq	pRoot(%rip), %rdi
	call	infixTraversal@PLT
	movq	pRoot(%rip), %rdi
	call	deleteTree@PLT
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L237:
	movq	8(%r13), %r13
	testq	%r13, %r13
	jne	.L232
	jmp	.L240
.L266:
	movq	stderr(%rip), %rdi
	movq	%r15, %rdx
	leaq	.LC4(%rip), %rsi
	call	fprintf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L211:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC10(%rip), %rdx
	leaq	.LC27(%rip), %rsi
.L257:
	movq	stdout(%rip), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
.L258:
	movl	$4, %edi
	call	exit@PLT
.L265:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC10(%rip), %rdx
	leaq	.LC26(%rip), %rsi
	jmp	.L257
.L264:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L260:
	movq	stdout(%rip), %rdi
	movq	%r13, %rdx
	leaq	.LC23(%rip), %rsi
	call	fprintf@PLT
	movl	$3, %edi
	call	exit@PLT
.L259:
	movq	stdout(%rip), %rdi
	movq	%r14, %rdx
	leaq	.LC21(%rip), %rsi
	call	fprintf@PLT
	movl	$2, %edi
	call	exit@PLT
	.cfi_endproc
.LFE49:
	.size	sort, .-sort
	.section	.rodata.str1.1
.LC29:
	.string	"debug mode "
.LC30:
	.string	"flag statsitics is [%d]\n"
.LC31:
	.string	"reverse sorting is [%d]\n"
.LC32:
	.string	"field_separator is [%c]\n"
.LC33:
	.string	"input files is [%s]\n"
.LC34:
	.string	"output files is [%s]\n"
.LC35:
	.string	"case 'k' > optarg : [%s]\n"
.LC36:
	.string	"1.0.1"
.LC37:
	.string	"version is %s\n"
.LC38:
	.string	"sort method is [%s]\n"
.LC39:
	.string	"Unrecognized option: -%c\n"
.LC40:
	.string	":f:o:rd-:k:s:g:t:"
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"-o and -f are mandatory options\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	movl	$-1, 48(%rsp)
	movl	$-1, 64(%rsp)
	movl	$1, 28(%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L275:
	leaq	.LC40(%rip), %rdx
	movq	%r13, %rsi
	movl	%r14d, %edi
	call	getopt@PLT
	cmpl	$-1, %eax
	je	.L359
	leal	-45(%rax), %edx
	cmpl	$71, %edx
	ja	.L358
	leaq	.L278(%rip), %rcx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L278:
	.long	.L286-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L285-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L284-.L278
	.long	.L358-.L278
	.long	.L283-.L278
	.long	.L282-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L282-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L281-.L278
	.long	.L358-.L278
	.long	.L358-.L278
	.long	.L280-.L278
	.long	.L279-.L278
	.long	.L277-.L278
	.section	.text.startup
	.p2align 4,,10
	.p2align 3
.L282:
	leaq	64(%rsp), %rdx
	leaq	48(%rsp), %rbx
	cmpl	$107, %eax
	movl	debug(%rip), %r15d
	cmovne	%rdx, %rbx
	pxor	%xmm0, %xmm0
	movq	optarg(%rip), %rdi
	movups	%xmm0, (%rbx)
	movl	$-1, (%rbx)
	testl	%r15d, %r15d
	jne	.L360
.L291:
	leaq	40(%rsp), %rbp
	movl	$10, %edx
	movq	%rbp, %rsi
	call	strtol@PLT
	movl	debug(%rip), %r12d
	movl	%eax, (%rbx)
	testl	%r12d, %r12d
	jne	.L361
.L292:
	movq	40(%rsp), %r15
	movq	%rbx, %r12
	cmpb	$0, (%r15)
	je	.L299
	.p2align 4,,10
	.p2align 3
.L293:
	movl	$1, %esi
	movl	$16, %edi
	call	calloc@PLT
	testq	%rax, %rax
	je	.L362
	movdqu	(%r12), %xmm1
	movq	%rbx, %rsi
	movups	%xmm1, (%rax)
.L296:
	movq	8(%rsi), %rdi
	testq	%rdi, %rdi
	jne	.L329
	movq	%rax, 8(%rsi)
	leaq	1(%r15), %rdi
	movl	$10, %edx
	movq	%rbp, %rsi
	movq	$0, 8(%rax)
	movq	8(%r12), %r12
	call	strtol@PLT
	movl	%eax, (%r12)
	movl	debug(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L363
	movq	40(%rsp), %r15
	cmpb	$0, (%r15)
	jne	.L293
	jmp	.L275
.L283:
	movq	optarg(%rip), %rbp
	movq	%rbp, %rdi
	call	strlen@PLT
	movl	$1, %esi
	leaq	1(%rax), %rbx
	movq	%rbx, %rdi
	call	calloc@PLT
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L356
	movq	%rax, %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L275
	movq	16(%rsp), %rsi
	leaq	.LC33(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
.L277:
	movq	optarg(%rip), %rax
	movsbl	(%rax), %esi
	movl	debug(%rip), %eax
	movb	%sil, field_separator(%rip)
	testl	%eax, %eax
	je	.L275
	leaq	.LC32(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
.L279:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	debug(%rip), %edx
	movl	%eax, flagstats(%rip)
	testl	%edx, %edx
	je	.L275
	movl	%eax, %esi
	leaq	.LC30(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
.L280:
	movl	$-1, sorting(%rip)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L275
	movl	$-1, %esi
	leaq	.LC31(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
.L281:
	movq	optarg(%rip), %rbp
	movq	%rbp, %rdi
	call	strlen@PLT
	movl	$1, %esi
	leaq	1(%rax), %rbx
	movq	%rbx, %rdi
	call	calloc@PLT
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L356
	movq	%rax, %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L275
	movq	8(%rsp), %rsi
	leaq	.LC34(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
.L284:
	leaq	.LC29(%rip), %rdi
	movl	$1, debug(%rip)
	call	puts@PLT
	jmp	.L275
.L286:
	movl	debug(%rip), %r9d
	leaq	lookuptable(%rip), %rax
	movq	optarg(%rip), %rbp
	movq	(%rax), %rdi
	testl	%r9d, %r9d
	jne	.L364
	movq	%rbp, %rsi
	call	strcmp@PLT
	movq	16+lookuptable(%rip), %rdi
	testl	%eax, %eax
	je	.L302
.L303:
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L324
.L354:
	movq	32+lookuptable(%rip), %rdi
.L306:
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L330
	movl	debug(%rip), %ecx
	movq	48+lookuptable(%rip), %rdi
	testl	%ecx, %ecx
	jne	.L365
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L322
.L355:
	movq	64+lookuptable(%rip), %rdi
.L310:
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L366
.L358:
	movl	$1, %edi
	call	usage
	.p2align 4,,10
	.p2align 3
.L363:
	movq	40(%rsp), %rdx
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	40(%rsp), %r15
	cmpb	$0, (%r15)
	jne	.L293
.L299:
	movl	debug(%rip), %r11d
	testl	%r11d, %r11d
	je	.L275
	leaq	.LC5(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, 40(%rsp)
	call	printf@PLT
.L300:
	movl	(%rbx), %esi
	leaq	.LC6(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	0(%rbp), %rax
	movq	8(%rax), %rbx
	leaq	8(%rax), %rbp
	testq	%rbx, %rbx
	jne	.L300
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L329:
	movq	%rdi, %rsi
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L361:
	movq	40(%rsp), %rdx
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L360:
	movq	%rdi, %rsi
	xorl	%eax, %eax
	leaq	.LC35(%rip), %rdi
	call	printf@PLT
	movq	optarg(%rip), %rdi
	jmp	.L291
	.p2align 4,,10
	.p2align 3
.L364:
	xorl	%esi, %esi
	movq	%rdi, %rdx
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	leaq	lookuptable(%rip), %rax
	movq	%rbp, %rsi
	movq	(%rax), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L302
	movl	debug(%rip), %r8d
	movq	16+lookuptable(%rip), %rdi
	testl	%r8d, %r8d
	je	.L303
	movq	%rdi, %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movq	16+lookuptable(%rip), %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L324
	movl	debug(%rip), %esi
	movq	32+lookuptable(%rip), %rdi
	testl	%esi, %esi
	je	.L306
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L365:
	movq	%rdi, %rdx
	movl	$3, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movq	48+lookuptable(%rip), %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L322
	movl	debug(%rip), %edx
	movq	64+lookuptable(%rip), %rdi
	testl	%edx, %edx
	je	.L310
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	movl	$4, %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	jmp	.L355
.L324:
	movl	$1, %eax
.L302:
	cltq
	leaq	lookuptable(%rip), %rbx
	salq	$4, %rax
	movl	8(%rbx,%rax), %eax
	cmpl	$4, %eax
	je	.L311
	jg	.L312
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	ja	.L358
	movl	%eax, 28(%rsp)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L275
	movq	optarg(%rip), %rsi
	leaq	.LC38(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
.L312:
	cmpl	$5, %eax
	jne	.L358
	leaq	.LC36(%rip), %rsi
	leaq	.LC37(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L359:
	cmpq	$0, 16(%rsp)
	je	.L332
	cmpq	$0, 8(%rsp)
	je	.L332
	leaq	64(%rsp), %rsi
	leaq	48(%rsp), %rdi
	call	prepcontext
	movq	16(%rsp), %rbx
	movq	8(%rsp), %r14
	movl	28(%rsp), %edi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	call	sort
	movq	%rbx, %rdi
	movl	%eax, %r12d
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	56(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L321
	.p2align 4,,10
	.p2align 3
.L318:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L318
.L321:
	movq	72(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L274
	.p2align 4,,10
	.p2align 3
.L319:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L319
.L274:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L330:
	.cfi_restore_state
	movl	$2, %eax
	jmp	.L302
.L322:
	movl	$3, %eax
	jmp	.L302
.L366:
	movl	$4, %eax
	jmp	.L302
.L285:
	movq	stderr(%rip), %rdi
	movl	optopt(%rip), %edx
	leaq	.LC39(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	usage
.L362:
	movl	$16, %edx
.L357:
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rsi
	call	fprintf@PLT
	orl	$-1, %edi
	call	exit@PLT
.L356:
	movq	%rbx, %rdx
	jmp	.L357
.L332:
	movq	optarg(%rip), %rdx
	movq	stderr(%rip), %rdi
	leaq	.LC41(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	jmp	.L358
.L311:
	xorl	%edi, %edi
	call	usage
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.globl	lookuptable
	.section	.rodata.str1.1
.LC42:
	.string	"avl"
.LC43:
	.string	"abr"
.LC44:
	.string	"tab"
.LC45:
	.string	"help"
.LC46:
	.string	"version"
	.section	.data.rel.local,"aw"
	.align 32
	.type	lookuptable, @object
	.size	lookuptable, 80
lookuptable:
	.quad	.LC42
	.long	1
	.zero	4
	.quad	.LC43
	.long	2
	.zero	4
	.quad	.LC44
	.long	3
	.zero	4
	.quad	.LC45
	.long	4
	.zero	4
	.quad	.LC46
	.long	5
	.zero	4
	.globl	outfile
	.bss
	.align 8
	.type	outfile, @object
	.size	outfile, 8
outfile:
	.zero	8
	.globl	pHead
	.align 8
	.type	pHead, @object
	.size	pHead, 8
pHead:
	.zero	8
	.globl	pRoot
	.align 8
	.type	pRoot, @object
	.size	pRoot, 8
pRoot:
	.zero	8
	.globl	field_separator
	.data
	.type	field_separator, @object
	.size	field_separator, 1
field_separator:
	.byte	59
	.globl	keylength
	.bss
	.align 4
	.type	keylength, @object
	.size	keylength, 4
keylength:
	.zero	4
	.globl	col_cnt
	.data
	.align 4
	.type	col_cnt, @object
	.size	col_cnt, 4
col_cnt:
	.long	-1
	.globl	col_sum
	.align 4
	.type	col_sum, @object
	.size	col_sum, 4
col_sum:
	.long	-1
	.globl	col_min
	.align 4
	.type	col_min, @object
	.size	col_min, 4
col_min:
	.long	-1
	.globl	col_max
	.align 4
	.type	col_max, @object
	.size	col_max, 4
col_max:
	.long	-1
	.globl	nbstats
	.bss
	.align 4
	.type	nbstats, @object
	.size	nbstats, 4
nbstats:
	.zero	4
	.globl	sorting
	.data
	.align 4
	.type	sorting, @object
	.size	sorting, 4
sorting:
	.long	1
	.globl	fieldcnt
	.bss
	.align 4
	.type	fieldcnt, @object
	.size	fieldcnt, 4
fieldcnt:
	.zero	4
	.globl	flagstats
	.align 4
	.type	flagstats, @object
	.size	flagstats, 4
flagstats:
	.zero	4
	.globl	nbstatcolumns
	.align 4
	.type	nbstatcolumns, @object
	.size	nbstatcolumns, 4
nbstatcolumns:
	.zero	4
	.globl	statcolumn
	.data
	.align 8
	.type	statcolumn, @object
	.size	statcolumn, 8
statcolumn:
	.long	-1
	.long	-1
	.globl	keycolumn
	.align 4
	.type	keycolumn, @object
	.size	keycolumn, 4
keycolumn:
	.long	-1
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.globl	README
	.data
	.align 32
	.type	README, @object
	.size	README, 2500
README:
	.ascii	"    csort(1)                                                "
	.ascii	"                              User Commands                 "
	.ascii	"                                                            "
	.ascii	"  csort(1)\n\nNAME\n   csort - sort and merge data from a cs"
	.ascii	"v input file into an output file\n\nSYNOPSIS\n   csort [OPTI"
	.ascii	"ON]... [FILE]...\n\nMAKE\n   make    (in the root directory "
	.ascii	"containing source files and Makefile)\n\nDESCRIPTION\nThis m"
	.ascii	"anual page documents the csort binary C-program usage.\n\n  "
	.ascii	" If -d option is given, debug messages will be displayed on "
	.ascii	"stdout\n   If --help option is given, this will display this"
	.ascii	" README\n   If we encounter any wrong argument or wrong inpu"
	.ascii	"t data, the entire command is aborted\n\n   ./csort -d --avl"
	.ascii	" -f [input file] -o [output file] -k 1 -g 2 -s 5\n\n   means"
	.ascii	" : sort using AVL method on column 1 (first column of the cs"
	.ascii	"v file) and merge by\n   calculating the MAX and AVG (MAX:1 "
	.ascii	"MIN:2 AVG:4) on column 2 using default separator ;\n\nFILE\n"
	.ascii	"   -f filename         a  CSV input file\n   -o filename    "
	.ascii	"     an output file separated using the same separator used "
	.ascii	"to parse input\n\nOPTIONS\n   -t, SEP                       "
	.ascii	"  use SEP instead of default ;\n   -r  reverse              "
	.ascii	"       reverse the result of comparisons\n   -d  debug      "
	.ascii	"                 run with debug mode\n   -k, POS            "
	.ascii	"             use POS column as unique index\n   -g, POS1[,PO"
	.ascii	"Sn]                 list of columns used for stats and group"
	.ascii	"ing\n   -s  [flag]                      flag [add MAX:1 MIN:"
	.ascii	"2 AVG:4] as needed\n   --help                          to ge"
	.ascii	"t help\n   --version                       to get version nu"
	.ascii	"mber\n\nRETURNS\n   O: no errors   1: wrong arguments  2: in"
	.ascii	"put file error 3: ouput file error 4: any other error\n\nAUT"
	.ascii	"HOR\n   Written by Mehdi Torjmen and Moutie Zahrez\n\nREPORT"
	.ascii	"ING BUGS\n   Please contact Mehdi Torjmen (mehdi.torjmen@gma"
	.ascii	"il.com)\n\nCOPYRIGHT\n   This is free software: you are free"
	.ascii	" to change and redistribute it.  There is NO WARRANTY, to th"
	.ascii	"e extent permitted by law.\n\n\nCY Tech                     "
	.ascii	"          "
	.string	"                                               January 2023\n\n"
	.zero	438
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
