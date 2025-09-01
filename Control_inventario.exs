defmodule Main do
  @moduledoc """
  Calcula el valor total del inventario de un libro según la cantidad y precio unitario.
  """

  @doc """
  Función principal:
   - Solicita al usuario el nombre del libro, cantidad y precio unitario.
   - Calcula el precio total del inventario.
   - Muestra un mensaje con los resultados.
  """
  def main do
    nombre_libro = "Ingrese el nombre del libro:"
    |> Util.input(:string)

    cantidad = "Ingrese la cantidad de libros disponibles:"
    |> Util.input(:integer)

    precio = "Ingrese el precio del libro:"
    |> Util.input(:float)

    precio_total = calcular_precio_inventario(cantidad, precio)

    generar_mensaje(nombre_libro, cantidad, precio_total)
    |> Util.show_message()
  end

  @doc """
  Calcula el precio total del inventario.

  ## Parámetros
    - cantidad: número de unidades disponibles.
    - precio: valor unitario del libro.

  ## Ejemplo
      iex> Main.calcular_precio_inventario(5, 10000)
      50000
  """
  defp calcular_precio_inventario(cantidad, precio) do
    cantidad * precio
  end

  @doc """
  Genera un mensaje con la información del libro.

  ## Parámetros
    - nombre_libro: título del libro.
    - cantidad: número de unidades.
    - precio_total: valor total del inventario.
  """
  defp generar_mensaje(nombre_libro, cantidad, precio_total) do
    precio_formateado = :erlang.float_to_binary(precio_total, decimals: 2)

    "El libro '#{nombre_libro}' tiene #{cantidad} unidades en inventario y un precio total de $#{precio_formateado}."
  end
end

Main.main()
