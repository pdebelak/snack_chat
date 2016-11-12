import { h, Component } from 'preact';
import { route } from 'preact-router';

import TextField from './TextField';

export default class extends Component {
  startRoom(e) {
    e.preventDefault();
    if (this.state.room) {
      route(`/${this.state.room}`);
    } else {
      this.setState({ error: 'Please enter a snack name.' });
    }
  }

  render(_, { room }) {
    return (
      <div class="container">
        <h1 class="title">Welcome to Snack Chat!</h1>
        <p>Join a chatroom or start a new one!</p>
        <form onSubmit={(e) => this.startRoom(e)}>
          <TextField
            label="Snack Name"
            onInput={this.linkState('room')}
            value={this.state.room}
            name="room"
            error={this.state.error}
          />
          <button class="button is-primary">Start Chatting</button>
        </form>
      </div>
    );
  }
}
