import { h, render } from 'preact';
import Username from './Username';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<Username />, div);
});

test('has pick a username text with no username', () => {
  const div = document.createElement('div');
  const node = render(<Username />, div);
  expect(node.textContent).toMatch('pick a username');
});

test('has change username text with a username', () => {
  const div = document.createElement('div');
  const node = render(<Username username="name" />, div);
  expect(node.textContent).toMatch(/change your username/i);
  expect(node.querySelector('input').value).toEqual('name');
});
