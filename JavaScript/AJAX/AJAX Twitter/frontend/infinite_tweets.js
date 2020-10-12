const APIUtil = require('./api_util.js');

class InfiniteTweets {
  constructor() {
    this.fetchMore = $('.fetch-more');
    this.fetchMoreListener();
    this.maxCreatedAt = null;
    this.fetchTweets()
  }

  fetchMoreListener() {
    const self = this;

    self.fetchMore.on('click', function() {
      self.fetchTweets()
    });
  }

  fetchTweets() {
    APIUtil.fetchFeed(this.maxCreatedAt == null ? '' : this.maxCreatedAt).then(this.insertTweets.bind(this));
  }

  insertTweets(data) {
    data.forEach((item, index) => {
      let date = new Date(Date.parse(item.updated_at));
      let dateString = `${date.getDate()} / ${date.getMonth()}`;
      $("#feed").append(`<li>${item.content} <a href="/users/${item.user.id}">- ${item.user.username} -</a> ${dateString}</li>`)
      if (index == data.length - 1) {
        this.maxCreatedAt = item.created_at;
      }
    });

    if (data.length < 20) {
      this.fetchMore.text('No more tweets to fetch.');
    }
  }
}

module.exports = InfiniteTweets;