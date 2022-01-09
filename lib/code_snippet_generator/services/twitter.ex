defmodule Twitter do
  def read_stream_media(track) do
    stream = ExTwitter.stream_filter(track: track)

    for tweet <- stream do
      entities = tweet.entities

      case entities.media do
        media = [%ExTwitter.Model.Media{} | _other_media] ->
          media_urls = Enum.map(media, fn data -> data.media_url_https end)

          # Save the tweet for processing later
          case CodeSnippetGenerator.Twitter.create_tweet(%{
            author: tweet.user.name,
            text: tweet.text,
            lang: tweet.lang,
            # sent_on: tweet.created_at,
            tweet_id: tweet.id_str,
            twitter_user_id: tweet.user.id_str,
            media: media_urls
          }) do
            {:ok, _} ->
              # Tweet was saved successfully
              IO.puts("Saved tweet: #{tweet.text}")
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
