import React from 'react';

const TabHeader = (props) => {
  let addClassSelected = '';
  if (props.selectedTab == props.tabIndex) {
    addClassSelected = 'selected'
  }

  return (
    <li className={addClassSelected} onClick={() => props.onClick(props.tabIndex)}>
      {props.title}
    </li>
  )
}
export default TabHeader;