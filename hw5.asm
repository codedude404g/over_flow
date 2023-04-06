start:  lodd on:
        stod 4095
        call xbsywt:
        loco str1:
nextw:  pshi
        addd c1:
        stod pstr1:
        pop
        jzer crnl:
        stod 4094
        push
        subd c255:
        jneg crnl:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr1:
        jump nextw:
crnl:   lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        call xbsywt:
        lodd on:                ; mic1 program to print string
        stod 4093               ; and scan in a 1-5 digit number
bgndig: call rbsywt:            ; using CSR memory locations
        lodd 4092
        subd numoff:
        push
nxtdig: call rbsywt:
        lodd 4092
        stod nxtchr:
        subd nl:
        jzer endnum:
        mult 10
        lodd nxtchr:
        subd numoff:
        addl 0
        stol 0
        jump nxtdig:
endnum: lodd numptr:
        popi
        addd c1:
        stod numptr:
        lodd numcnt:
        jzer addnms:
        subd c1:
        stod numcnt:
        jump start:
addnms: loco str2:
        call prints:     ; This will call my new print 
        lodd binum1:    
        addd binum2:
        stod sum:
        JNEG overflow:
Divloop: lodd c10:
         push
         lodd sum:
         push
         DIV
         lodl 0
         stod sum:
         lodl 1
         insp 4 ; increaments the stack pointer
         push   
         lodd ct: 
         addd c1:
         stod ct:
         lodd sum:
         JZER Divdone: 
         jump Divloop:
Divdone: lodd ct:
         JZER Divdonee:
         lodd ct:
         subd c1:
         stod ct:
         pop
         addd numoff:
         stod 4094
         call xbsywt:
         jump Divdone:
Divdonee: lodd c0:
        halt 

overflow: loco str3:
          call prints:
         lodd neg:
         halt         ; this is where you would go to add the binums
   
xbsywt: lodd 4095
        subd mask:
        jneg xbsywt:
        retn
rbsywt: lodd 4093
        subd mask:
        jneg rbsywt:
        retn
sb:     loco 8
loop1:  jzer finish:
        subd c1:
        stod lpcnt:
        lodl 1
        jneg add1:
        addl 1
        stol 1
        lodd lpcnt:
        jump loop1:
add1:   addl 1
        addd c1:
        stol 1
        lodd lpcnt:
        jump loop1:
finish: lodl 1
        retn
prints:  pshi
        addd c1:
        stod pstr1:
        pop
        jzer newl:
        stod 4094
        push
        subd c255:
        jneg newl:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr1:
        jump prints:
newl:    lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        call xbsywt:
        retn 
numoff: 48
nxtchr: 0
numptr: binum1:
binum1: 0
binum2: 0
lpcnt:  0
mask:   10
on:     8
nl:     10
cr:     13
c1:     1
neg:    -1      ; this is for negative val
c10:    10
c255:   255
sum:    0
numcnt: 1
c0:     0
pstr1:  0
ct:     0
str1:   "Please enter a 1-5 digit number followed by enter"
str2:    "THE SUM OF THESE INTEGERS IS: "
str3:    "OVERFLOW, NO SUM POSSIBLE:"
