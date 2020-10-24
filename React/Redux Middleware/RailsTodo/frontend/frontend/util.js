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
  return $.ajax({
    method: 'GET',
    url: `/api/todos/${todoId}/steps`
  });
}

export const updateStep = (step) => {
  return $.ajax({
    method: 'PUT',
    url: `/api/todos/${step.step.todo_id}/steps/${step.step.id}`,
    data: {
      step: {
        done: step.step.done
      }
    }
  });
}
