defmodule PanglaoElixir.Auth do
  alias PanglaoElixir.Client

  @email Application.get_env(:panglao_elixir, :email)
  @password Application.get_env(:panglao_elixir, :password)

  def login(params) do
    Client.post "/auth/login", {:form, params}
  end

  def token(:force) do
    params = [email: @email, password: @password]
    key    = Poison.encode! Enum.into(params, %{})

    case login(params) do
      {:ok, %{body: %{"access_token" => token, "expires" => expires}}}
          when byte_size(token) > 0 ->
        # Set before expires time and divided millisecs.
        ttl   = (expires - :os.system_time(:seconds)) * 999
        value = %ConCache.Item{value: token, ttl: ttl}

        ConCache.put(:panglao_elixir, key, value)
        token

      error ->
        error
    end
  end

  def token do
    params = [email: @email, password: @password]
    key    = Poison.encode! Enum.into(params, %{})

    auth = ConCache.get(:panglao_elixir, key)
    if auth, do: auth, else: token(:force)
  end

end
