import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let thisTile = this.props.tileObject;
    let renderResult = '';
    let classNames = 'tile ';
    let thisAdjTileBombCount = thisTile.adjacentBombCount();

    if (thisTile.bombed) {
      renderResult = '💣';
      classNames += 'bomb ';
    } else if (thisTile.flagged) {
      renderResult = '⚑';
      classNames += 'flag ';
    } else if (this.explored && thisAdjTileBombCount > 1) {
      renderResult = thisAdjTileBombCount;
      classNames += 'revealed ';
    }

    return (
      <div className={classNames}>
        <div className='flex'>
          {renderResult}
        </div>
      </div>
    )
  }
}

export default Tile;