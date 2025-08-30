defmodule Util do
  def show_message(message) do
     System.cmd("java",["-cp", ".", "Mensaje", message])
  end

  def show_message(:error, message) do
     System.cmd("java",["-cp", ".", "Mensaje", message])
  end

  def input(message, :string) do
    System.cmd("java",["-cp",".","Mensaje","input",message])
    |>elem(0)
    |>String.trim()
  end

  def input(message, :integer) do
    try do
      message
      |> input(:string)
      |> String.to_integer()
    rescue
      ArgumentError ->
        show_message(:error, "Error: El valor ingresado no es un entero válido.")
        message
        |> input(:integer)
    end
  end

  def input(message, :float) do
    try do
      message
      |> input(:string)
      |> String.to_float()
    rescue
      ArgumentError ->
        show_message(:error, "Error: El valor ingresado no es un número real válido.")
        input(message, :float)
    end
  end
end
