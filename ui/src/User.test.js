import { User } from './User';

let user;

beforeEach(() => {
  user = new User(localStorage);
});

afterEach(() => {
  localStorage.clear();
});

test('begins with no username', () => {
  expect(user.username).toEqual(undefined);
});

test('can set the username', () => {
  const username = 'the-username';
  user.setUsername(username);
  expect(user.username).toEqual(username);
});

test('logout removes username', () => {
  user.setUsername('the-username');
  user.logout();
  expect(user.username).toEqual(undefined);
});
