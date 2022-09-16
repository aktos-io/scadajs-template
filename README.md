# Description

This is the bare minimum template project to easily get up and running with [ScadaJS](https://github.com/aktos-io/scada.js).

# Live Demo 

See this project live on https://aktos.io/st.

# Development

### 1. Clone this repo and install its dependencies

> Windows users: Follow [these instructions](https://github.com/aktos-io/scada.js/blob/1f63386332ea55f911ea687c9e8c7080c0f6c904/doc/on-windows/README.md) first.

1. Open a terminal window (Windows users: right click, click "Open MSYS2 here")
2. `git clone --recursive https://github.com/aktos-io/scadajs-template`
3. `cd scadajs-template`
4. Create a virtual environment: `make create-virtual-env`
5. `make install-deps`

### 2. Build 

1. `make development` will start necessary services. 
2. Use your favourite text editor for editing files. 
3. Go to http://localhost:4011

### 3. Prepare your database 

This is optional (or you can do it later). See: [prepare-database.md](./prepare-database.md).

### 4. Release 

1. `make release`. 
2. Stop your development server (if it's running).
3. Run: `./production.service` (look into the script, it's self documentary)
4. Go to http://localhost:4011

