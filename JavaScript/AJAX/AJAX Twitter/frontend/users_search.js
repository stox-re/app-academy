const APIUtil = require("./api_util");

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
      liBuilder += `<li><a href="/users/${user.id}">${user.username}</a></li>`;
    });

    this.ul.innerHTML = liBuilder;
  }
}

module.exports = UsersSearch;