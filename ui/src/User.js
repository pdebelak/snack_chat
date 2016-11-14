const usernameKey = 'username';

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

  logout() {
    this.storage.removeItem(usernameKey);
  }
}

export default new User(window.localStorage);
