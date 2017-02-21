.data
str1: .asciiz "Entrez un entier : "
str2: .asciiz "Son factoriel est "
ret:  .asciiz "\n" 
 .text

fact: 
       li $v0, 4
       la $a0, str1
       syscall                                           # demander un entier
 
       li $v0, 5
       syscall                                           # mettre l'entier dans $v0

       move $a0, $v0                                     # prepare le paramètre pour l'appel
       li $a1, 1
       jal fact_tail                                     # appel fact, resultat dans $3
  
       li $v0, 4
       la $a0, str2 
       syscall                                           # annonce resultat 
 
       li $v0, 1
       move $a0 $3
       syscall                                           # affiche resultat
 
       li $v0, 4
       la $a0, ret
       syscall                                           # retour à la ligne
 
       li $v0, 10
       syscall                                           # on sort du prog (exit)


fact_tail:
       bgt $a0 1 recur                                   # si n<>1 aller en recur 
       move $3, $a1                                      # sinon resultat=res
       jr $ra                                            # return
    recur:
       mul $a1 $a0 $a1                                   # res=res*n
       sub $a0 $a0 1                                     # n=n-1
       j fact_tail
