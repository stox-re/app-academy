import { connect } from 'react-redux';
import { removeTodo, fetchTodos, createTodo, updateTodo, deleteTodo } from '../../actions/todo_actions';
import { allTodos, allErrors } from '../../reducers/selectors';
import { clearErrors } from '../../actions/error_actions';

import TodoList from './todo_list';

// Creates props from arguments to send to the child component
const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    errors: allErrors(state)
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    removeTodo: (todo) => { return dispatch(removeTodo(todo)); },
    fetchTodos: () => { return dispatch(fetchTodos()); },
    clearErrors: () => { return dispatch(clearErrors()); },
    updateTodo: (todo) => { return dispatch(updateTodo(todo)); },
    deleteTodo: (todoId) => { return dispatch(deleteTodo(todoId)); },
    createTodo: (todo) => {
      const returnPromise = new Promise((resolve, reject) => {
        resolve(dispatch(createTodo(todo)));
      });

      return returnPromise;
    }
  };
}

// Connect returns a function, can be used as:
// export default connect(mapStateToProps)(FruitStand);
// We need connect to pass the application state to mapStateToProps. We use the provider in entry.js
export default connect(mapStateToProps, mapDispatchToProps)(TodoList);