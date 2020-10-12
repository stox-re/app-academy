/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

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
  },

  fetchFeed: (data) => {
    let dataToSend = { max_created_at: data };

    if (data == '') {
      dataToSend = '';
    }

    return $.ajax({
      url: '/feed',
      type: 'GET',
      dataType: 'json',
      data: dataToSend
    })
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class FollowToggle {
  constructor(el) {
    this.el = el
    this.userId = el.dataset.userId;
    this.followState = el.dataset.initialFollowState == 'true';
    this.render();
    this.handleClick();
  }

  render() {
    $(this.el).prop('disabled', false);
    if (this.followState == false) {
      this.el.innerHTML = 'Follow!';
    } else {
      this.el.innerHTML = 'Unfollow!'
    }
  }

  handleClick() {
    let self = this;

    let followReturnCall = function() {
      self.followState = !self.followState;
      self.render();
    };

    $(self.el).on('click', (evt) => {
      $(self.el).prop('disabled', true);
      evt.preventDefault();
      if (self.followState) {
        APIUtil.unfollowUser(self.userId).then(followReturnCall);
      } else {
        APIUtil.followUser(self.userId).then(followReturnCall);
      }
    });
  }
}

module.exports = FollowToggle;

/***/ }),

/***/ "./frontend/infinite_tweets.js":
/*!*************************************!*\
  !*** ./frontend/infinite_tweets.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class InfiniteTweets {
  constructor() {
    this.fetchMore = $('.fetch-more');
    this.fetchMoreListener();
    this.maxCreatedAt = null;
    this.fetchTweets()
  }

  fetchMoreListener() {
    const self = this;

    self.fetchMore.on('click', function() {
      self.fetchTweets()
    });
  }

  fetchTweets() {
    APIUtil.fetchFeed(this.maxCreatedAt == null ? '' : this.maxCreatedAt).then(this.insertTweets.bind(this));
  }

  insertTweets(data) {
    data.forEach((item, index) => {
      let date = new Date(Date.parse(item.updated_at));
      let dateString = `${date.getDate()} / ${date.getMonth()}`;
      $("#feed").append(`<li>${item.content} <a href="/users/${item.user.id}">- ${item.user.username} -</a> ${dateString}</li>`)
      if (index == data.length - 1) {
        this.maxCreatedAt = item.created_at;
      }
    });

    if (data.length < 20) {
      this.fetchMore.text('No more tweets to fetch.');
    }
  }
}

module.exports = InfiniteTweets;

/***/ }),

/***/ "./frontend/tweet_compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet_compose.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class TweetCompose {
  constructor(el) {
    this.el = el;
    this.input = $(this.el).find(':submit')[0];
    this.charsLeft = $(this.el).find('.chars-left')[0];
    this.handleInput();
    this.charHandler();
  }

  charHandler() {
    const self = this;
    let textarea = $($(self.el).find('textarea')[0]);

    textarea.on('input', function(){
      console.log(textarea.val().length);
      self.charsLeft.innerHTML = 140 - textarea.val().length;
    });
  }

  handleInput() {
    const self = this;

    $(self.el).on('submit', function(evt) {
      evt.preventDefault();
      let jsonObj = $(self.el).serializeJSON();
      APIUtil.createTweet(jsonObj).then(self.handleSuccess.bind(self));
      self.disableInputs(true);
    });
  }

  disableInputs(enabled) {
    $(this.el).find(':input').each((index, item) => {
      $(item).prop('disabled', enabled);
    });
  }

  handleSuccess(data) {
    this.disableInputs(false);
    $(this.el).trigger('reset');
    let date = new Date(Date.parse(data.updated_at));
    let dateString = `${date.getDate()} / ${date.getMonth()}`;
    $("#feed").prepend(`<li>${data.content} <a href="/users/${data.user.id}">- ${data.user.username} -</a> ${dateString}</li>`)
    this.charsLeft.innerHTML = '';
  }
}

module.exports = TweetCompose;

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js");
const TweetCompose = __webpack_require__(/*! ./tweet_compose.js */ "./frontend/tweet_compose.js");
const InfiniteTweets = __webpack_require__(/*! ./infinite_tweets.js */ "./frontend/infinite_tweets.js");

$(() => {
  let followButtons = $('.follow-toggle');
  let navSearches = $('.users-search');
  let tweetComposes = $('.tweet-compose');

  $.each(followButtons, (index, followButton) => {
    new FollowToggle(followButton)
  });

  $.each(navSearches, (index, searchNav) => {
    new UsersSearch(searchNav);
  });

  $.each(tweetComposes, (index, tweetCompose) => {
    new TweetCompose(tweetCompose);
  });

  new InfiniteTweets();
})

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

class UsersSearch {
  constructor(el) {
    this.el = el;
    this.input = $(this.el).find('input')[0];
    this.ul = $(this.el).find('ul')[0];
    this.handleInput();
  }

  handleInput() {
    let self = this;
    $(self.input).on('input', function() {
      APIUtil.searchUsers($(self.input).val()).then(self.render.bind(self))
    })
  }

  render(data) {
    this.ul.innerHTML = '';
    let liBuilder = '';

    data.forEach((user, index) => {
      let newButton = `<button class="follow-toggle" data-user-id="${user.id}" data-initial-follow-state="${user.followed}">${user.followed ? "Unfollow!" : "Follow!"}</button>`;
      liBuilder += `<li><a href="/users/${user.id}">${user.username}</a>${newButton}</li>`;
    });

    this.ul.innerHTML = liBuilder;
    let followButtons = $(this.ul).find('.follow-toggle');
    $.each(followButtons, (index, followButton) => {
      new FollowToggle(followButton)
    });
  }
}

module.exports = UsersSearch;

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map