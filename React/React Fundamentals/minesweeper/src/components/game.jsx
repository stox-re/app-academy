import * as Minesweeper from './minesweeper';
import React from 'react';
import Board from './board';
import Modal from './modal';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(10, 10)
    }
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  restartGame() {
    this.setState({
      board: new Minesweeper.Board(10, 10)
    })
  }

  updateGame(tileObject, isFlagging) {
    if (isFlagging) {
      tileObject.toggleFlag();
    } else {
      tileObject.explore();
    }

    this.setState({
      board: this.state.board
    });
  }

  render() {
    let modal = '';
    if (this.state.board.lost()) {
      modal = <Modal alert={false} restartFunction={this.restartGame} />
    } else if (this.state.board.won()) {
      modal = <Modal alert={true} restartFunction={this.restartGame} />
    }

    return (
      <div className='game'>
        {modal}
        <Board board={this.state.board} updateGameFunction={this.updateGame} />
      </div>
    );
  }
}

export default Game;