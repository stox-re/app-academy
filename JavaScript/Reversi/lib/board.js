let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let array =  [];
  for (let i = 0; i < 8; i++ ) {
    array.push([]);
    for (let j = 0; j < 8; j++) {
      array[i].push(undefined);
    }
  }
  array[3][3] = new Piece("white");
  array[4][4] = new Piece("white");
  array[3][4] = new Piece("black");
  array[4][3] = new Piece("black");
  return array
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (x < 0 || y < 0) { return false; }
  if (x > 7 || y > 7) { return false; }
  return true;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error("Not a valid position");
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.isValidPos(pos) && this.isOccupied(pos)) {
    return this.grid[pos[0]][pos[1]].color == color;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.grid[pos[0]][pos[1]] instanceof Piece;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  pos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (typeof piecesToFlip === 'undefined') { piecesToFlip = []; }

  if (!this.isValidPos(pos) || !this.isOccupied(pos)) {
    return [];
  } else if (this.isMine(pos, color)) {
    return piecesToFlip;
  } else {
    piecesToFlip.push(pos);
    return this._positionsToFlip(pos, color, dir, piecesToFlip);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) { return false; }
  else {
    for (let i = 0; i < Board.DIRS.length; i++) {
      let dir = Board.DIRS[i];
      if (this._positionsToFlip(pos, color, dir).length > 0) {
        return true;
      }
    }
    return false;
  }
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.isValidPos(pos) && this.validMove(pos, color)) {
    this.grid[pos[0]][pos[1]] = new Piece(color);

    Board.DIRS.forEach((dir) => {
      let flippable = this._positionsToFlip(pos, color, dir);
      if (flippable.length > 0) {
        flippable.forEach((locationToFlip) => {
          this.grid[locationToFlip[0]][locationToFlip[1]].flip();
        });
      }
    });
  } else {
    throw new Error("This is an invalid move.");
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let allValidMoves = [];

  for (let i = 0; i < this.grid.length; i++) {
    for (let k = 0; k < this.grid.length; k++) {
      let pos = [i, k];
      if (this.validMove(pos, color)) {
        allValidMoves.push(pos);
      }
    }
  }

  return allValidMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return (this.validMoves(color).length > 0);
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  let blackMoves = this.validMoves("black");
  let whiteMoves = this.validMoves("white");
  return !(blackMoves.length > 0 && whiteMoves.length > 0);
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  let border = [0, 1, 2, 3, 4, 5, 6, 7];
  let borderBuilder = "  ";
  for (let i = 0; i < border.length; i++) {
    borderBuilder += border[i] + " ";
  }
  console.log(borderBuilder);
  console.log("-----------------  ");

  for (let j = 0; j < this.grid.length; j++) {
    let rowBuilder = border[j] + " ";
    for (let k = 0; k < this.grid.length; k++){
      if (typeof this.grid[j][k] == 'undefined') {
        rowBuilder += "_ "
      } else {
        rowBuilder += this.grid[j][k].toString() + " ";
      }
    }
    console.log(rowBuilder);
  }
  console.log("");
};



module.exports = Board;
