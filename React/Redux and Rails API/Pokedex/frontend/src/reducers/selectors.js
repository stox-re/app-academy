export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
};

export const selectOnePokemon = (state, pokemonId) => {
  return state.entities.pokemon[pokemonId];
};

export const selectItems = (state) => {
  return state.entities.items;
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId]
};

export const selectThisPokemonItems = (state, pokemonId) => {
  let thisPokemonItems = [];
  let theseKeys = Object.keys(state.entities.items);
  theseKeys.forEach((key) => {
    if (state.entities.items[key].pokemon_id == pokemonId) {
      thisPokemonItems.push(state.entities.items[key]);
    }
  });
  return thisPokemonItems;
};