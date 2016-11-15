import Request from './Request';

const usernameKey = 'username';
const tokenKey = 'token';

export class User {
  constructor(storage) {
    this.storage = storage;
  }

  get username() {
    return this.storage.getItem(usernameKey);
  }

  setUsername(username) {
    this.storage.setItem(usernameKey, username);
  }

  get token() {
    return this.storage.getItem(tokenKey);
  }

  setToken(token) {
    this.storage.setItem(tokenKey, token);
  }

  login(username) {
    return Request.post('/api/users',
      { user: { username } }
    ).then((response) => {
      this.setUsername(response.username);
      this.setToken(response.token);
      return response;
    });
  }
}

export default new User(window.localStorage);
