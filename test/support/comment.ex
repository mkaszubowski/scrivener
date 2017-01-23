defmodule Scrivener.Comment do
  use EctoOne.Model

  schema "comments" do
    field :body, :string

    belongs_to :post, Scrivener.Post
    belongs_to :author, Scrivener.Author

    timestamps
  end
end
