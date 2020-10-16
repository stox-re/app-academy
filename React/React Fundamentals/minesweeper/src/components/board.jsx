import React from 'react';
import Tile from './tile';

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let theseTiles = [];
    this.props.board.grid.forEach((row, index) => {
      let thisRow = [];
      row.forEach((item, itemIndex) => { thisRow.push(<Tile key={itemIndex} tileObject={item} updateGameFunction={this.props.updateGameFunction}/>) });
      theseTiles.push(<div className='row' key={index}>{thisRow}</div>);
    });

    return (
      <div>
        <h1>Board</h1>
        {theseTiles}
      </div>
    );
  }
}

export default Board;