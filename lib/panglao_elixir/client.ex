defmodule PanglaoElixir.Client do
  use HTTPoison.Base

  @endpoint Application.get_env(:panglao_elixir, :endpoint)

  def process_url(path) do
    Path.join @endpoint, path
  end

  def process_request_body(body) do
    case body do
      {:form, form} ->
        {:form, transform(form)}
      body ->
        body
    end
  end

  def process_request_options(options) do
    Keyword.merge options, [hackney: [pool: :panglao_elixir]]
  end

  def process_response_body(body) do
    case Poison.decode body do
      {:ok,    body}        -> body
      {:error, body}        -> body
      {:error, :invalid, 0} -> body
    end
  end

  def auth(token) do
    ["Authorization": "Bearer #{token}"]
  end

  defp transform(payload) do
    for {k, v} <- payload, into: [], do: {:"#{k}", v}
  end
end
