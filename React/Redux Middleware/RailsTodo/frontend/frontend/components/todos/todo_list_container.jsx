import { connect } from 'react-redux';
import { receiveTodo, removeTodo, fetchTodos, createTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

import TodoList from './todo_list';

// Creates props from arguments to send to the child component
const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => { return dispatch(receiveTodo(todo)); },
    removeTodo: (todo) => { return dispatch(removeTodo(todo)); },
    fetchTodos: () => { return dispatch(fetchTodos()); },
    createTodo: (todo) => {
      return new Promise((resolve, reject) => {
        resolve(dispatch(createTodo(todo)));
      });
    }
  };
}

// Connect returns a function, can be used as:
// export default connect(mapStateToProps)(FruitStand);
// We need connect to pass the application state to mapStateToProps. We use the provider in entry.js
export default connect(mapStateToProps, mapDispatchToProps)(TodoList);