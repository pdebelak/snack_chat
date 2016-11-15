defmodule SnackChat.Room do
  use SnackChat.Web, :model

  schema "rooms" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def by_name(nil), do: nil
  def by_name(name) do
    SnackChat.Repo.get_by(__MODULE__, name: name)
  end
end
