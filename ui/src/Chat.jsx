import { h, Component } from 'preact';
import { route } from 'preact-router';

import User from './User';

export default class extends Component {
  componentDidMount() {
    if (!User.username) {
      route(`/username?room=${this.props.chatroom}`);
    }
  }

  render({ chatroom }) {
    return (
      <h1 class="title">Chat about {chatroom}</h1>
    );
  }
}
