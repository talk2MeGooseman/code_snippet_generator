defmodule Twitter do
  def read_stream_media(track) do
    stream = ExTwitter.stream_filter(track: track)
    for tweet <- stream do
      entities = tweet.entities
      case entities.media do
        media = [%ExTwitter.Model.Media{} | _other_media] ->
          Enum.map(media, fn data -> IO.puts(data.media_url_https) end)
        [] ->
          IO.puts("No media in tweet")
        nil ->
          IO.puts("No media in tweet")
      end

    end
  end
end
