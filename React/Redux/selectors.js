// Define all of your app's selectors in a
// frontend/reducers/selectors.js
// file. Don't forget to export them!

// Selectors are passed the app's state and return information
// from the application state in a specified form (eg. an array).


// reducers/selectors.js
// returns the state's todos as an array of todos
export const getAllTodos = ({ todos }) => (
  Object.keys(todos).map(id => todos[id])
);

// returns the state's todos as an array of todos,
// filtered by their done/undone status
export const getFilteredTodos = ({ todos, filter }) => {
  let result = [];
  for (let id in todos) {
    if (todos[id].done === filter) { result.push(todos[id]); }
  }
  return result;
};

// returns the selected todo object or an empty todo object
// if no todo exists with given id
export const selectTodos = ({ todos }, id) => {
  const nullTodo = {
    id: null,
    body: "",
    done: 'undone'
  };
  return todos[id] || nullTodo;
};