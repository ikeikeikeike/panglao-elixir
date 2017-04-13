defmodule PanglaoElixir.Object do
  import PanglaoElixir.Client

  alias PanglaoElixir.Auth

  @moduledoc """
  get "/link", ObjectController, :link
  get "/info", ObjectController, :info
  get "/rename", ObjectController, :rename
  get "/upload", ObjectController, :upload
  get "/splash", ObjectController, :splash
  """

  def link!(token, params) do
    get! "/object/link", auth(token), params:  params
  end
  def link!(params) do
    link! Auth.token, params
  end

  def info!(token, params) do
    get! "/object/info", auth(token), params:  params
  end
  def info!(params) do
    info! Auth.token, params
  end

  def rename!(token, params) do
    get! "/object/rename", auth(token), params:  params
  end
  def rename!(params) do
    rename! Auth.token, params
  end

  def upload!(token, params) do
    get! "/object/upload", auth(token), params:  params
  end
  def upload!(params) do
    upload! Auth.token, params
  end

  def splash!(token, params) do
    get! "/object/splash", auth(token), params:  params
  end
  def splash!(params) do
    splash! Auth.token, params
  end

end
