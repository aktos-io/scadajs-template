# Description

This is the bare minimum template project to easily get up and running with [ScadaJS](https://github.com/aktos-io/scada.js).

# Live Demo 

See this project live on https://aktos.io/st.

# Development

### 1. Clone and install dependencies

1. `git clone --recursive https://github.com/aktos-io/scadajs-template`
2. `cd scadajs-template`
3. Optional: Create virtual environment: [using-virtual-environment.md](https://github.com/aktos-io/scada.js/blob/master/doc/using-virtual-environment.md)
4. `make install-deps` (Windows users: Install `make` first: https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058#make)

### 2. Create a Webapp

A) Either create a webapp from scratch: [./creating-webapp.md](./creating-webapp.md).

- or

B) Copy and edit `this` template according to your needs.

### 3. Prepare your database 

See: [prepare-database.md](./prepare-database.md).

### 4. Build 

1. `make development` will start necessary services. 
2. Use your favourite text editor for editing files. 
3. Go to http://localhost:4011

### 5. Release 

1. `make release`. 
2. Stop your development server (if it's running).
3. Run: `./production.service` (look into the script, it's self documentary)
4. Go to http://localhost:4011

