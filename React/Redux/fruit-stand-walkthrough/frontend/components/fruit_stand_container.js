import { connect } from 'react-redux';
import { addApple, addOrange, clearFruit } from '../actions';
import FruitStand from './fruit_stand';

// Creates props from arguments to send to the child component
const mapStateToProps = (state) => {
  return {
    fruits: state.fruits,

  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    addApple: () => { return dispatch(addApple()); },
    addOrange: () => { return dispatch(addOrange()); },
    clearFruit: () => { return dispatch(clearFruit()); },
  };
}
//Connect returns a function, can be used as:
// export default connect(mapStateToProps)(FruitStand);
// We need connect to pass the application state to mapStateToProps. We use the provider in entry.js

export default connect(mapStateToProps, mapDispatchToProps)(FruitStand);