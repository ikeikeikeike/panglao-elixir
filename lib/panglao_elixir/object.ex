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

  def splash!(token, params) do
    get! "/object/splash", auth(token), params:  params
  end

  def splash!(params) do
    splash! Auth.token, params
  end

end
