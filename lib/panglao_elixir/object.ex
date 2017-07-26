defmodule PanglaoElixir.Object do
  import PanglaoElixir.Client

  alias PanglaoElixir.Auth

  @moduledoc """
  authed_get"/link", ObjectController, :link
  authed_get"/info", ObjectController, :info
  authed_get"/alive", ObjectController, :alive
  authed_get"/rename", ObjectController, :rename
  authed_get"/upload", ObjectController, :upload
  authed_get"/splash", ObjectController, :splash
  authed_get"/audio", ObjectController, :audio
  authed_get"/preview", ObjectController, :preview
  """

  def link(token, params) do
    authed_get"/object/link", auth(token), params:  params
  end
  def link(params) do
    link Auth.token, params
  end
  def link!(token, params) do
    authed_get!"/object/link", auth(token), params:  params
  end
  def link!(params) do
    link! Auth.token, params
  end

  def alive(token, params) do
    authed_get"/object/alive", auth(token), params:  params
  end
  def alive(params) do
    alive Auth.token, params
  end
  def alive!(token, params) do
    authed_get!"/object/alive", auth(token), params:  params
  end
  def alive!(params) do
    alive! Auth.token, params
  end

  def info(token, params) do
    authed_get"/object/info", auth(token), params:  params
  end
  def info(params) do
    info Auth.token, params
  end
  def info!(token, params) do
    authed_get!"/object/info", auth(token), params:  params
  end
  def info!(params) do
    info! Auth.token, params
  end

  def rename(token, params) do
    authed_get"/object/rename", auth(token), params:  params
  end
  def rename(params) do
    rename Auth.token, params
  end
  def rename!(token, params) do
    authed_get!"/object/rename", auth(token), params:  params
  end
  def rename!(params) do
    rename! Auth.token, params
  end

  def upload(token, params) do
    authed_get"/object/upload", auth(token), params:  params
  end
  def upload(params) do
    upload Auth.token, params
  end
  def upload!(token, params) do
    authed_get!"/object/upload", auth(token), params:  params
  end
  def upload!(params) do
    upload! Auth.token, params
  end

  def audio(token, params) do
    authed_get"/object/audio", auth(token), params:  params
  end
  def audio(params) do
    audio Auth.token, params
  end
  def audio!(token, params) do
    authed_get!"/object/audio", auth(token), params:  params
  end
  def audio!(params) do
    audio! Auth.token, params
  end

  def preview(token, params) do
    authed_get"/object/preview", auth(token), params:  params
  end
  def preview(params) do
    preview Auth.token, params
  end
  def preview!(token, params) do
    authed_get!"/object/preview", auth(token), params:  params
  end
  def preview!(params) do
    preview! Auth.token, params
  end

  def splash(token, params) do
    authed_get"/object/splash", auth(token), params:  params
  end
  def splash(params) do
    splash Auth.token, params
  end
  def splash!(token, params) do
    authed_get!"/object/splash", auth(token), params:  params
  end
  def splash!(params) do
    splash! Auth.token, params
  end

end
