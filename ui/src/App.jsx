import { h, Component } from 'preact';
import Router from 'preact-router';

import Header from './Header';
import Username from './Username';
import Lobby from './Lobby';
import Chat from './Chat';
import Error404 from './Error404';

import User from './User';

export default class extends Component {
  constructor() {
    super();

    this.state = {
      username: User.username,
    };
  }

  updateUsername(username) {
    User.setUsername(username);
    this.setState({ username: User.username });
  }

  logout() {
    User.logout();
    this.setState({ username: null });
  }

  render(_, { username }) {
    return (
      <div>
        <Header username={username} logout={() => this.logout()} />
        <div class="section">
          <div class="container">
            <Router>
              <Lobby path="/" />
              <Username path="/username" username={username} updateUsername={(un) => this.updateUsername(un)} />
              <Chat path="/chat/:chatroom" />
              <Error404 default />
            </Router>
          </div>
        </div>
      </div>
    );
  }
}
