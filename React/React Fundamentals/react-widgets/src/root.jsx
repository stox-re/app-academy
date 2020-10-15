import React from 'react';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';
import Autocomplete from './autocomplete';

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

const listOfNames = [
  "James",
  "Daniel",
  "Sarah",
  "Michael",
  "Fred",
  "Timothy",
  "Kira",
  "Charlie",
  "David",
  "Jim",
  "Dorthy",
  "Tina"
];

const Root = () => {
  return (
    <div>
      <Clock />
      <Tabs tabObjects={tabObjects}/>
      <Weather />
      <Autocomplete listOfNames={listOfNames}/>
    </div>
  )
}

export default Root;