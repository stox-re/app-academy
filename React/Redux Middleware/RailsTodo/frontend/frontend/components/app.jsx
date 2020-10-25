import React from 'react';
import TodoListContainer from './todos/todo_list_container';

const App = () => {
  return (
    <div>
      <div className='todo-container'>
        <TodoListContainer />
      </div>
    </div>
  )
}

export default App;