import * as SessionUtils from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

const receiveCurrentUser = (user) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user: user
  };
};

const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER
  }
};

const receiveErrors = (errors) => {
  return {
    type: RECEIVE_ERRORS,
    errors: errors
  }
};

const receiveSessionErrors = (errors) => {
  return {
    type: RECEIVE_SESSION_ERRORS,
    errors: errors
  }
};

export const login = formUser => dispatch => SessionUtils.login(formUser)
  .then((user) => {
    dispatch(receiveCurrentUser(user));
  }).catch((errors) => {
    dispatch(receiveSessionErrors(errors));
  });

export const signup = formUser => dispatch => SessionUtils.signup(formUser)
  .then((user) => {
    dispatch(receiveCurrentUser(user));
  }).catch((errors) => {
    dispatch(receiveErrors(errors))
  });

export const logout = () => dispatch => SessionUtils.logout()
  .then(() => {
    dispatch(logoutCurrentUser());
  }).catch((errors) => {
    dispatch(receiveErrors(errors))
  });