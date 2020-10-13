const DOMNodeCollection = require('./dom_node_collection.js');

let callbacks = [];
let domLoaded = false;

function $l(args) {
  if (args instanceof HTMLElement) {
    return new DOMNodeCollection([args]);
  } else if (typeof args == 'string') {
    return new DOMNodeCollection(Array.from(document.querySelectorAll(args)));
  } else if (args instanceof Function) {
    if (domLoaded) {
      args();
    } else {
      callbacks.push(args);
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  domLoaded = true;
  window.$l = $l;
  window.DOMNodeCollection = DOMNodeCollection;

  callbacks.forEach((callback) => {
    callback();
  });
})