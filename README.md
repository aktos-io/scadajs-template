# Description

This is the bare minimum template project to easily get up and running with [ScadaJS](https://github.com/aktos-io/scada.js).

# Install

#### 1. Install Global Dependencies

1. Install [`NodeJs`](https://nodejs.org)

2. Install global `npm` dependencies (**as root/admin**):

        npm install -g gulp livescript@1.4.0


3. Download the project template, install project dependencies:

       git clone https://github.com/aktos-io/scadajs-template myproject
       cd myproject
       git submodule update --init --recursive
       ./scada.js/install-modules.sh

# Run

If you are on Linux, following commands will start everything needed for development:

1. On the first terminal:

       ./uidev.service

2. On the second terminal:

       ./server.service

### The Manual Way

1. Start continuous build of your webapp (one of `html-js`, `html-ls`, `pug-ls`):

       cd scada.js
       gulp --webapp pug-ls

2. Start webserver/dcsserver:

       cd servers
       ./run-ls webserver.ls

## Testing

1. Open your web browser and go to: http://localhost:4001

2. Open another browser window on another device (or another tab) and go to the
same address

3. See that your slider movements are synchronized in realtime (at 20fps).

## Monitor

If you want to monitor all messaging traffic, run monitor:

        cd servers
        ./run-ls monitor.ls

# See Also

For a more complete showcase, see the [Showcase](https://github.com/aktos-io/scadajs-showcase).
