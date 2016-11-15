import { h, Component } from 'preact';
import { route } from 'preact-router';

import TextField from './TextField';

export default class extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: props.username,
    };
  }

  redirect() {
    if (this.props.room) {
      route(`/chat/${this.props.room}`);
    } else {
      route('/');
    }
  }

  setUsername(e) {
    e.preventDefault();
    if (this.state.username) {
      this.props.updateUsername(this.state.username).then(() =>
        this.redirect()
      );
    } else {
      this.setState({ error: 'Please enter a username.' });
    }
  }

  get titleText() {
    if (this.props.username) {
      return 'Change your username';
    }
    return 'Let\'s pick a username';
  }

  render(_, { username, error }) {
    return (
      <div>
        <h1 class="title">{this.titleText}</h1>
        <div class="columns">
          <div class="column is-half">
            <form onSubmit={(e) => this.setUsername(e)}>
              <TextField
                label="Username"
                onInput={this.linkState('username')}
                value={username}
                name="username"
                error={error}
              />
              <button class="button is-primary">Choose Username</button>
            </form>
          </div>
        </div>
      </div>
    );
  }
}
