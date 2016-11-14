import { h, render } from 'preact';
import Lobby from './Lobby';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<Lobby />, div);
});
