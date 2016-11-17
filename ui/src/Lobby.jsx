import { h, Component } from 'preact';
import { route } from 'preact-router';

import TextField from './TextField';
import User from './User';
import Request from './Request';
import socket from './socket';

export default class extends Component {
  componentDidMount() {
    if (!User.username) {
      route('/');
    }
  }

  startRoom(e) {
    e.preventDefault();
    if (this.state.room) {
      Request.post('/api/rooms', { room: { name: this.state.room } })
        .then(response =>
          route(`/chat/${response.name}`)
        );
    } else {
      this.setState({ error: 'Please enter a snack name.' });
    }
  }

  render(_, { room }) {
    return (
      <div>
        <h1 class="title">Welcome to Snack Chat!</h1>
        <p>Join a chatroom or start a new one!</p>
        <div class="columns">
          <div class="column">
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
          <div class="column" />
        </div>
      </div>
    );
  }
}
