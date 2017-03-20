defmodule PanglaoElixir.Remote do
  import PanglaoElixir.Client

  def upload(token, params) do
    get! "/remote/upload", auth(token), params:  params
  end

  def status(token, params) do
    get! "/remote/status", auth(token), params:  params
  end
end
