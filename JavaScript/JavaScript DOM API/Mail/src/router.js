class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
    this.start();
  }

  start() {
    this.render();
    window.addEventListener('hashchange', this.render.bind(this));
  }

  activeRoute() {
    const thisRoute = window.location.hash.split('#')[1];
    return this.routes[thisRoute];
  }

  render() {
    const component = this.activeRoute();
    this.node.innerHTML = '';

    if (typeof component != 'undefined') {
      this.node.appendChild(component.render());
    }
  }
}

module.exports = Router;