import { h } from 'preact';
import Router from 'preact-router';

import Lobby from './Lobby';
import Chat from './Chat';
import Error404 from './Error404';

export default () =>
  <Router>
    <Lobby path="/" />
    <Chat path="/:chatroom" />
    <Error404 default />
  </Router>;
