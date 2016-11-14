import { h, render } from 'preact';
import Nav from './Nav';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<Nav />, div);
});

test('renders no username link without a username', () => {
  const div = document.createElement('div');
  const node = render(<Nav />, div);
  expect(node.querySelector('.nav-right')).toBeNull();
});

test('renders a username link with a username', () => {
  const div = document.createElement('div');
  const node = render(<Nav username="name" />, div);
  expect(node.querySelector('.nav-right').textContent).toMatch('name');
});
