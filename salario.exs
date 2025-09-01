defmodule Main do
  @moduledoc """
  Programa para calcular el salario total de un empleado considerando
  el salario base, las horas extras trabajadas y el valor por hora.
  """

  def main do
    # Solicita el nombre del empleado
    nombre = "Ingrese su nombre: "
    |> Util.input(:string)

    # Solicita el salario base
    salario_base = "Ingrese su salario base: "
    |> Util.input(:float)

    # Solicita las horas extras trabajadas
    horas_extras = "Ingrese sus horas extras: "
    |> Util.input(:integer)

    # Solicita el valor de la hora de trabajo
    valor_hora = "Ingrese el valor por hora: "
    |> Util.input(:float)

    # Calcula el salario total
    salario = calcular_salario(salario_base, horas_extras, valor_hora)

    # Genera y muestra el mensaje final
    generar_mensaje(nombre, salario)
    |> Util.show_message()
  end

  @doc """
  Calcula el salario total del empleado.
  El pago de las horas extras se multiplica por 1.5.
  Retorna el total formateado con 2 decimales.
  """
  defp calcular_salario(salario, extras, valor_hora) do
    total = salario + (extras * (valor_hora * 1.5))
    :erlang.float_to_binary(total, decimals: 2)
  end

  @doc """
  Genera un mensaje personalizado con el nombre del empleado
  y el salario calculado.
  """
  defp generar_mensaje(nombre, salario) do
    "#{nombre}, su salario es de #{salario}"
  end
end

Main.main()
