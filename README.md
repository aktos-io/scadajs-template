# Description

This is the bare minimum template project to easily get up and running with [ScadaJS](https://github.com/aktos-io/scada.js).

# Live Demo 

https://aktos.io/scadajs-template

# Install

1. Install [`NodeJs`](https://nodejs.org)

2. Install global `npm` dependencies (**as root/admin**):

        npm install -g gulp livescript@1.4.0


3. Download the project template, install project dependencies:

       git clone --recursive https://github.com/aktos-io/scadajs-template myproject
       cd myproject
       ./scada.js/install-modules.sh

# Run

If you are on Linux, following command will start everything needed for development:

       ./uidev.service

### Manual way

Execute all commands in separate terminals within the `./uidev.service` script.

## Testing

1. Open your web browser and go to: http://localhost:4011

2. Open another browser window on another device (or another tab) and go to the
same address

3. See that your slider movements are synchronized in realtime (at 20fps).


# See Also

For a more complete showcase, see the [Showcase](https://github.com/aktos-io/scadajs-showcase).
