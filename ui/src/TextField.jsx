import { h } from 'preact';

export default ({ error, name, onInput, value, label, placeholder }) =>
  <p class="control">
    <label class="label">{label}</label>
    <input
      type="text"
      name={name}
      value={value}
      onInput={onInput}
      placeholder={placeholder}
      class={{ 'is-danger': error, input: true }}
    />
    <span class="help is-danger">{error}</span>
  </p>;
