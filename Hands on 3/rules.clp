; Regla para consultar enfermedades
(defrule consultar-enfermedades
   (opcion consultar)  ; Si la opción es consultar
   =>
   (printout t crlf "Lista de enfermedades registradas:" crlf)
   (bind ?enfermedades (find-all-facts ((?e enfermedad)) TRUE))  ; Busca todas las enfermedades
   (foreach ?e ?enfermedades
      (printout t "Nombre: " (fact-slot-value ?e nombre) crlf)
      (printout t "Tipo: " (fact-slot-value ?e tipo) crlf)
      (printout t "Síntomas: " (fact-slot-value ?e sintomas) crlf crlf)
   )
)


; Regla para agregar enfermedad
(defrule agregar-enfermedad
   (opcion agregar)  ; Si la opción es agregar
   =>
   (printout t "Ingrese el nombre de la enfermedad: ")
   (bind ?nombre (read))  ; Leer el nombre de la enfermedad
   (printout t "Ingrese el tipo de enfermedad (viral/bacteriana/etc.): ")
   (bind ?tipo (read))  ; Leer el tipo de la enfermedad
   (printout t "Ingrese los síntomas (separados por comas): ")
   (bind ?sintomas (read))  ; Leer los síntomas de la enfermedad
   (assert (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas ?sintomas)))  ; Crear un nuevo hecho de enfermedad
   (printout t crlf "Enfermedad agregada exitosamente: " crlf
              "Nombre: " ?nombre crlf
              "Tipo: " ?tipo crlf
              "Síntomas: " ?sintomas crlf)
)


(defrule actualizar-enfermedad
   (opcion actualizar)  ; Si la opción es actualizar
   =>
   (printout t "Ingrese el nombre de la enfermedad que desea actualizar: ")
   (bind ?nombre (read))  ; Leer el nombre de la enfermedad
   (bind ?actualizado FALSE)  ; Variable para verificar si se actualizó un hecho
   
   ; Crear una lista con todos los hechos de tipo enfermedad
   (bind ?enfermedades (find-all-facts ((?e enfermedad)) (str-compare (fact-slot-value ?e nombre) ?nombre 0)))
   
   ; Verificar si encontramos alguna enfermedad que coincida
   (if (neq (length$ ?enfermedades) 0)  ; Si la lista no está vacía
      then
         (progn
            (bind ?e (nth$ 1 ?enfermedades))  ; Obtener el primer hecho que coincide
            (printout t "Enfermedad encontrada: " ?nombre crlf)
            (printout t "Ingrese el nuevo tipo de enfermedad: ")
            (bind ?nuevo-tipo (read))  ; Leer el nuevo tipo de enfermedad
            (printout t "Ingrese los nuevos síntomas: ")
            (bind ?nuevos-sintomas (read))  ; Leer los nuevos síntomas
            
            ; Retractar el hecho viejo y agregar el nuevo hecho con los valores actualizados
            (retract ?e)
            (assert (enfermedad (nombre ?nombre) (tipo ?nuevo-tipo) (sintomas ?nuevos-sintomas)))
            (bind ?actualizado TRUE)  ; Actualizar el indicador
         )
      else
         (printout t "Enfermedad no encontrada: " ?nombre crlf)
   )
   
   ; Mensaje final si la actualización fue exitosa o no
   (if ?actualizado
      then
         (printout t crlf "Enfermedad actualizada exitosamente: " ?nombre crlf)
      else
         (printout t crlf "No se pudo actualizar la enfermedad: " ?nombre crlf)
   )
)


(defrule eliminar-enfermedad
   (opcion eliminar)  ; Si la opción es eliminar
   =>
   (printout t "Ingrese el nombre de la enfermedad que desea eliminar: ")
   (bind ?nombre (read))  ; Leer el nombre de la enfermedad
   (bind ?eliminado FALSE)  ; Variable para verificar si se eliminó un hecho
   (do-for-all-facts ((?e enfermedad))  ; Iterar sobre todos los hechos de tipo "enfermedad"
      (eq (str-compare (lowcase ?nombre) (lowcase (fact-slot-value ?e nombre))) 0)  ; Comparación insensible a mayúsculas
      (progn
         (printout t "Eliminando enfermedad: " (fact-slot-value ?e nombre) crlf)  ; Depuración
         (retract ?e)  ; Retractar el hecho
         (bind ?eliminado TRUE)))  ; Actualizar el indicador
   (if ?eliminado
      then
         (printout t crlf "Enfermedad eliminada exitosamente: " ?nombre crlf)
      else
         (printout t crlf "Enfermedad no encontrada: " ?nombre crlf)
   )
)

