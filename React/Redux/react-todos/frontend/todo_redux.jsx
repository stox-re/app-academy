import ReactDOM from 'react-dom';
import React from 'react';

const App = () => {
  return (
    <div>
      React is working
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<App />, root);
});
