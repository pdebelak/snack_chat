import { h, render } from 'preact';
import Chat from './Chat';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<Chat />, div);
});

test('renders the chatroom name', () => {
  const div = document.createElement('div');
  const node = render(<Chat chatroom="Snickers" />, div);
  expect(node.textContent).toMatch('Snickers');
});
