import { h, Component } from 'preact';
import { route } from 'preact-router';

export default class extends Component {
  startRoom(e) {
    e.preventDefault();
    route(`/${this.state.room}`);
  }

  render(_, { room }) {
    return (
      <div class="wrapper">
        <h1>Welcome to Snack Chat!</h1>
        <p>Join a chatroom or start a new one!</p>
        <form onSubmit={(e) => this.startRoom(e)}>
          <label class="textfield">
            <input type="text" name="room" value={room} onInput={this.linkState('room')} />
            <span class="textfield__label">Snack Name</span>
          </label>
          <button>Start Chatting</button>
        </form>
      </div>
    );
  }
}
