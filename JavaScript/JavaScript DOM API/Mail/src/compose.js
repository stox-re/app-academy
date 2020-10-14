const MessageStore = require('./message_store.js');

const Compose = {

  render: () => {
    let newDiv = document.createElement('div');
    newDiv.classList.add('new-message');
    newDiv.innerHTML = Compose.renderForm();

    newDiv.addEventListener('keydown', (event) => {
      MessageStore.updateDraftField(event.target.name, event.target.value)
    });
    newDiv.addEventListener('submit', (event) => {
      event.preventDefault();
      MessageStore.sendDraft();
      window.location.hash = '#inbox';
    });
    return newDiv;
  },

  renderForm: () => {
    let currentMessageDraft = MessageStore.getMessageDraft();
    return `
      <p class="new-message-header">New Message</p>
      <form class="compose-form">
        <input placeholder="Recipient" name="to" type="text" value="${currentMessageDraft.to}">
        <input placeholder="Subject" name="subject" type="text" value="${currentMessageDraft.subject}">
        <textarea name="body" rows="20">${currentMessageDraft.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">Send</button>
      </form>
    `;
  }
}

module.exports = Compose;