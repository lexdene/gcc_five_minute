	.file	"main.cpp"
	.text
	.p2align 4,,15
.globl _Z3sumii
	.type	_Z3sumii, @function
_Z3sumii:
.LFB0:
	.cfi_startproc
	leal	(%rsi,%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3sumii, .-_Z3sumii
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	_Z9createNumv
	movl	%eax, %ebx
	call	_Z9createNumv
	leal	(%rax,%rbx), %edi
	call	_Z6putNumi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
