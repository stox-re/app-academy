const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el) {
    this.el = el
    this.userId = el.dataset.userId;
    this.followState = el.dataset.initialFollowState == 'true';
    this.render();
    this.handleClick();
  }

  render() {
    $(this.el).prop('disabled', false);
    if (this.followState == false) {
      this.el.innerHTML = 'Follow!';
    } else {
      this.el.innerHTML = 'Unfollow!'
    }
  }

  handleClick() {
    let self = this;

    let followReturnCall = function() {
      self.followState = !self.followState;
      self.render();
    };

    $(self.el).on('click', (evt) => {
      $(self.el).prop('disabled', true);
      evt.preventDefault();
      if (self.followState) {
        APIUtil.unfollowUser(self.userId).then(followReturnCall);
      } else {
        APIUtil.followUser(self.userId).then(followReturnCall);
      }
    });
  }
}

module.exports = FollowToggle;