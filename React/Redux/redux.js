/*
  The Redux store is a single JavaScript object with a few methods,
  including getState, dispatch(action), and subscribe(listener).
  Any state you want Redux to handle is held in the store.

  Methods:
*/

getState()
dispatch(action)
subscribe(listener)

// An action is a POJO(plain old JavaScript object) with a type property.

// "Redux reducers are pure functions."
// It simply takes in arguments and returns a value.

// Reducer
// A reducer is a function that is called each time an action is dispatched.
// The reducer receives an action and the current state as arguments and returns an updated state.

// Middleware
// Perhaps the most common use for middleware is to dispatch asynchronous requests to a server.
