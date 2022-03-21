defmodule Fsc.Fakestories.Story do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stories" do
    field :author, {:array, :string}
    field :body, :string
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :url, :body, :author])
    |> validate_required([:title, :url, :body, :author])
  end
end
