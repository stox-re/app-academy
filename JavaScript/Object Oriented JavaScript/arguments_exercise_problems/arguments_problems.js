function sum() {
  let currentSum = 0;
  for (let i = 0; i < arguments.length; i ++) {
    currentSum += arguments[i];
  }
  return currentSum;
}

function sumRestOp(...args) {
  let currentSum = 0;
  args.forEach((item, index) => {
    currentSum += item;
  });
  return currentSum;
}

console.log(sum(1, 2, 3, 4));
console.log(sumRestOp(1, 2, 3, 4, 5));

Function.prototype.myBind1 = function (ctx) {
  const fn = this;
  const bindArgs = Array.from(arguments).slice(1);

  return function _boundFn() {
    const callArgs = Array.from(arguments);
    return fn.apply(ctx, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    this.apply(ctx, bindArgs.concat(callArgs))
  };
};

function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach((n) => {
        total += n;
      });
      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

const summing = curriedSum(4);
console.log(summing(5)(30)(20)(1));

Function.prototype.curry = function(numArgs){
  let args = []
  const fn = (args) => {
    args.push(args);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return fn;
    }
  };
  return fn;
}