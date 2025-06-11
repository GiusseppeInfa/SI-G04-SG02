; Definimos la plantilla País
(deftemplate Pais
   (slot Nombre)
   (multislot Bandera)
)

; Plantilla para que el usuario indique los colores que quiere buscar
(deftemplate ColoresABuscar
   (multislot colores)
)

; Algunos hechos de ejemplo con países y sus colores de bandera
(deffacts datos-banderas
   (Pais (Nombre Argentina) (Bandera Celeste Blanco))
   (Pais (Nombre Colombia) (Bandera Amarillo Azul Rojo))
   (Pais (Nombre Alemania) (Bandera Negro Rojo Amarillo))
   (Pais (Nombre España) (Bandera Rojo Amarillo))
   (Pais (Nombre Francia) (Bandera Azul Blanco Rojo))
   (Pais (Nombre Venezuela) (Bandera Amarillo Azul Rojo Estrellas))
)

; Regla para verificar si todos los colores buscados están en la bandera del país
(defrule mostrar-paises-con-colores
   (ColoresABuscar (colores $?buscados))
   (Pais (Nombre ?nombre) (Bandera $?colores-bandera))
   (test (subsetp ?buscados ?colores-bandera))
   =>
   (printout t "El país " ?nombre " tiene una bandera que contiene todos los colores buscados." crlf)
)
