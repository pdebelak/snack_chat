import { h, render } from 'preact';
import TextField from './TextField';

test('renders without crashing', () => {
  const div = document.createElement('div');
  render(<TextField />, div);
});

test('does not have is-danger class if errors are not present', () => {
  const div = document.createElement('div');
  const field = render(<TextField />, div);
  expect(field.querySelector('input.is-danger')).toBeNull();
});

test('has is-danger class and shows errors if errors are present', () => {
  const div = document.createElement('div');
  const field = render(<TextField error="The error" />, div);
  expect(field.querySelector('input.is-danger')).not.toBeNull();
  expect(field.textContent).toMatch('The error');
});
