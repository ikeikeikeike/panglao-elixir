defmodule PanglaoElixir.Remote do
  import PanglaoElixir.Client

  alias PanglaoElixir.Auth

  def upload(token, params) do
    get! "/remote/upload", auth(token), params:  params
  end

  def status(token, params) do
    get! "/remote/status", auth(token), params:  params
  end

  def upload(params) do
    upload Auth.token, params
  end

  def status(params) do
    status Auth.token, params
  end

end
