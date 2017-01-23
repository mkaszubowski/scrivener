defmodule Scrivener.Repo.Migrations.CreateComments do
  use EctoOne.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :post_id, :integer

      timestamps
    end
  end
end
