defmodule Main do
  def main do
    nombre = "Ingrese el nombre del conductor:"
    |> Util.input(:string)

    distancia = "Ingrese la distancia recorrida en km:"
    |> Util.input(:float)

    combustible = "Ingrese la cantidad de combustible consumido en litros:"
    |> Util.input(:float)

    rendimiento = calcular_rendimiento(distancia, combustible)|> Float.round(2)

    generar_mensaje(nombre, rendimiento)
    |> Util.show_message()
  end

  def calcular_rendimiento(distancia, combustible) do
    distancia / combustible
  end

  def generar_mensaje(nombre, rendimiento) do
    "El conductor #{nombre} tiene un rendimiento de #{rendimiento} km/l."
  end

end



Main.main()
