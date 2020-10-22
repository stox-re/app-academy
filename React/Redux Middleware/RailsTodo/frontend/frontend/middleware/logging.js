const addLoggingToDispatch = (inputStore) => {
  return (next) => {
    return (action) => {
      console.log(inputStore.getState());
      console.log(action);
      next(action);
      console.log(inputStore.getState());
    };
  };
};

export default addLoggingToDispatch;