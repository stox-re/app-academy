Array.prototype.uniq = function() {
  let newArray = [];

  this.forEach((item) => {
    if (!newArray.includes(item)) {
      newArray.push(item);
    }
  });

  return newArray;
}

Array.prototype.twoSum = function() {
  arrayOfPositions = [];
  this.forEach((item, index) => {
    this.forEach((item2, index2) => {
      if (index2 > index) {
        if (item + item2 == 0) {
          arrayOfPositions.push([index, index2])
        }
      }
    });
  });
  return arrayOfPositions;
}

Array.prototype.transpose = function() {
  return this[0].map((_, colIndex) => this.map(row => row[colIndex]));
}

Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++){
    callback(this[i]);
  }
}

Array.prototype.myMap = function(callback) {
  let newArray = [];
  this.myEach((item, index) => {
    newArray.push(callback(item));
  });
}

Array.prototype.bubbleSort = function() {
  let length = this.length - 1;
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < length; i++) {
      if (this[i] > this[i + 1]) {
        let saveSecond = this[i + 1];
        let saveFirst = this[i];
        this[i] = saveSecond;
        this[i + 1] = saveFirst;
        sorted = false;
      }
    }
  }
  return this;
}

class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }
  meow() {
    console.log(`${this.name} meows!`);
  }
}

class Student {
  constructor(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.courses = [];
  }
  name() {
    return `${this.firstName} ${this.lastName}`
  }
  enroll(course) {
    if (!this.courses.includes(course)){
      this.courses.put(course);
      course.students.push(this);
    }
  }
}

class Course {
    constructor(courseName, department, numCredits) {
      this.courseName = courseName;
      this.department = department;
      this.students = [];
    }
    addStudent(student) {
      student.enroll(this)
    }
}