defmodule Main do
  def main do
    nombre="Ingrese su nombre: "
    |>Util.input(:string)

    salario_base="Ingrese su salario base: "
    |>Util.input(:float)

    horas_extras="Ingrese sus horas extras: "
    |>Util.input(:integer)

    valor_hora="Ingrese el valor por hora: "
    |>Util.input(:float)

    salario=calcular_salario(salario_base,horas_extras,valor_hora)

    generar_mensaje(nombre,salario)
    |>Util.show_message()
  end

  defp calcular_salario(salario,extras,valor_hora)   do
    total = salario + (extras * (valor_hora * 1.5))
    :erlang.float_to_binary(total, decimals: 2)
  end

  defp generar_mensaje(nombre,salario)do
    "#{nombre},su salario es de #{salario}"
  end
end

Main.main()
