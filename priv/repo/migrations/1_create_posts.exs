defmodule TestRepo.Migrations.CreatePosts do
  use EctoOne.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string
      add :published, :boolean

      timestamps
    end
  end
end
