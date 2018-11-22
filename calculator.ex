defmodule Calculator do
  @moduledoc """
  Define a Calculator module and functions to execute it.
  """

  @doc """
  Start the system to process some result.
  """
  def start() do
    padawan = %Student{name: "Anakin Skywalker", results: build_subjects([5.2, 3.9, 2.7, 9.8])}
    jedi_old_republic = %Student{name: "Obi-Wan Kenobi", results: build_subjects([5.4, 4.9, 2.2, 3.8])}
    jedi_new_order = %Student{name: "Luke Skywalker", results: build_subjects([8.4, 7.5, 9.4, 2.8])}
    sith = %Student{name: "Darth Vader", results: build_subjects([1.3, 8.5, 8.9, 7.6])}

    result = calculate([padawan, jedi_old_republic, jedi_new_order, sith])
    best = best_result(result)

    {result, best}
  end

  @doc """
  Get all students with their averages.

  ## Parameters

  - `students` - A list of Student structs.
  """
  defp calculate(students) do
    students
    |> Enum.map(&(
      %{
        first_name: Student.first_name(&1),
        last_name: Student.last_name(&1),
        average: average(&1)
      }
    ))
  end

  @doc """
  Calculate the average of a Student.

  ## Parameters

  - `student` - A Student struct.
  """
  defp average(student) do
    total = Enum.count(student.results)

    result = student.results
    |> Enum.map(&(&1.result))
    |> Enum.reduce(&(&1 + &2))

    Float.ceil(result / total, 2)
  end

  @doc """
  Get the grater average.

  ## Parameters

  - `students` - A list of students with their averages
  """
  defp best_result(students) do
    best = students
    |> Enum.map(&(&1.average))
    |> Enum.max

    students
    |> Enum.filter(&(&1.average === best))
  end

  @doc """
  Build some subjects and some random results.

  ## Parameters

  - `results` - A list of results
  """
  defp build_subjects(results) do
    subjects = ["Mathematics", "Portuguese", "Geography", "History"]

    subjects
    |> Enum.map(&(%Subject{name: &1, result: Enum.random(results)}))
  end
end
