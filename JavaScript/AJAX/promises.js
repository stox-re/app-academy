// Instead of:

function getForecastForLocation() {
  locationRequest({
    success: spotRequest({
      success: forecastRequest({
        success: handleSuccess,
        error: handleError
      }),
      error: handleError
    }),
    error: handleError
  });
}

// We can do:

function getForecastForLocation() {
  locationRequest()
    .then(spotRequest)
    .then(forecastRequest)
    .then(handleSuccess)
    .catch(handleError)
}

/*
  Promises can exist in one of three states:

  pending: The promise has been neither fulfilled nor rejected.
  fulfilled: The promise's action has succeeded.
  rejected: The promise's action has failed.

*/

//A promise is considered settled when it has either been fulfilled or rejected.

// Passing a callback

const fetchSuccess = cat => console.log(cat);
const fetchError = err => console.log(err);

const fetchCat = (catId, success, error) => (
  $.ajax({
    url: `/cats/${catId}`,
    success,
    error
  })
);

fetchCat(1, fetchSuccess, fetchError);

// Using a promise.

const fetchSuccess = cat => console.log(cat);
const fetchError = err => console.log(err);

const fetchCat = catId => $.ajax({ url: `/cats/${catId}` });
// Note the implicit return!

fetchCat(1).then(fetchSuccess).fail(fetchError);