defmodule Fsc.Repo.Migrations.CreateStories do
  use Ecto.Migration

  def change do
    create table(:stories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :url, :string
      add :body, :text
      add :author, {:array, :string}

      timestamps()
    end
  end
end
