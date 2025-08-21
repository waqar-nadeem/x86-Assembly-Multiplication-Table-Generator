INCLUDE Irvine32.inc

.data
header BYTE "=== Multiplication Table Generator ===",13,10,0
prompt1 BYTE "Enter the number: ",0
prompt2 BYTE "Enter the limit: ",0
xSign BYTE " x ",0
eqSign BYTE " = ",0

num DWORD ?
limit DWORD ?
i DWORD ?
result DWORD ?

.code
main PROC
    mov edx, OFFSET header
    call WriteString

    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov num,eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov limit,eax

    mov i,1
printLoop:
    mov eax,num
    mov ebx,i
    mul ebx
    mov result,eax
    mov eax,num
    call WriteDec
    mov edx,OFFSET xSign
    call WriteString
    mov eax,i
    call WriteDec
    mov edx,OFFSET eqSign
    call WriteString
    mov eax,result
    call WriteDec
    call Crlf
    inc i
    cmp i,limit
    jle printLoop

    exit
main ENDP
END main
