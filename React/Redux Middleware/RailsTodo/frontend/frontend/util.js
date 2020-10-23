export const uniqueId = () => {
  return new Date().getTime();
}

export const fetchTodos = () => {
  console.log("Calling util fetch todos");
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
