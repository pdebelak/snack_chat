defmodule SnackChat.User do
  use SnackChat.Web, :model

  @token_key "user"

  schema "users" do
    field :username, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username])
    |> validate_required([:username])
  end

  @doc """
  Generates token used for user authentication.
  """
  def token(%__MODULE__{id: id}) do
    Phoenix.Token.sign(SnackChat.Endpoint, @token_key, id)
  end

  @doc """
  Finds user from authentication token. Returns `:error` if token invalid.
  """
  def from_token(token) do
    case Phoenix.Token.verify(SnackChat.Endpoint, @token_key, token) do
      {:ok, user_id} -> SnackChat.Repo.get!(__MODULE__, user_id)
      {:error, :invalid} -> :error
    end
  end
end
