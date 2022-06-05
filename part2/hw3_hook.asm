.global hook
.global print_msg
.section .data
msg: .ascii "This code was hacked by Ella Lee's gang\n"
endmsg:

.section .text
hook:
  mov $_start,%rbx
  mov %rbx,%rdx
  add $0x1e,%rdx #rdx=_START+0x1E
  
  
  mov $print_msg,%r15
  sub %rdx,%r15 #r15-=RIP
  sub $5,%r15
  movb $0xE9, (%rdx)
  inc %rdx
  movl %r15d,(%rdx)
  
  jmp _start
  
  print_msg:
  mov $0x1,%rax
  mov $0x1,%rdi
  mov $endmsg-msg,%rdx
  mov $msg,%rsi
  syscall
  jmp _start+0x26
  
  movq $60, %rax
  movq $0, %rdi
  syscall


