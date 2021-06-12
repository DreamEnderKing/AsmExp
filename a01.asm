global _start

section .text
    _start:
        mov ax, 1                  ; sys_write的系统调用编号为1
        mov di, 1                  ; 文件句柄1对应stdout
        mov si, msg                ; 要输出的字符串地址
        mov dx, msglen             ; 要输出的字符串长度
        syscall                     ; 系统调用
        mov ax, 60                 ; sys_exit的系统调用编号为60
        xor di, di                ; exit 0
        syscall

section .data
    msg: db "Hello, World!", 10     ; ascii表中10对应换行符
    msglen: equ $ - msg             ; $ 等于当前行开头的地址
