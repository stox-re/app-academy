class Bicycle {
  constructor(model, color) {
    this.model = model;
    this.color = color;
  }

  action() {
    return "rolls along";
  }

  ride() {
    console.log(
      `The ${this.color} ${this.model}
      goes "whoosh" and ${this.action()}!`
    );
  }

  static parade() {
    Bicycle.funBicycles.forEach(bike => bike.ride());
  }
}

const cruiser = new Bicycle("Schwinn", "turquoise");
const salsaFargo = new Bicycle("Salsa Fargo", "burnt orange");
const flyingMerkel = new Bicycle("Flying Merkel", "green");
const bianchiVolpe = new Bicycle("Bianchi Volpe", "slate blue");

Bicycle.funBicycles = [cruiser, salsaFargo, flyingMerkel, bianchiVolpe];

Bicycle.parade();