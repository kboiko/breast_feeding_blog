defmodule BreastFeedingBlog.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :content, :string
    field :id, Ecto.UUID
    field :time, :utc_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content, :time, :id])
    |> validate_required([:title, :content, :time, :id])
  end
end
