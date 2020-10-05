class Clock {
  constructor(){
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
  }

  printTime() {
    let padZeros = function(value) {
      if (value < 10) {
        return `0${value}`;
      }
      return value;
    };
    console.log(`${padZeros(this.hours)}:${padZeros(this.minutes)}:${padZeros(this.seconds)}`);
  }

  addNumbers() {
    if (this.seconds + 1 == 60) {
      this.seconds = 0;
      if (this.minutes + 1 == 60) {
        this.minutes = 0;
        if (this.hours + 1 == 24) {
          this.hours = 0;
        } else {
          this.hours += 1;
        }
      } else {
        this.minutes += 1;
      }
    } else {
      this.seconds += 1;
    }
  }

  _tick() {
    setInterval(() => {
      this.addNumbers();
      this.printTime();
    }, 1000);
  }
}

const timer = new Clock();
//timer._tick();

Function.prototype.myThrottle = function(interval) {
  let isAllowed = false;
  return (...args) => {
    if (!isAllowed) {
      isAllowed = true;
      setTimeout(() => isAllowed = false, interval);
      this(...args);
    }
  }
}

class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}
Function.prototype.myDebounce = function(interval) {
  let timeout;

  return (...args) => {
    const fnCall = () => {
      timeout = null;
      this(...args);
    }

    clearTimeout(timeout);
    timeout = setTimeout(fnCall, interval);
  }
}


const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

searchBar.search = searchBar.search.myDebounce(500);

queryForHelloWorld();
