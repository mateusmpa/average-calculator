defmodule Student do
  @moduledoc """
  Define a Student struct and functions to handle a student.
  """
  defstruct name: nil, results: []

  @doc """
  Get the first name of a Student.

  ## Parameters

  - `student` - A student struct.

  ## Examples

  * padawan = %Student{name: "Anakin Skywalker"}
  * Student.first_name(padawan)
  * "Anakin"
  """
  def first_name(student) do
    student.name
    |> String.split
    |> List.first
  end

  @doc """
  Get the last name of a Student.

  ## Parameters

  - `student` - A student struct.

  ## Examples

  * padawan = %Student{name: "Anakin Skywalker"}
  * Student.last_name(padawan)
  * "Skywalker"
  """
  def last_name(student) do
    student.name
    |> String.split
    |> List.last
  end
end
