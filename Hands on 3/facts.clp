(deftemplate enfermedad
   (slot nombre)
   (slot tipo)
   (slot sintomas))

; Hechos de enfermedades
(assert (enfermedad (nombre "Gripe") (tipo "viral") (sintomas "fiebre, dolor de cabeza, fatiga, tos, dolor muscular")))
(assert (enfermedad (nombre "COVID-19") (tipo "viral") (sintomas "fiebre, tos, dificultad para respirar, fatiga, pérdida de gusto y olfato")))
(assert (enfermedad (nombre "Tuberculosis") (tipo "bacteriana") (sintomas "tos persistente, fiebre, sudores nocturnos, pérdida de peso")))
(assert (enfermedad (nombre "Dengue") (tipo "viral") (sintomas "fiebre alta, dolor de cabeza, dolor detrás de los ojos, dolor muscular, erupción")))
(assert (enfermedad (nombre "Neumonía") (tipo "bacteriana") (sintomas "fiebre, tos con flema, dolor en el pecho, dificultad para respirar")))
(assert (enfermedad (nombre "Gonorrea") (tipo "bacteriana") (sintomas "dolor al orinar, secreción, dolor en las articulaciones, dolor abdominal")))
(assert (enfermedad (nombre "Meningitis") (tipo "bacteriana") (sintomas "fiebre alta, dolor de cabeza, rigidez en el cuello, sensibilidad a la luz, confusión")))
(assert (enfermedad (nombre "Salmonelosis") (tipo "bacteriana") (sintomas "diarrea, fiebre, calambres abdominales, náuseas, vómitos")))
(assert (enfermedad (nombre "Rubeola") (tipo "viral") (sintomas "erupción, fiebre, ojos rojos, ganglios inflamados")))
(assert (enfermedad (nombre "Tétanos") (tipo "bacteriana") (sintomas "rigidez muscular, espasmos, fiebre, dificultad para tragar")))

