class DOMNodeCollection {
  constructor(htmlElements) {
    this.htmlElements = htmlElements;
  }

  html(string) {
    if (string != null) {
      this.htmlElements.forEach((element, index) => {
        element.innerHTML = string;
      });
    } else {
      return this.htmlElements[0].innerHTML;
    }
  }

  empty() {
    this.htmlElements.forEach((element, index) => {
      element.innerHTML = '';
    });
  }

  append(args) {
    if (typeof args == 'string') {

      this.htmlElements.forEach((element) => {
        element.innerHTML += args;
      });
    } else if (args instanceof HTMLElement) {

      this.htmlElements.forEach((element) => {
        element.innerHTML += args.outerHTML;
      });
    } else if (args instanceof DOMNodeCollection) {

      this.htmlElements.forEach((element) => {
        args.htmlElements.forEach((argElement) => {
          element.innerHTML += argElement.outerHTML;
        });
      });
    }
  }

  addClass(cssClass) {
    this.htmlElements.forEach((element) => {
      element.classList.add(cssClass);
    });
  }

  removeClass(cssClass) {
    this.htmlElements.forEach((element) => {
      element.classList.remove(cssClass);
    });
  }

  attr(name, value) {
    this.htmlElements.forEach((element) => {
      element.setAttribute(name, value);
    });
  }

  children() {
    let childrenArray = [];

    this.htmlElements.forEach((element) => {
      let childArray = Array.from(element.children);

      childArray.forEach((child) => {
        childrenArray.push(child);
      });
    });

    return new DOMNodeCollection(childrenArray);
  }

  parent() {
    let parentsArray = [];

    this.htmlElements.forEach((element) => {
      parentsArray.push(element.parentElement);
    });
    return new DOMNodeCollection(parentsArray)
  }

  find(findArg) {
    let foundNodes = [];

    this.htmlElements.forEach((element) => {

      let theseFoundElements = element.querySelectorAll(findArg);
      theseFoundElements.forEach((foundElement) => {
        foundNodes.push(foundElement);
      });
    });
    return foundNodes;
  }

  remove() {
    this.htmlElements.forEach((element) => {
      element.remove();
    });
  }

  on(eventType, callback) {
    this.htmlElements.forEach((element) => {
      element.eventCallback = callback;
      element.addEventListener(eventType, callback);
    });
  }

  off(eventType) {
    this.htmlElements.forEach((element) => {
      element.removeEventListener(eventType, element.eventCallback);
    });
  }
}

module.exports = DOMNodeCollection;