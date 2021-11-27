defmodule BreastFeedingBlog.ArticlesTest do
  use BreastFeedingBlog.DataCase

  alias BreastFeedingBlog.Articles

  describe "articles" do
    alias BreastFeedingBlog.Articles.Article

    @valid_attrs %{content: "some content", id: "7488a646-e31f-11e4-aace-600308960662", time: "2010-04-17T14:00:00Z", title: "some title"}
    @update_attrs %{content: "some updated content", id: "7488a646-e31f-11e4-aace-600308960668", time: "2011-05-18T15:01:01Z", title: "some updated title"}
    @invalid_attrs %{content: nil, id: nil, time: nil, title: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Articles.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Articles.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Articles.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Articles.create_article(@valid_attrs)
      assert article.content == "some content"
      assert article.id == "7488a646-e31f-11e4-aace-600308960662"
      assert article.time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = Articles.update_article(article, @update_attrs)
      assert article.content == "some updated content"
      assert article.id == "7488a646-e31f-11e4-aace-600308960668"
      assert article.time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_article(article, @invalid_attrs)
      assert article == Articles.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Articles.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Articles.change_article(article)
    end
  end
end
