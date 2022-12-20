# Local server
This is the server for the URL shortener app exercise.

The server doesn't have a database and stores the shortened URLs in memory.

## Getting started
First you need to install the dependencies for the server.

Make sure you have `node` installed, then run `npm install` inside the server folder.

## Running
Run `node index.js` inside the server folder.

The server will run by default on port `3000`. If you are already using this port, feel free to change the `port` constant in `index.js`

## Accessing server from the app

### iOS simulator
The iOS simulator has direct access to you localhost, so the address for the server is `http://localhost:3000`

### Android emulator
The Android emulator usually redirects the host's localhost to `10.0.2.2`, so the address to access the server from the emualtor is `http://10.0.2.2:3000`
