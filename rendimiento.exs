defmodule Main do
  @moduledoc """
  Módulo principal para calcular el rendimiento de un vehículo (km/l)
  a partir de la distancia recorrida y el combustible consumido.
  """

  def main do
    nombre =
      "Ingrese el nombre del conductor:"
      |> Util.input(:string)

    distancia =
      "Ingrese la distancia recorrida en km:"
      |> Util.input(:float)

    combustible =
      "Ingrese la cantidad de combustible consumido en litros:"
      |> Util.input(:float)

    rendimiento =
      calcular_rendimiento(distancia, combustible)
      |> Float.round(2)

    generar_mensaje(nombre, rendimiento)
    |> Util.show_message()
  end

  @doc """
  Calcula el rendimiento del vehículo en km/l.

  ## Parámetros
    - `distancia`: Distancia recorrida en kilómetros.
    - `combustible`: Cantidad de combustible consumido en litros.

  ## Retorna
    - El rendimiento (distancia/combustible) como `float`.

  ## Ejemplo
      iex> Main.calcular_rendimiento(400, 20)
      20.0
  """
  def calcular_rendimiento(distancia, combustible) do
    distancia / combustible
  end

  @doc """
  Genera un mensaje con el nombre del conductor y su rendimiento.

  ## Parámetros
    - `nombre`: Nombre del conductor.
    - `rendimiento`: Rendimiento calculado en km/l.

  ## Retorna
    - Una cadena con el mensaje listo para mostrar.

  ## Ejemplo
      iex> Main.generar_mensaje("Juan", 18.5)
      "El conductor Juan tiene un rendimiento de 18.5 km/l."
  """
  def generar_mensaje(nombre, rendimiento) do
    "El conductor #{nombre} tiene un rendimiento de #{rendimiento} km/l."
  end
end

Main.main()
