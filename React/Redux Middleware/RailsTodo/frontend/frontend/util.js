export const uniqueId = () => {
  return new Date().getTime();
}

export const fetchTodos = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/todos'
  });
};

export const createTodo = (todo) => {
  return $.ajax({
    method: 'POST',
    url: '/api/todos',
    data: todo
  });
}

export const updateTodo = (todo) => {
  return $.ajax({
    method: 'PUT',
    url: `/api/todos/${todo.todo.id}`,
    data: todo
  });
}

export const deleteTodo = (todoId) => {
  return $.ajax({
    method: 'DELETE',
    url: `/api/todos/${todoId}`
  });
}

export const fetchSteps = (todoId) => {
  console.log("Fetching steps with todo_id: " + todoId);
  return $.ajax({
    method: 'GET',
    url: `/api/todos/${todoId}/steps`
  });
}
