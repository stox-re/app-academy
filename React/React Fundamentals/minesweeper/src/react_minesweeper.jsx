import * as Minesweeper from './components/minesweeper';
import ReactDOM from 'react-dom';
import React from 'react';
import Game from './components/game';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<div><Game /></div>, root);
});
