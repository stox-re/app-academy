// How to test with window.something = something

import React from 'react';
import ReactDOM from 'react-dom';
import {testMe} from './utility';
import TestIndex from './test_index'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  let image = <img src='https://i.imgur.com/Z4LmjYu.jpg'></img>

  //window.testMe = testMe;
  ReactDOM.render(<TestIndex />, root);
})


// utility.js, setting window.something = something directly in the utility.js file!
export const testMe = function(name) {
  return `Testing on the window is so much fun with ${name}.`;
}
window.testMe = testMe;


//In test component test_index.jsx
import React from 'react';
import {testMe} from './utility';

class TestIndex extends React.Component {
  render() {
    return (
      <div>
        <h1>Here is the test</h1>
        {testMe('students')}
      </div>
    )
  }
}

export default TestIndex;