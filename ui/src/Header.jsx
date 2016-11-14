import { h } from 'preact';
import { Link } from 'preact-router';

import Nav from './Nav';

export default ({ username, logout }) =>
  <section class="hero is-primary is-medium">
    <div class="hero-head">
      <Nav
        username={username}
        logout={() => logout()}
      />
    </div>
  </section>;
