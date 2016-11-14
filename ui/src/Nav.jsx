import { h, Component } from 'preact';
import { Link, route } from 'preact-router';

import User from './User';

export default class extends Component {
  closeNav() {
    this.setState({ navOpen: false });
  }

  logout() {
    this.closeNav();
    this.props.logout();
    route('/');
  }

  goToUsername() {
    this.closeNav();
    route('/username');
  }

  hamburger(username, navOpen) {
    if (!username) { return null; }

    return (
      <span
        class={{ 'nav-toggle': true, 'is-active': navOpen }}
        onClick={() => this.setState({ navOpen: !navOpen })}
      >
        <span></span>
        <span></span>
        <span></span>
      </span>
    );
  }

  navLinks(username, navOpen) {
    if (!username) { return null; }

    return (
      <div class={{ 'nav-right': true, 'nav-menu': true, 'is-active': navOpen }}>
        <a class="nav-item" onClick={() => this.goToUsername()}>{username}</a>
        <a class="nav-item" onClick={() => this.logout()}>Logout</a>
      </div>
    );
  }

  render({ username }, { navOpen }) {
    return (
      <nav class="nav">
        <div class="container">
          <div class="nav-left">
            <h1 class="title">
              <Link href="/" class="nav-item">
                Snact Chat
              </Link>
            </h1>
          </div>
          {this.hamburger(username, navOpen)}
          {this.navLinks(username, navOpen)}
        </div>
      </nav>
    );
  }
}
