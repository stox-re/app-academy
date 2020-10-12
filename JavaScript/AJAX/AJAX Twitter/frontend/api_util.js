const APIUtil = {
  followUser: (id) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'json'
    })
  },

  unfollowUser: (id) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'json'
    })
  },

  searchUsers: (queryVal) => {
    let data = { query: queryVal };
    return $.ajax({
      url: '/users/search',
      type: 'GET',
      dataType: 'json',
      data: data
    })
  },

  createTweet: (queryData) => {
    return $.ajax({
      url: '/tweets',
      type: 'POST',
      dataType: 'json',
      data: queryData
    })
  }
};

module.exports = APIUtil;