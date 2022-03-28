export const Tweet = {
  mounted(){
    const tweetId = this.el.dataset.tweetId
    twttr.widgets.createTweet(
      tweetId,
      document.getElementById('tweet-embed')
    );
  }
};
