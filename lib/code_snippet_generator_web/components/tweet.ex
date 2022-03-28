defmodule CodeSnippetGeneratorWeb.Components.Tweet do
  use Surface.Component

  @doc "The name"
  prop tweet, :struct

  def render(assigns) do
    ~F"""
    <div id="tweet-embed" :hook="Tweet" data-tweet-id={@tweet.tweet_id}>
      {@tweet.text}
    </div>
    """
  end
end
