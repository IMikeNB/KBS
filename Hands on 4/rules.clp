; Regla 1: Si un cliente compra un iPhone 14 con tarjeta Santander, ofrecer 18 meses sin intereses.
(defrule promocion-iphone14-santander
  (ticket (id-ticket ?id-ticket) (productos $? "iPhone 14" $?))
  (tarjetacred (num-tarjeta ?num) (banco "Santander") (grupo "Mastercard"))
  =>
  (printout t "Promoción aplicada: 18 meses sin intereses para el ticket " ?id-ticket "." crlf)
)

; Regla 2: Si un cliente compra un Galaxy S23 con BBVA, ofrecer 12 meses sin intereses.
(defrule promocion-galaxy-bbva
  (ticket (id-ticket ?id-ticket) (productos $? "Galaxy S23" $?))
  (tarjetacred (num-tarjeta ?num) (banco "BBVA"))
  =>
  (printout t "Promoción aplicada: 12 meses sin intereses para el ticket " ?id-ticket "." crlf)
)

; Regla 3: Si un cliente compra una computadora HP Pavilion al contado, ofrecer un vale de $200.
(defrule promocion-hp-contado
  (ticket (id-ticket ?id-ticket) (productos $? "Pavilion 14" $?) (metodo-pago "efectivo"))
  =>
  (printout t "Promoción aplicada: Vale de $200 para el ticket " ?id-ticket "." crlf)
)

; Regla 4: En la compra de una computadora y un accesorio, ofrecer 5% de descuento en el total.
(defrule promocion-computadora-accesorio
  (ticket (id-ticket ?id-ticket) (productos $? ?computadora ?accesorio $?))
  (computadora (modelo ?computadora))
  (accesorio (modelo ?accesorio))
  =>
  (printout t "Promoción aplicada: 5% de descuento en el total por comprar una computadora y un accesorio." crlf)
)

; Regla 5: Si se compran más de 2 accesorios, aplicar un descuento del 10% en accesorios.
(defrule promocion-descuento-accesorios
  (ticket (id-ticket ?id-ticket) (productos $? ?accesorio1 ?accesorio2 ?accesorio3 $?))
  (accesorio (modelo ?accesorio1))
  (accesorio (modelo ?accesorio2))
  (accesorio (modelo ?accesorio3))
  (not (promocion-aplicada ?id-ticket "descuento-accesorios")) ; Verifica que no se haya aplicado antes
  =>
  (assert (promocion-aplicada ?id-ticket "descuento-accesorios"))
  (printout t "Promoción aplicada: 10% de descuento en accesorios por comprar más de 2 accesorios." crlf)
)


; Regla 6: Si un cliente compra una funda y mica, aplicar 15% de descuento.
(defrule promocion-funda-mica
  (ticket (id-ticket ?id-ticket) (productos $? "Funda" "Mica" $?))
  =>
  (printout t "Promoción aplicada: 15% de descuento en funda y mica." crlf)
)

; Regla 7: Si un cliente compra una computadora Dell y audífonos JBL, aplicar 8% de descuento en el total.
(defrule promocion-dell-audifonos
  (ticket (id-ticket ?id-ticket) (productos $? "Inspiron 15 3000" "Audífonos inalámbricos TUNE 510BT" $?))
  =>
  (printout t "Promoción aplicada: 8% de descuento en el total por comprar una Dell y audífonos JBL." crlf)
)

; Regla 8: Ofrecer 12 meses sin intereses para compras mayores a $2000 con Visa.
(defrule promocion-visa
  (ticket (id-ticket ?id-ticket) (total ?total))
  (tarjetacred (grupo "Visa"))
  (test (>= ?total 2000))
  =>
  (printout t "Promoción aplicada: 12 meses sin intereses por compras mayores a $2000 con Visa." crlf)
)

; Regla 9: Si el cliente compra un smartphone Samsung, ofrecer un cargador con 10% de descuento.
(defrule promocion-samsung-cargador
  (ticket (id-ticket ?id-ticket) (productos $? ?smartphone $?))
  (smartphone (modelo ?smartphone) (marca "Samsung"))
  =>
  (printout t "Promoción aplicada: 10% de descuento en cargador por comprar un smartphone Samsung." crlf)
)

; Regla 10: En la compra de una MacBook Air, ofrecer una mica gratis para un iPhone.
(defrule promocion-macbook-mica
  (ticket (id-ticket ?id-ticket) (productos $? "MacBook Air" $?))
  =>
  (printout t "Promoción aplicada: Mica gratis para un iPhone por comprar una MacBook Air." crlf)
)

; Reglas adicionales para completar 20

; Regla 11: Si el cliente compra un iPhone 14 y audífonos Sony, ofrecer descuento de $50.
(defrule promocion-iphone14-audifonos
  (ticket (id-ticket ?id-ticket) (productos $? "iPhone 14" "Audífonos WH-1000XM4" $?))
  =>
  (printout t "Promoción aplicada: $50 de descuento por comprar un iPhone 14 y audífonos Sony." crlf)
)

