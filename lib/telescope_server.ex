
defmodule TelescopeServer.TaskingEndpoint do
  use Plug.Router

  plug :match

  plug(Plug.Parsers,
  parsers: [:json],
  pass: ["application/json"],
  json_decoder: Poison)

  plug(:dispatch)

  match _ do
    send_resp(conn, 404, "Page not found")
  end
end
