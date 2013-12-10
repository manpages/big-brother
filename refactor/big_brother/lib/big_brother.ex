defmodule BigBrother do
  use Application.Behaviour

  def start(_type, _args) do
    dispatch = [
      {:_, [
          {"/[...]", BigBrother.HTTP}
      ]}
    ] |> :cowboy_router.compile
    {:ok, _} = :cowboy.start_http(:http, 100,
                                  [port: 1984],
                                  [env: [dispatch: dispatch]])
    BigBrother.Supervisor.start_link
  end
end
