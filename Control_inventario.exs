defmodule Main do
  def main do

    nombre_libro = "Ingrese el nombre del libro:"
    |> Util.input(:string)

    cantidad = "Ingrese la cantidad del libros disponibles:"
    |> Util.input(:integer)


    precio = "Ingrese el precio del libro:"
    |> Util.input(:float)


     precio_total = calcular_precio_inventario(cantidad, precio)

     generar_mensaje(nombre_libro, cantidad, precio_total)
    |> Util.show_message()

  end

  defp calcular_precio_inventario(cantidad, precio) do
    cantidad * precio
  end

  defp generar_mensaje(nombre_libro, cantidad, precio_total) do
    precio_formateado = :erlang.float_to_binary(precio_total, decimals: 2)
    "el libro '#{nombre_libro}' tiene #{cantidad} unidades en inventario y un precio total de  $#{precio_formateado}."
  end

end

Main.main()
