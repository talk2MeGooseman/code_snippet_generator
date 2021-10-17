defmodule CodeSnippetGenerator.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: CodeSnippetGenerator.Repo

  # def user_factory do
  #   %MyApp.User{
  #     name: "Jane Smith",
  #     email: sequence(:email, &"email-#{&1}@example.com"),
  #     role: sequence(:role, ["admin", "user", "other"]),
  #   }
  # end

  # def article_factory do
  #   title = sequence(:title, &"Use ExMachina! (Part #{&1})")
  #   # derived attribute
  #   slug = MyApp.Article.title_to_slug(title)
  #   %MyApp.Article{
  #     title: title,
  #     slug: slug,
  #     # associations are inserted when you call `insert`
  #     author: build(:user),
  #   }
  # end

  # # derived factory
  # def featured_article_factory do
  #   struct!(
  #     article_factory(),
  #     %{
  #       featured: true,
  #     }
  #   )
  # end

  # def comment_factory do
  #   %MyApp.Comment{
  #     text: "It's great!",
  #     article: build(:article),
  #   }
  # end
end
