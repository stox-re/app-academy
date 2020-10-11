const FollowToggle = require('./follow_toggle.js');

$(() => {
  let followButtons = $('.follow-toggle');

  $.each(followButtons, (index, followButton) => {
    new FollowToggle(followButton)
  });
})