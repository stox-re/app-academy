export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  });
};

export const fetchOnePokemon = (pokemonId) => {
  return $.ajax({
    method: 'GET',
    url: `/api/pokemon/${pokemonId}`
  });
};

export const createPokemon = (pokemonData) => {
  return $.ajax({
    method: 'POST',
    url: '/api/pokemon/',
    data: pokemonData
  });
};