export const ADD_FRUIT = 'ADD_FRUIT';
export const CLEAR_FRUIT = 'CLEAR_FRUIT';

export const addOrange = () => {
    return {
      type: ADD_FRUIT,
      fruit: 'Orange'
    };
};

export const addApple = () => {
  return {
    type: ADD_FRUIT,
    fruit: 'Apple'
  };
};

export const clearFruit = () => {
  return {
    type: CLEAR_FRUIT
  };
}