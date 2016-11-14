import { h, render } from 'preact';
import Header from './Header';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<Header />, div);
});
