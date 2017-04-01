defmodule PanglaoElixir.Auth do
  alias PanglaoElixir.Client

  @email Application.get_env(:panglao_elixir, :email)
  @password Application.get_env(:panglao_elixir, :password)

  def login!(params) do
    Client.post! "/auth/login", {:form, params}
  end

  def token do
    params = [email: => @email, password: => @password]
    key    = Poison.encode! Enum.into(params, %{})

    if token = ConCache.get(:panglao_elixir, key) do
      token
    else
      case login!(params) do
        %{body: %{"access_token" => token}}
            when byte_size(token) > 0 ->
          ConCache.put(:panglao_elixir, key, token)
          token

        error ->
          error
      end
    end
  end

end
