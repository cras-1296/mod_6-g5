datos = File.open('ventas_base.db').read.split(',')
datos.map! {|valor| valor.to_f}

def aumentar(arreglo, aumento, desde, hasta)
    rango = arreglo[desde..hasta]
    sub_total = rango.map{|elemento| elemento * aumento }.sum
    "%0.2f" % [sub_total]
end

salida_datos = File.open('resultados.data', 'w')
salida_datos.write(aumentar(datos, 1.1, 0, 5))
salida_datos.write("\n")
salida_datos.write(aumentar(datos, 1.2, 6, 11))
salida_datos.close