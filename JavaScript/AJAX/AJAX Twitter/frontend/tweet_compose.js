const APIUtil = require("./api_util");

class TweetCompose {
  constructor(el) {
    this.el = el;
    this.input = $(this.el).find(':submit')[0];
    this.charsLeft = $(this.el).find('.chars-left')[0];
    this.handleInput();
    this.charHandler();
  }

  charHandler() {
    const self = this;
    let textarea = $($(self.el).find('textarea')[0]);

    textarea.on('input', function(){
      console.log(textarea.val().length);
      self.charsLeft.innerHTML = 140 - textarea.val().length;
    });
  }

  handleInput() {
    const self = this;

    $(self.el).on('submit', function(evt) {
      evt.preventDefault();
      let jsonObj = $(self.el).serializeJSON();
      APIUtil.createTweet(jsonObj).then(self.handleSuccess.bind(self));
      self.disableInputs(true);
    });
  }

  disableInputs(enabled) {
    $(this.el).find(':input').each((index, item) => {
      $(item).prop('disabled', enabled);
    });
  }

  handleSuccess(data) {
    this.disableInputs(false);
    $(this.el).trigger('reset');
    let date = new Date(Date.parse(data.updated_at));
    let dateString = `${date.getDate()} / ${date.getMonth()}`;
    $("#feed").prepend(`<li>${data.content} <a href="/users/${data.user.id}">- ${data.user.username} -</a> ${dateString}</li>`)
    this.charsLeft.innerHTML = '';
  }
}

module.exports = TweetCompose;