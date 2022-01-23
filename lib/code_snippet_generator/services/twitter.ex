defmodule Twitter do
  def read_stream_media(track) do
    stream = ExTwitter.stream_filter(track: track)

    for tweet when is_nil(tweet.retweeted_status) and is_nil(tweet.quoted_status) <- stream do
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
            {:ok, _} ->
              IO.puts("Saved tweet: #{tweet.text}")
              # Create oban job to Send to Azure OCR and process
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
  end
end
