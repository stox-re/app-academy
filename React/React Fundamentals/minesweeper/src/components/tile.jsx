import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(evt) {
    this.props.updateGameFunction(this.props.tileObject, evt.altKey);
  }

  render() {
    let thisTile = this.props.tileObject;
    let renderResult = '';
    let classNames = 'tile ';
    let thisAdjTileBombCount = thisTile.adjacentBombCount();

    if (thisTile.bombed && thisTile.explored) {
      renderResult = '💣';
      classNames += 'bomb ';
    } else if (thisTile.flagged) {
      renderResult = '⚑';
      classNames += 'flag ';
    } else if (thisTile.explored) {
      if (thisAdjTileBombCount > 0) {
        renderResult = thisAdjTileBombCount;
      }
      classNames += 'revealed ';
    }

    return (
      <div onClick={this.handleClick} className={classNames}>
        <div className='flex'>
          {renderResult}
        </div>
      </div>
    )
  }
}

export default Tile;