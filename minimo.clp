; -------------------------
; Plantillas
; -------------------------

(deftemplate numero
   (slot valor))

(deftemplate minimo
   (slot valor))

; -------------------------
; Hechos de prueba (batería de pruebas)
; -------------------------

(deffacts datos-prueba
   (numero (valor 10))
   (numero (valor 3))
   (numero (valor 25))
   (numero (valor 1))
   (numero (valor 7)))

; -------------------------
; Reglas
; -------------------------

; Regla para inicializar el mínimo con el primer valor de la lista
(defrule inicializar-minimo
   ?n <- (numero (valor ?v))
   (not (minimo (valor ?)))
   =>
   (assert (minimo (valor ?v))))

; Regla para actualizar el mínimo si encuentra un número menor
(defrule actualizar-minimo
   (numero (valor ?v))
   ?m <- (minimo (valor ?mv&:(> ?mv ?v)))
   =>
   (retract ?m)
   (assert (minimo (valor ?v))))

; Regla para mostrar el mínimo encontrado
(defrule mostrar-minimo
   ?m <- (minimo (valor ?v))
   (not (test (any-factp ((?n numero)) (< ?n:valor ?v))))
   =>
   (printout t "El valor mínimo es: " ?v crlf))
