export const allTodos = (state) => {
  let theseTodoKeys = Object.keys(state.todos);
  let newTodoArray = theseTodoKeys.map((todoKey) => {
    return state.todos[todoKey];
  });
  return newTodoArray;
};