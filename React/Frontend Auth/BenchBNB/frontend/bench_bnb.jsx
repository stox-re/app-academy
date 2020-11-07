import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import * as SessionUtils from './util/session_api_util';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch; // just for testing!

  window.SessionUtils = SessionUtils;
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});