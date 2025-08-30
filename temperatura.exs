defmodule Main do
  def main do
    nombre = "Ingrese su nombre:"
    |> Util.input(:string)

    temperatura = "Ingrese temperatura en grados Celsius:"
    |> Util.input(:float)

    fahrenheit = calcular_fahrenheit(temperatura)|> Float.round(1)
    kelvin = calcular_kelvin(temperatura)|> Float.round(1)

    generar_mensaje(nombre, fahrenheit, kelvin)
    |> Util.show_message()
    end

  defp calcular_fahrenheit(celsius) do
    (celsius * 9 / 5) + 32
  end

  defp calcular_kelvin(celsius) do
    celsius + 273.15
  end

  defp generar_mensaje(nombre, fahrenheit, kelvin) do
    "Señor #{nombre} la temperatura es #{fahrenheit} °F y #{kelvin} K."
  end

end




Main.main()
