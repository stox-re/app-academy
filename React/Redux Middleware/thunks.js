/*
  It would be possible to make these API calls from our components and dispatch synchronously on success,
  but for consistency and reusability we would prefer to have the source of every change to our app state be an action creator.
  Thunks are a new kind of action creator that will allow us to do that.
*/

// middleware/thunk_middleware.js
const thunk = ({ dispatch, getState }) => next => action => {
  if (typeof action === 'function') {
    return action(dispatch, getState);
  }
  return next(action);
};

export default thunk;

// utils/contacts_api_util.js
export const fetchContacts = () => $.ajax({ url: 'api/contacts' });

import * as ContactAPIUtil from '../utils/contacts_api_util';
//action creator which returns an object
export const receiveContacts = contacts => ({
  type: RECEIVE_CONTACTS,
  contacts
});

// async action creator which returns a function
export const fetchContacts = () => dispatch => {
  return  ContactAPIUtil.fetchContacts().then(contacts => dispatch(receiveContacts(contacts)));
};

// redux-thunk library