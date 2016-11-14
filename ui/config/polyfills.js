if (typeof Promise === 'undefined') {
  // Rejection tracking prevents a common issue where React gets into an
  // inconsistent state due to an error, but it gets swallowed by a Promise,
  // and the user has no idea what causes React's erratic future behavior.
  require('promise/lib/rejection-tracking').enable();
  window.Promise = require('promise/lib/es6-extensions.js');
}

if (typeof SVGElement === 'undefined') {
  // to not blow up in tests for preact render
  window.SVGElement = function() {};
}

if (!window.localStorage) {
  window.localStorage = {
    store: {},
    getItem: function(key) {
      return this.store[key];
    },
    setItem: function(key, value) {
      this.store[key] = value;
    },
    clear: function() {
      this.store = {};
    },
    removeItem: function(key) {
      this.store[key] = undefined;
    },
  };
}

// fetch() polyfill for making API calls.
require('whatwg-fetch');

// Object.assign() is commonly used with React.
// It will use the native implementation if it's present and isn't buggy.
Object.assign = require('object-assign');
