defmodule Scrivener.Post do
  use EctoOne.Model
  import EctoOne.Query

  schema "posts" do
    field :title, :string
    field :body, :string
    field :published, :boolean

    has_many :comments, Scrivener.Comment
    has_many :authors, through: [:comments, :author]

    timestamps
  end

  def published(query) do
    query |> where([p], p.published == true)
  end

  def unpublished(query) do
    query |> where([p], p.published == false)
  end
end
