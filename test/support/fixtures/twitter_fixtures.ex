defmodule CodeSnippetGenerator.TwitterFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CodeSnippetGenerator.Twitter` context.
  """

  @doc """
  Generate a tweet.
  """
  def tweet_fixture(attrs \\ %{}) do
    {:ok, tweet} =
      attrs
      |> Enum.into(%{
        author: "some author",
        lang: "some lang",
        media: [],
        sent_on: ~U[2022-01-08 20:01:00Z],
        text: "some text",
        tweet_id: "some tweet_id",
        twitter_user_id: "some twitter_user_id",
        status: :not_started
      })
      |> CodeSnippetGenerator.Twitter.create_tweet()

    tweet
  end
end
