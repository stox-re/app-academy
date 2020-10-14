const Router = require('./router.js');
const Inbox = require('./inbox.js');
const Sent = require('./sent.js');
const Compose = require('./compose.js');

document.addEventListener('DOMContentLoaded', () => {
  window.location.hash = '#inbox';
  const menuLis = document.querySelectorAll('.sidebar-nav li');
  menuLis.forEach((item) => {
    item.addEventListener('click', (evt) => {
      window.location.hash = evt.target.innerText.toLowerCase();
    });
  });

  const thisContent = document.querySelector('.content');
  const routes = {
    'inbox': Inbox,
    'sent': Sent,
    'compose': Compose,
  };
  new Router(thisContent, routes);
})