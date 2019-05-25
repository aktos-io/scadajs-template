# Install

1. Install [`NodeJs 8.x`](https://nodejs.org)

2. Install global `npm` dependencies:

        # run with root/admin privileges:
        npm install -g gulp livescript node-gyp


3. Download the project template, install project dependencies:

       git clone --recursive https://github.com/aktos-io/scadajs-template myproject
       cd myproject
       # run as normal user:
       ./scada.js/install-modules.sh

# Run

Following command will start everything needed for development:

       ./uidev.service

> Use "Git Bash" to run `bash` scripts on Windows.

## Testing

1. Open your web browser and go to: http://localhost:4011

2. Open another browser window on another device (or another tab) and go to the
same address

3. See that your slider movements are synchronized in realtime (at 20fps).
