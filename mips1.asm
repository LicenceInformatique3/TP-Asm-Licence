          .data
 demande: .asciiz "Saisissez un entier\n"                  #Déclare demande comme chaîne de caractères
 retour:  .asciiz "\n"                                     #déclare retour comme chaîne de caractères
 reponse: .asciiz "L'entier est: "                         #Déclare reponse comme chaîne de caractère

          .text                                            #Début du segment de texte MIPS
 main:                                                     #Etiquette main 
          li $v0, 4                                        #Le prochain appel système sera print_str
          la $a0, demande                                  #la chaîne à afficher est demande
          syscall                                          #Affichage de la chaîne

          li $v0, 5                                        #Le prochain appel système sera read_int
          syscall                                          #Lecture de n au clavier
          move $t2, $v0                                    #Place n dans le registre temporaire $t2
 
          li $v0, 4                                        #Le prochain appel système sera print_str
          la $a0, reponse                                  #la chaîne à afficher est reponse
          syscall                                          #Affichage de la chaîne 
 
          li $v0, 1                                        #Le prochain appel système sera print_int
          move $a0, $t2                                    #Place l'entier à afficher dans $a0
          syscall                                          #Affichage de l'entier

          li $v0, 4                                        #Le prochain appel système sera print_str
          la $a0, retour                                   #la chaîne à afficher est retour
          syscall                                          #Affichage de la chaîne