const APIUtil = require("./api_util");
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.el = el;
    this.input = $(this.el).find('input')[0];
    this.ul = $(this.el).find('ul')[0];
    this.handleInput();
  }

  handleInput() {
    let self = this;
    $(self.input).on('input', function() {
      APIUtil.searchUsers($(self.input).val()).then(self.render.bind(self))
    })
  }

  render(data) {
    this.ul.innerHTML = '';
    let liBuilder = '';

    data.forEach((user, index) => {
      let newButton = `<button class="follow-toggle" data-user-id="${user.id}" data-initial-follow-state="${user.followed}">${user.followed ? "Unfollow!" : "Follow!"}</button>`;
      liBuilder += `<li><a href="/users/${user.id}">${user.username}</a>${newButton}</li>`;
    });

    this.ul.innerHTML = liBuilder;
    let followButtons = $(this.ul).find('.follow-toggle');
    $.each(followButtons, (index, followButton) => {
      new FollowToggle(followButton)
    });
  }
}

module.exports = UsersSearch;