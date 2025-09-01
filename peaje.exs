defmodule Main do
  @moduledoc """
  Calcula la tarifa de peaje según el tipo y peso del vehículo.
  """

  @doc """
  Inicia el programa solicitando placa, tipo y peso.
  Muestra el valor a pagar en peaje.
  """
  def main do
    placa = "Ingrese la placa del Vehículo:"
    |> Util.input(:string)
    |> String.upcase()

    tipo = "Ingrese el tipo de vehículo (Carro, Moto, Camion):"
    |> Util.input(:string)
    |> String.capitalize()

    peso = "Ingrese el peso del vehículo en toneladas:"
    |> Util.input(:float)

    tarifa = calcular_tarifa(tipo, peso)

    "Vehículo #{placa} (#{tipo}) debe pagar $#{tarifa}"
    |> Util.show_message()
  end

  @doc """
  Retorna la tarifa de peaje según:
    - Carro: $10.000
    - Moto: $5.000
    - Camion: $20.000 + $2.000 por tonelada
  """
  defp calcular_tarifa("Carro", _peso), do: 10000
  defp calcular_tarifa("Moto", _peso), do: 5000
  defp calcular_tarifa("Camion", peso), do: 20000 + round(peso * 2000)
end

Main.main()
