defmodule CodeSnippetGenerator.TwitterTest do
  use CodeSnippetGenerator.DataCase

  alias CodeSnippetGenerator.Twitter

  describe "tweets" do
    alias CodeSnippetGenerator.Twitter.Tweet

    import CodeSnippetGenerator.TwitterFixtures

    @invalid_attrs %{author: nil, lang: nil, media: nil, sent_on: nil, text: nil, tweet_id: nil, twitter_user_id: nil}

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Twitter.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Twitter.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      valid_attrs = %{author: "some author", lang: "some lang", media: [], sent_on: ~U[2022-01-08 20:01:00Z], text: "some text", tweet_id: "some tweet_id", twitter_user_id: "some twitter_user_id"}

      assert {:ok, %Tweet{} = tweet} = Twitter.create_tweet(valid_attrs)
      assert tweet.author == "some author"
      assert tweet.lang == "some lang"
      assert tweet.media == []
      assert tweet.sent_on == ~U[2022-01-08 20:01:00Z]
      assert tweet.text == "some text"
      assert tweet.tweet_id == "some tweet_id"
      assert tweet.twitter_user_id == "some twitter_user_id"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      update_attrs = %{author: "some updated author", lang: "some updated lang", media: [], sent_on: ~U[2022-01-09 20:01:00Z], text: "some updated text", tweet_id: "some updated tweet_id", twitter_user_id: "some updated twitter_user_id"}

      assert {:ok, %Tweet{} = tweet} = Twitter.update_tweet(tweet, update_attrs)
      assert tweet.author == "some updated author"
      assert tweet.lang == "some updated lang"
      assert tweet.media == []
      assert tweet.sent_on == ~U[2022-01-09 20:01:00Z]
      assert tweet.text == "some updated text"
      assert tweet.tweet_id == "some updated tweet_id"
      assert tweet.twitter_user_id == "some updated twitter_user_id"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_tweet(tweet, @invalid_attrs)
      assert tweet == Twitter.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Twitter.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Twitter.change_tweet(tweet)
    end
  end
end
