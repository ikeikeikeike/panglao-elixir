defmodule PanglaoElixir.Auth do
  alias PanglaoElixir.Client

  def login(params) do
    Client.post! "/auth/login", {:form, params}
  end

end
