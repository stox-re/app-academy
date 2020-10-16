import * as Minesweeper from './minesweeper';
import React from 'react';
import Board from './board';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(10, 3)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
    return (
      <div>
        <Board board={this.state.board} updateGameFunction={this.updateGame} />
      </div>
    );
  }
}

export default Game;