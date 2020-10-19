import React from 'react';
import TodoListContainer from './todos/todo_list_container';

const App = () => {
  return (
    <div>
      <nav>
        <h1>React Todo List</h1>
      </nav>
      <div className='todo-container'>
        <TodoListContainer />
      </div>
    </div>
  )
}

export default App;