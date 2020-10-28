import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
    <li className="pokemon-list-item">
      <Link to={`/pokemon/${props.pokemon.id}`}>
        <img src={props.pokemon.image_url}></img>
        <span>{props.pokemon.name}</span>
      </Link>
    </li>
  )
};

export default PokemonIndexItem;