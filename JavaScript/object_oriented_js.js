/* Object Oriented JavaScript */

function NBAPlayer (name, team, pos) { /* Constructor function */
  this.name = name;
  this.team = team;
  this.pos = pos;
}


NBAPlayer.prototype.dunk = function(){
  console.log(`${this.name} dunked.`)
}

const curry = new NBAPlayer("jim", "cats", "forward")
/*curry.__proto__ == NBAPlayer.prototype*/
curry.dunk();