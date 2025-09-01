defmodule Main do
  @moduledoc """
  Módulo principal para la conversión de temperaturas desde grados Celsius
  hacia Fahrenheit y Kelvin.
  """

  @doc """
  Inicia el proceso solicitando el nombre del usuario y la temperatura en grados Celsius,
  luego calcula su equivalente en Fahrenheit y Kelvin, y finalmente muestra el resultado.
  """
  def main do
    nombre = "Ingrese su nombre:"
    |> Util.input(:string)

    temperatura = "Ingrese temperatura en grados Celsius:"
    |> Util.input(:float)

    fahrenheit = calcular_fahrenheit(temperatura) |> Float.round(1)
    kelvin = calcular_kelvin(temperatura) |> Float.round(1)

    generar_mensaje(nombre, fahrenheit, kelvin)
    |> Util.show_message()
  end

  @doc """
  Convierte una temperatura de grados Celsius a grados Fahrenheit.

  ## Parámetros
    - `celsius`: valor en grados Celsius (float).

  ## Retorna
    - Valor en grados Fahrenheit (float).
  """
  defp calcular_fahrenheit(celsius) do
    (celsius * 9 / 5) + 32
  end

  @doc """
  Convierte una temperatura de grados Celsius a Kelvin.

  ## Parámetros
    - `celsius`: valor en grados Celsius (float).

  ## Retorna
    - Valor en Kelvin (float).
  """
  defp calcular_kelvin(celsius) do
    celsius + 273.15
  end

  @doc """
  Genera un mensaje con el nombre del usuario y las temperaturas convertidas.

  ## Parámetros
    - `nombre`: nombre del usuario.
    - `fahrenheit`: valor convertido a grados Fahrenheit.
    - `kelvin`: valor convertido a Kelvin.

  ## Retorna
    - Un string con el mensaje final.
  """
  defp generar_mensaje(nombre, fahrenheit, kelvin) do
    "Señor #{nombre} la temperatura es #{fahrenheit} °F y #{kelvin} K."
  end
end

Main.main()
