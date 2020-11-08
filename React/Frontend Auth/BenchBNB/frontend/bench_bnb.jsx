import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import Root from './components/root';

import * as SessionUtils from './util/session_api_util';
import { login } from './actions/session_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.SessionUtils = SessionUtils;
  window.dispatch = store.dispatch;
  window.login = login;

  ReactDOM.render(<Root store={store}/>, root);
});