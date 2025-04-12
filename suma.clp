(deffacts numeros
   (numero 3)
   (numero 5)
   (numero 7)
)

(deffacts suma-inicial
   (suma 0)
)

(defrule sumar-elementos
   ?n <- (numero ?valor)
   ?s <- (suma ?total)
   =>
   (retract ?n)
   (retract ?s)
   (assert (suma (+ ?valor ?total)))
)

(defrule mostrar-suma-final
   (not (numero ?))
   (suma ?total)
   =>
   (printout t "La suma total es: " ?total crlf)
)
