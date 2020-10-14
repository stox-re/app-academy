const MessageStore = require('./message_store.js');

const Inbox = {
  render: () => {
    let inboxMessages = MessageStore.getInboxMessages();
    let newUl = document.createElement('ul');
    newUl.classList.add('messages');

    inboxMessages.forEach((currentMessage) => {
      newUl.appendChild(Inbox.renderMessage(currentMessage));
    });
    return newUl;
  },

  renderMessage: (messageObj) => {
    let newLi = document.createElement('li');
    newLi.classList.add('message');
    newLi.innerHTML = `<span class="from">${messageObj.from}</span><span class="subject">${messageObj.subject}</span> - <span class="body">${messageObj.body}</span>`;
    return newLi;
  }
};

module.exports = Inbox;