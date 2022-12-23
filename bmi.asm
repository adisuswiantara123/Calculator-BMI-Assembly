  .MODEL SMALL
  .STACK 100H
  .DATA 
  MSA DB ' ==================== SELAMAT DATANG ====================$' 
  MSB DB ' ******************** BMI KALKULATOR ********************$'
  MSC DB ' """Silahkan Masukkan Data Anda"""$'
  MSD DB ' Masukkan Tinggi Badan Anda dalam cm:$'
  MSE DB ' Masukkan Berat Badan Anda dalam kg:$'
  MSF DB ' "Berat Badan Anda:Tidak Ideal"$'
  MSG DB ' "Berat Badan Anda:Ideal"$'
  MSH DB ' "Berat Badan Anda:Tidak Ideal"$'
  MSI DB ' "Tekan 1 untuk melihat petunjuk menambah berat badan ideal jika berat badan Anda kurang "$'
  MSJ DB ' "Tekan 2 untuk melihat petunjuk mengurangi berat badan  jika Anda kelebihan berat badan " $'
  
  MSK1 DB ' " 1.Makan lebih banyak dan tidur 8 jam sehari."$'
  MSK2 DB ' " 2.Mengonsumsi makanan berkalori tinggi seperti kentang, nasi merah, dada ayam, kacang polong, almond, ubi jalar dll."$'
  MSK3 DB ' " 3.Minum air putih minimal 3L per hari."$'
  MSK4 DB ' " 4.Makan sayuran dan segelas susu dan 1 telur utuh setiap hari."$'
  
  MSL1 DB ' " 1.Cobalah untuk mengikuti diet sehat rendah kalori."$'
  MSL2 DB ' " 2.Mengonsumsi protein tinggi, sayuran dan hindari makanan cepat saji."$'
  MSL3 DB ' " 3.Lakukan beberapa latihan untuk menurunkan berat badan seperti berjalan, berlari, crunching, dan lompat tali.."$' 
  
  MSN DB ' Selamat..! Pertahankan.$'
  
  MSM1 DB ' " Tekan 1 untuk Kembali ke awal."$'
  MSM2 DB ' " Tekan 2 untuk EXIT."$' 
  MSM3 DB '          ********Terima Kasih********$'
  MSM4 DB ' " Press any key to continue...."$'
  
  SUM DW ? 
  .CODE
   MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSA
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSB
    MOV AH,9
    INT 21H 
    
    CALL NL
    CALL NL
    
    LEA DX,MSC
    MOV AH,9
    INT 21H 
    
    START:
    
    CALL NL
    CALL NL
    
    LEA DX,MSD
    MOV AH,9
    INT 21H 
           
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0
    MOV SUM,0
    
 
         
 INPUT:
 
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE PRINT
    
   
    JMP INPUT
    
    
    PRINT: 
    
    CALL NL
    
    LEA DX,MSE
    MOV AH,9
    INT 21H
    
    MOV SUM,BX
    MOV BX,0
    MOV AX,0
     
    INPUT2:
     
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE CONVERT
    
    JMP INPUT2
     
    CONVERT:
    
    MOV AX,SUM
    MOV DX,0
    
    DIV BX
     
    
    CMP AX,1
    JE OVER
    
    CMP AX,2
    JE OVER
    
    CMP AX,3
    JE PERFECT
    
    CMP AX,4
    JE UNDER
    
    CMP AX,5
    JE UNDER
    
    OVER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSF
    MOV AH,9
    INT 21H 
    
    JMP PRESS
    
    PERFECT:
     
    CALL NL
    CALL NL
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSN
    MOV AH,9
    INT 21H 
     
    JMP EXIT
     
    UNDER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSH
    MOV AH,9
    INT 21H 
    
    JMP PRESS
              
    PRESS:
    
    MOV AX,0 
    
    CALL NL
    CALL NL
    
    LEA DX,MSI
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSJ
    MOV AH,9
    INT 21H
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE P1
    
    CMP AL,'2'
    JE P2
    
    P1:
    
    CALL NL
    CALL NL
    
    LEA DX,MSK1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSK2
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSK3
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSK4
    MOV AH,9
    INT 21H
    
    JMP EXIT
    
    P2:
    
    CALL NL
    CALL NL
    
    LEA DX,MSL1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSL2
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSL3
    MOV AH,9
    INT 21H
    
    EXIT:
    MOV AX,0
    CALL NL
    CALL NL
    
    LEA DX,MSM4
    MOV AH,9
    INT 21H   
    
    MOV AH,1
    INT 21H
       
    CALL NL
     
    LEA DX,MSM1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSM2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE START
    
    JMP EXIT2
    
    NL:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    RET
    
      
    EXIT2:  
    CALL NL
    CALL NL
    
    LEA DX,MSM3
    MOV AH,9
    INT 21H
     
    MOV AH,4CH
    INT 21H
             
    MAIN ENDP 
    END MAIN










