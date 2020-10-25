export const allTodos = (state) => {

  let theseTodoKeys = Object.keys(state.todos);
  let newTodoArray = theseTodoKeys.map((todoKey) => {
    return state.todos[todoKey];
  });

  return newTodoArray;
};

export const allErrors = (state) => {
  return state.errors;
};

export const stepsByTodoId = (state, todoId) => {
  let theseStepKeys = Object.keys(state.steps);
  let theseSteps = [];
  console.log("Checking step keys");
  console.log(theseStepKeys);

  theseStepKeys.forEach((stepKey) => {
    if (state.steps[stepKey].todo_id == todoId) {
      theseSteps.push(state.steps[stepKey]);
    }
  });

  return theseSteps;
};