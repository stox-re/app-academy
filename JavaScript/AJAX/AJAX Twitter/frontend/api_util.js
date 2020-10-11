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
    console.log("Calling search users");
    let data = { query: queryVal };
    console.log(data);
    return $.ajax({
      url: `/users/search`,
      type: 'GET',
      dataType: 'json',
      data: data
    })
  }
};

module.exports = APIUtil;