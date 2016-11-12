import { h, render } from 'preact';
import App from './App';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<App />, div);
});
