# Homebrew Tap for PrismCast

This is the official [Homebrew](https://brew.sh) tap for [PrismCast](https://github.com/hjdhjd/prismcast), a browser-based live TV streaming server for [Channels DVR](https://getchannels.com) and [Plex](https://plex.tv).

## Requirements

PrismCast uses Google Chrome to capture video from streaming sites. If you don't already have Chrome installed, you can install it with Homebrew:

```sh
brew install --cask google-chrome
```

## Installation

```sh
brew install hjdhjd/prismcast/prismcast
```

This installs PrismCast along with its Node.js runtime dependency. Once installed, start it with:

```sh
prismcast
```

The web dashboard will be available at [http://localhost:5589](http://localhost:5589).

## Running as a Service

To run PrismCast in the background:

```sh
prismcast service install
prismcast service start
prismcast service stop
prismcast service status
```

## Updating and Uninstalling

```sh
prismcast upgrade
# or: brew upgrade prismcast
brew uninstall prismcast
```

For more details on configuration, streaming setup, and Docker deployment, see the [PrismCast documentation](https://github.com/hjdhjd/prismcast).
