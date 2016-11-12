import { h, render } from 'preact';
import Error404 from './Error404';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<Error404 />, div);
});
