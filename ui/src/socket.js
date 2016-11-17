import {Socket} from 'phoenix-socket';

import User from './User';

const socket = new Socket('/socket', { token: User.token });

socket.connect();

export default socket;
