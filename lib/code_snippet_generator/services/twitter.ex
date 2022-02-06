defmodule Twitter do
  def analyze(tweet_id) do
    tweet = ExTwitter.show(tweet_id, include_entities: true)
    maybe_analyze_tweet(tweet)
  end

  def read_stream_media(track) do
    stream = ExTwitter.stream_filter(track: track)

    for tweet <-
          stream do
      maybe_analyze_tweet(tweet)
    end
  end

  defp maybe_analyze_tweet(%ExTwitter.Model.Tweet{} = tweet)
       when is_nil(tweet.retweeted_status) and is_nil(tweet.quoted_status) do
    entities = tweet.entities

    case entities.media do
      media = [%ExTwitter.Model.Media{} | _other_media] ->
        media_urls = Enum.map(media, fn data -> data.media_url_https end)

        case CodeSnippetGenerator.Twitter.create_tweet(%{
               author: tweet.user.name,
               text: tweet.text,
               lang: tweet.lang,
               # sent_on: Timex.parse(tweet.created_at, "%a %b %d %X %z %Y", :strftime),
               tweet_id: tweet.id_str,
               twitter_user_id: tweet.user.id_str,
               media: media_urls
             }) do
          {:ok, record} ->
            IO.puts("Saved tweet: #{tweet.text}")
            # Create oban job to Send to Azure OCR and process
            CodeSnippetGenerator.Workers.OcrProcess.new(%{id: record.id}) |> Oban.insert()

          {:error, changeset} ->
            # Something went wrong
            IO.inspect(changeset)
        end

      [] ->
        IO.puts("No media in tweet")

      nil ->
        IO.puts("No media in tweet")
    end
  end

  defp maybe_analyze_tweet(%ExTwitter.Model.Tweet{}) do
    IO.puts("Tweet is a retweet or quote")
  end
end
