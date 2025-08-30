defmodule Main do
  def main do
    nombre = "Ingrese su nombre: "
     |>Util.input(:string)

    peso = "Ingrese el peso en kg: "
    |>Util.input(:float)

    tipo= "Ingrese el tipo de envio (Económico, Express, Internacional)."
    |>Util.input(:string)

    tarifa = calcular_tarifa(tipo,peso)

    generar_mensaje(nombre, peso, tipo, tarifa)
    |>Util.show_message()
  end
end
