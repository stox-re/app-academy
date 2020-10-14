const { a: x, b: y } = { a: 1, b: 2 };

x; //=> 1
y; //=> 2

const { a } = { a: { b } } = { a: { b: 2 } };
a; //=> { b: 2 }
b; //=> 2

const multiply = n => ({ one: n, two: n * 2, three: n * 3 });

const { one, two, three } = multiply(10);
one; //=> 10
two; //=> 20
three; //=> 30

this.props = {
  userId: 1,
  user: {
    fname: 'Ned',
    lname: 'Ruggeri'
  }
};

const {
  userId,
  user: {
    fname,
    lname
  }
} = this.props;

userId; //=> 1
fname; //=> 'Ned'
lname; //=> 'Ruggeri'