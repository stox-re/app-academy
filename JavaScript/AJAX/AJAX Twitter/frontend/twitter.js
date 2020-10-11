const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$(() => {
  let followButtons = $('.follow-toggle');
  let navSearches = $('.users-search');

  $.each(followButtons, (index, followButton) => {
    new FollowToggle(followButton)
  });

  $.each(navSearches, (index, searchNav) => {
    new UsersSearch(searchNav);
  });
})