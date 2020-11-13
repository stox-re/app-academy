import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

function Example() {
  const [count, setCount] = useState(0);

  //Similar to componentDidMount and componentDidUpdate
  useEffect(() => {
    document.title = `You clicked ${count} times`;

    //Will run when unmounting component
    return () => {
      document.title = `You finished clicking ${count} times`;
    }
  });

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
      Click Me
      </button>
      <Link to="/">Unmount</Link>
    </div>
  )
}