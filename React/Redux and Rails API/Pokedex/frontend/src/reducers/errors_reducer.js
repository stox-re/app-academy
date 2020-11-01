import { RECIEVE_POKEMON_ERRORS } from '../actions/pokemon_actions';

const errorsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECIEVE_POKEMON_ERRORS:
      return { errors: action.value };
    default:
      return state;
  }
};

export default errorsReducer;