// npm install --save react - redux
import { Provider } from "react-redux";

/*
  Oftentimes, a deeply nested component will need access to the store,
  while its parents do not. Using vanilla React, these parents would
  have to receive the store prop in order to pass it down to its child.

  Instead of that, we can use Provider/connect() API from react-redux
*/


// root.jsx
import React from "react";
import { Provider } from "react-redux";
import App from "./app.jsx";

const Root = ({ store }) => (
  <Provider store={store}>
    <App />
  </Provider>
);
export default Root;


// entry.js
import React from "react";
import ReactDOM from "react-dom";
import { createStore } from "redux";
import reducer from "./reducer.js";
import Root from "./root.jsx";

document.addEventListener("DOMContentLoaded", () => {
  const store = createStore(reducer);
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, rootEl);
});

/*
  The react - redux package allows us to access the store context set by the Provider
  in a powerful and convenient way via the connect() method.
  */

const createConnectedComponent = connect(
  mapStateToProps,
  mapDispatchToProps
);
// Connect returns a function

const ConnectedComponent = createConnectedComponent(MyComponent);


const MyComponent = ({ name }) => (
  <div>{name}</div>
);
const mapStateToProps = state => ({
  name: state.name
});
const ConnectedComponent = connect(mapStateToProps)(MyComponent);

// Optional
const mapStateToProps = (state, ownProps) => ({
  firstName: state.name,
  initials: `${state.name[0]}. ${ownProps.lastName[0]}.`
});
ConnectedComponent = connect(mapStateToProps)(MyComponent);


// mapDispatchToProps
const deleteTodo = id => ({ type: "DELETE_TODO", id }); // action creators
const addTodo = msg => ({ type: "ADD_TODO", msg });

const mapDispatchToProps = dispatch => ({
  handleDelete: id => dispatch(deleteTodo(id)),
  handleAdd: msg => dispatch(addTodo(msg))
});

// Putting it all together
const MyComponent = ({ firstName, initials, handleAdd, handleDelete }) => {
  return <div>...</div>;
};

const mapStateToProps = (state, ownProps) => ({
  firstName: state.name,
  initials: `${state.name[0]}. ${ownProps.lastName[0]}.`
});

const mapDispatchToProps = dispatch => ({
  handleDelete: id => dispatch(deleteTodo(id)),
  handleAdd: msg => dispatch(addTodo(msg))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyComponent);