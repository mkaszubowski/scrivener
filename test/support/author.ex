defmodule Scrivener.Author do
  use EctoOne.Model

  schema "authors" do
    field :name, :string

    has_many :comments, Scrivener.Comment

    timestamps
  end
end
