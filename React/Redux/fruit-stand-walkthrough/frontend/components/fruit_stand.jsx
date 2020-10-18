import React from 'react';

//const FruitStand = ({fruits, addApple, addOrange, clearFruit}) => {
const FruitStand = (props) => {
  return (
    <div>
      <button onClick={props.addApple}>Apple</button>
      <button onClick={props.addOrange}>Orange</button>
      <button onClick={props.clearFruit}>Clear</button>
      <ul>
        {props.fruits.map((fruit, index) => <li key={index}>{fruit}</li>)}
      </ul>
    </div>
  )
}

export default FruitStand;