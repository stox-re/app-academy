import React from 'react';
import ReactDOM from 'react-dom';

import ClickCounter from './click_counter.jsx';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<ClickCounter />, root);
});