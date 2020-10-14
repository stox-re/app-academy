const MessageStore = require('./message_store.js');

const Sent = {
  render: () => {
    let inboxMessages = MessageStore.getSentMessages();
    let newUl = document.createElement('ul');
    newUl.classList.add('messages');

    inboxMessages.forEach((currentMessage) => {
      newUl.appendChild(Sent.renderMessage(currentMessage));
    });
    return newUl;
  },

  renderMessage: (messageObj) => {
    let newLi = document.createElement('li');
    newLi.classList.add('message');
    newLi.innerHTML = `<span class="to">${messageObj.to}</span><span class="subject">${messageObj.subject}</span> - <span class="body">${messageObj.body}</span>`;
    return newLi;
  }
};

module.exports = Sent;