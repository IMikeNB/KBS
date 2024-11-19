(deftemplate smartphone
   (slot id-smartphone)
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot stock)
)

(deftemplate computadora
  (slot marca)
  (multislot nombre)
  (slot modelo)
  (slot precio (type FLOAT))  
  (slot stock (default 0))
)

(deftemplate accesorio
  (slot marca)
  (multislot nombre)
  (slot modelo)
  (slot precio (type FLOAT))  
  (slot stock (default 0))
)

(deftemplate cliente
  (slot id-cliente)
  (multislot nombre)
  (slot correo)
  (slot telefono)
  (slot tipo (default "minorista")) 
)


(deftemplate ticket
  (slot id-ticket)
  (slot id-cliente)
  (multislot productos)
  (slot cantidad (default 1))
  (slot total (type FLOAT))  
  (slot metodo-pago)
  (slot fecha (type STRING))
)

(deftemplate tarjetacred
  (slot num-tarjeta)
  (multislot titular) 
  (slot banco)
  (slot grupo)
  (slot fecha-expiracion)
)

(deftemplate vale
  (slot codigo)
  (slot tipo) 
  (slot descripcion)
)
