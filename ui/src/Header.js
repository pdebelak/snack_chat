import { h } from 'preact';
import { Link } from 'preact-router';

export default () =>
  <section class="hero is-primary is-medium">
    <div class="hero-head">
      <header class="nav">
        <div class="container">
          <div class="nav-left">
            <h1 class="title">
              <Link href="/" class="nav-item">
                Snact Chat
              </Link>
            </h1>
          </div>
        </div>
      </header>
    </div>
  </section>;
