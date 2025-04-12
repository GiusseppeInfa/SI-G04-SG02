;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORDEN_DE_LETRAS.CLP
;; Encuentra la unión de letras comunes en dos vectores
;; CLIPS 6.30 compatible
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate cadena
   (slot id)
   (multislot elementos))

(deftemplate elemento
   (slot id)
   (slot valor))

(deftemplate comun
   (slot valor))

(deftemplate union
   (multislot elementos))

(deffacts datos
   (cadena (id 1) (elementos B C A D E E B C E))
   (cadena (id 2) (elementos E E B C A F E)))

;; Extrae elementos uno por uno del multislot 'elementos'
(defrule extraer-elemento
   ?c <- (cadena (id ?id) (elementos ?x $?resto))
   =>
   (assert (elemento (id ?id) (valor ?x)))  ;; Agregar el primer elemento como 'elemento'
   (printout t "Elemento extraído de cadena " ?id ": " ?x crlf)  ;; Imprime el elemento extraído
   (modify ?c (elementos ?resto)))          ;; Actualizar el hecho 'cadena' eliminando el primer elemento

;; Identifica letras comunes a ambos vectores, sin repetir
(defrule encontrar-comunes
   (elemento (id 1) (valor ?v))
   (elemento (id 2) (valor ?v))
   (not (comun (valor ?v)))
   =>
   (assert (comun (valor ?v)))
   (printout t "Elemento común encontrado: " ?v crlf))  ;; Imprime los elementos comunes encontrados

;; Construye la unión de las letras comunes sin duplicados
(defrule construir-union
   (not (union (elementos $?)))  ;; Verifica si ya existe un hecho 'union'
   =>
   (bind ?lista (create$))  ;; Inicializamos ?lista como un multifield vacío
   (printout t "Construyendo la unión de elementos comunes..." crlf)
   ;; Agregar todos los elementos comunes a ?lista
   (do-for-all-facts ((?c comun)) TRUE
      (bind ?lista (create$ ?lista ?c:valor)))  ;; Se agrega cada elemento común
   ;; Ahora verificamos que la lista no esté vacía
   (if (neq (length$ ?lista) 0) then
      (assert (union (elementos ?lista)))  ;; Crear el hecho 'union'
   else
      (printout t "No hay elementos comunes para la unión." crlf)))

;; Muestra la unión de las letras comunes
(defrule mostrar-union
   (union (elementos $?l))
   =>
   (printout t "Unión de elementos comunes: " ?l crlf))
