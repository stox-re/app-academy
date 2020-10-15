import React from 'react';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

const tabObjects = [
  {
    title: 'Tab One',
    content: 'This is the first tab'
  },
  {
    title: 'Tab Two',
    content: 'Second tab here'
  },
  {
    title: 'Tab Three',
    content: 'The last tab contents'
  },
];

const Root = () => {
  return (
    <div>
      <Clock />
      <Tabs tabObjects={tabObjects}/>
      <Weather />
    </div>
  )
}

export default Root;