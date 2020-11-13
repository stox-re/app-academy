import React, { useState } from 'react';

function Example() {
  const [count, setCount] = useState(0);
  const [title, setTitle] = useState('Hello world!');

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count+1)}>
        Click Me
      </button>
    </div>
  )
}

export default Example;