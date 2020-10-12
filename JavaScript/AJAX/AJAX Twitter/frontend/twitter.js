const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet_compose.js');
const InfiniteTweets = require('./infinite_tweets.js');

$(() => {
  let followButtons = $('.follow-toggle');
  let navSearches = $('.users-search');
  let tweetComposes = $('.tweet-compose');

  $.each(followButtons, (index, followButton) => {
    new FollowToggle(followButton)
  });

  $.each(navSearches, (index, searchNav) => {
    new UsersSearch(searchNav);
  });

  $.each(tweetComposes, (index, tweetCompose) => {
    new TweetCompose(tweetCompose);
  });

  new InfiniteTweets();
})