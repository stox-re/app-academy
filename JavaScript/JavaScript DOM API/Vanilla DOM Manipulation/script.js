document.addEventListener("DOMContentLoaded", () => {

  // toggling restaurants
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === 'visited') {
      li.className = '';
    } else {
      li.className = 'visited';
    }
  };

  document.querySelectorAll('#restaurants li').forEach((li) => {
    li.addEventListener('click', toggleLi);
  });

  const q = function(key) {
    return document.querySelector(key);
  };

  // adding SF places as list items
  q('.favorite-submit').addEventListener('click', (evt) => {
    evt.preventDefault();
    const favouriteInput = q(".favorite-input");
    let newLi = document.createElement('li');
    newLi.innerHTML = favouriteInput.value;
    q('#sf-places').appendChild(newLi);
    favouriteInput.value = '';
  });

  // adding new photos
  q('.photo-show-button').addEventListener('click', (evt) => {
    evt.preventDefault();
    q('#photo-form-box').classList.remove('hidden');
  });

  q('.photo-url-submit').addEventListener('click', (evt) => {
    evt.preventDefault();
    const photoUrlInput = q('.photo-url-input');

    if (photoUrlInput.value != '') {
      let newImg = `<li><img src="${photoUrlInput.value}" /></li>`
      q('.dog-photos').innerHTML += newImg;
      photoUrlInput.value = '';
    }
  });

});
