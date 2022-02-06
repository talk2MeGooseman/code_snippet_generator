defmodule CodeSnippetGenerator.Workers.Test do
  use Oban.Worker, queue: :default

  # %{id: 1} |> CodeSnippetGenerator.Workers.Test.new(schedule_in: 5) |> Oban.insert()

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id} = _args}) do


    case id do
      1 ->
        IO.puts("one was passed")

      2 ->
        IO.puts("two was passed")

      _ ->
        IO.puts("something else was passed")
    end

    :ok
  end
end
