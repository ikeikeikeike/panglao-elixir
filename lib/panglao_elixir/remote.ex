defmodule PanglaoElixir.Remote do
  import PanglaoElixir.Client

  alias PanglaoElixir.Auth

  def upload(token, params) do
    authed_get"/remote/upload", auth(token), params:  params
  end
  def upload(params) do
    upload Auth.token, params
  end
  def upload!(token, params) do
    authed_get!"/remote/upload", auth(token), params:  params
  end
  def upload!(params) do
    upload! Auth.token, params
  end

  def support(token) do
    authed_get"/remote/support", auth(token)
  end
  def support do
    support Auth.token
  end
  def support!(token) do
    authed_get!"/remote/support", auth(token)
  end
  def support! do
    support! Auth.token
  end

  def status(token, params) do
    authed_get"/remote/status", auth(token), params:  params
  end
  def status(params) do
    status Auth.token, params
  end
  def status!(token, params) do
    authed_get!"/remote/status", auth(token), params:  params
  end
  def status!(params) do
    status! Auth.token, params
  end

end