; Regla 12: Si se compra una computadora Asus ROG, ofrecer 3 meses gratis de antivirus.
(defrule promocion-asus-antivirus
  (ticket (id-ticket ?id-ticket) (productos $? "ROG Zephyrus G14" $?))
  =>
  (printout t "Promoción aplicada: 3 meses gratis de antivirus por comprar una computadora Asus ROG." crlf)
)

; Regla 13: En la compra de accesorios por más de $100, ofrecer envío gratis.
(defrule promocion-envio-gratis
  (ticket (id-ticket ?id-ticket) (productos $? ?accesorio1 $?))
  (accesorio (modelo ?accesorio1) (precio ?precio))
  (test (>= ?precio 100))
  =>
  (printout t "Promoción aplicada: Envío gratis por comprar accesorios por más de $100." crlf)
)

; Regla 14: Ofrecer 5% de descuento por pagar al contado y comprar más de 2 productos.
(defrule promocion-contado
  (ticket (id-ticket ?id-ticket) (metodo-pago "efectivo") (productos $? ?producto1 ?producto2 $?))
  =>
  (printout t "Promoción aplicada: 5% de descuento por pagar al contado y comprar más de 2 productos." crlf)
)

; Agrega las siguientes reglas de forma similar para completar 20, con variedad según los datos de nuestra base de conocimientos.

; Regla 15: Clasificar al cliente según la cantidad de productos comprados (Menudista o Mayorista)
(defrule clasificar-cliente-menudista
   (ticket (id-cliente ?id-cliente) (cantidad ?qty&:(< ?qty 10)))
   (not (cliente-clasificado ?id-cliente)) ; Verifica que el cliente no haya sido clasificado
   =>
   (assert (cliente-clasificado ?id-cliente)) ; Marca como clasificado
   (printout t "El cliente con ID " ?id-cliente " es clasificado como Menudista." crlf)
)


(defrule clasificar-cliente-mayorista
   ;; La regla se activa si un cliente tiene un ticket con 10 o más productos.
   (ticket (id-cliente ?id-cliente) (cantidad ?qty&:(>= ?qty 10)))
   ?cliente <- (cliente (id-cliente ?id-cliente) (tipo ?tipo&~"mayorista")) ;; Verifica que no sea ya "mayorista".
   =>
   (modify ?cliente (tipo "mayorista"))
   (printout t "El cliente con ID " ?id-cliente " ha sido clasificado como Mayorista." crlf)
)


; Regla 16: Aplicar descuento para compras de smartphones usando el vale de Black Friday
(defrule descuento-smartphones-blackfriday
  (ticket (productos ?productos) (metodo-pago ?metodo))
  (vale (codigo "VALEBLACKFRIDAY") (tipo "descuento"))
  (test (member$ "smartphone" ?productos))
  =>
  (printout t "Aplicado 20% de descuento en smartphones seleccionados usando VALEBLACKFRIDAY." crlf)
)

; Regla 17: Aplicar vale de descuento en accesorios al comprar cualquier smartphone
(defrule descuento-accesorios
  (ticket (productos ?productos) (metodo-pago ?metodo))
  (vale (codigo "VALE2024") (tipo "descuento"))
  (test (member$ "smartphone" ?productos))
  =>
  (printout t "Aplicado 10% de descuento en accesorios usando VALE2024." crlf)
)

; Regla 18: Descuento de $50 en compras mayores a $500 usando vale VALE50OFF
(defrule descuento-compra-mayor-500
  (ticket (total ?total) (metodo-pago ?metodo))
  (vale (codigo "VALE50OFF") (tipo "regalo"))
  (test (> ?total 500))
  =>
  (printout t "Aplicado vale VALE50OFF: $50 de descuento en compras mayores a $500." crlf)
)

; Regla 19: Actualizar stock de smartphones después de una compra
(defrule actualizar-stock-smartphone
   (ticket (productos $?productos) (cantidad ?qty))
   ?smartphone <- (smartphone (id-smartphone ?id-smartphone) (stock ?stock))
   (test (member$ (str-cat "id-smartphone-" ?id-smartphone) ?productos))
   (test (>= ?stock ?qty))  ; Verifica que haya suficiente stock
   =>
   (modify ?smartphone (stock (- ?stock ?qty)))
   (printout t "Stock actualizado para smartphone con ID " ?id-smartphone ": nuevo stock es " (- ?stock ?qty) crlf)
)



; Regla 20: Rechazar compra si no hay suficiente stock de smartphones
(defrule rechazar-compra-sin-stock
  (ticket (productos $?productos) (cantidad ?qty))
  (smartphone (id-smartphone ?id-smartphone) (stock ?stock))
  (test (member$ ?id-smartphone ?productos))
  (test (< ?stock ?qty))
  =>
  (printout t "Compra rechazada: No hay suficiente stock para el smartphone con ID " ?id-smartphone crlf)
)
