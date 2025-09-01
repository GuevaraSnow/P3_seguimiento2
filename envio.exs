defmodule Main do
  @moduledoc """
  Módulo principal para calcular el costo de un envío según el peso y tipo de servicio.
  """

  def main do
    nombre = pedir_texto()

    peso =
      "Ingrese el peso del paquete: "
      |> Util.input(:float)

    tipo_envio = pedir_tipo()

    case validar_tipo_envio(tipo_envio) do
      :ok ->
        generar_salida(nombre, peso, tipo_envio)
        |> Tuple.to_list()
        |> Enum.join(" - ")
        |> Util.show_message()

      :error ->
        "Tipo de envío no válido. Intente de nuevo."
        |> Util.show_message()
    end
  end

  @doc """
  Solicita el nombre del destinatario del envío.
  """
  def pedir_texto() do
    "Envío a nombre de: "
    |> Util.input(:string)
  end

  @doc """
  Solicita el tipo de envío, lo normaliza (quita espacios y capitaliza).
  Tipos válidos: "Economico", "Express", "Internacional".
  """
  def pedir_tipo() do
    "Ingrese el tipo de envío (Economico, Express, Internacional): "
    |> Util.input(:string)
    |> String.trim()
    |> String.capitalize()
  end

  @doc """
  Calcula el costo del envío según el peso y el tipo:
    - Economico: 5000 por kg
    - Express: 8000 por kg
    - Internacional: 15000 por kg hasta 5kg, luego 12000 por kg
  """
  def calcular_costo(peso, tipo_envio) do
    case tipo_envio do
      "Economico" -> peso * 5000
      "Express" -> peso * 8000
      "Internacional" ->
        if peso <= 5, do: peso * 15000, else: peso * 12000
    end
  end

  @doc """
  Valida si el tipo de envío ingresado corresponde a uno de los tipos aceptados.
  Retorna `:ok` si es válido, `:error` en caso contrario.
  """
  def validar_tipo_envio(tipo_envio) do
    if tipo_envio in ["Economico", "Express", "Internacional"] do
      :ok
    else
      :error
    end
  end

  @doc """
  Genera una tupla con los datos del envío:
  `{nombre, peso, tipo_envio, costo_total}`
  """
  def generar_salida(nombre, peso, tipo_envio) do
    costo_total = calcular_costo(peso, tipo_envio) |> trunc()
    {nombre, peso, tipo_envio, costo_total}
  end
end

Main.main()
