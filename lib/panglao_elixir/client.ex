defmodule PanglaoElixir.Client do
  use HTTPoison.Base

  alias PanglaoElixir.Auth
  alias HTTPoison.Error

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
    options
    |> Keyword.merge([hackney: [pool: :panglao_elixir]])
    |> Keyword.merge([recv_timeout: 30_000, timeout: 30_000])
  end

  def process_response_body(body) do
    case Poison.decode body do
      {:ok,    body} -> body
      {:error, body} -> body
      {:error, _, _} -> body
    end
  end

  def auth(token) do
    ["Authorization": "Bearer #{token}"]
  end

  defp transform(payload) do
    for {k, v} <- payload, into: [], do: {:"#{k}", v}
  end

  def authed_get(url, headers \\ [], options \\ []) do
    case get url, headers, options do
      {:ok, %HTTPoison.Response{status_code: 401}} ->
        authed_get url, auth(Auth.token(:force)), options

      otherwise ->
        otherwise
    end
  end

  def authed_get!(url, headers \\ [], options \\ []) do
    case authed_get url, headers, options do
      {:ok, response} -> response
      {:error, %Error{reason: reason}} -> raise Error, reason: reason
    end
  end
end
