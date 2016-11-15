import 'whatwg-fetch';

import User from './User';

function request(method, endpoint, body) {
  let options = {
    method,
    headers: {
      'Content-Type': 'application/json',
      'Authentication': `Bearer ${User.token}`,
    },
  };
  if (body) {
    options = Object.assign(options, { body: JSON.stringify(body) });
  }
  return fetch(endpoint, options).then(response => response.json());
}

export default {
  get(endpoint) {
    return request('GET', endpoint);
  },

  post(endpoint, body) {
    return request('POST', endpoint, body);
  },

  put(endpoint, body) {
    return request('PUT', endpoint, body);
  },
};
