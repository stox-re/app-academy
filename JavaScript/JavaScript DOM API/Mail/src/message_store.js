let messages = {
  sent: [
    {
      to: "friend@mail.com",
      subject: "Check this out",
      body: "It's so cool"
    },
    { to: "person@mail.com", subject: "zzz", body: "so booring" }
  ],
    inbox: [
      {
        from: "grandma@mail.com",
        subject: "Fwd: Fwd: Fwd: Check this out",
        body:
          "Stay at home mom discovers cure for leg cramps. Doctors hate her"
      },
      {
        from: "person@mail.com",
        subject: "Questionnaire",
        body: "Take this free quiz win $1000 dollars"
      }
    ]
};

class Message {
  constructor(messageObj) {
    this.from = messageObj.from || '';
    this.to = messageObj.to || '';
    this.subject = messageObj.subject || '';
    this.body = messageObj.body || '';
  }
  thisMessage() {
    return {
      from: this.from,
      to: this.to,
      subject: this.subject,
      body: this.body
    }
  }
}

let messageDraft = new Message({});

const MessageStore = {
  getInboxMessages: function() {
    return messages.inbox
  },

  getSentMessages: function() {
    return messages.sent
  },

  getMessageDraft: function() {
    return messageDraft;
  },

  sendDraft: function() {
    messages.sent.push(messageDraft.thisMessage());
    messageDraft = new Message({});
  },

  updateDraftField: function(field, value) {
    messageDraft[field] = value;
  }
};


module.exports = MessageStore;