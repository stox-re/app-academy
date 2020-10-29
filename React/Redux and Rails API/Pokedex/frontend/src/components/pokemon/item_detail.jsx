import React from 'react';

const ItemDetail = (props) => {
  let renderingItem = '';
  if (typeof props.item != 'undefined') {
    renderingItem =
    <div>
      <h3>{props.item.name}</h3>
      <img src={props.item.image_url}></img>;
    </div>;
  }
  return (
    <div>
      {renderingItem}
    </div>
  )
};

export default ItemDetail;