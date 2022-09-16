SHELL = /bin/bash
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

install-deps:
	@( source virtual-env-path.sh; \
	cd scada.js; \
	source ./venv; \
	make install-deps CONF=../dcs-modules.txt; \
	cd ..; \
	npm install; \
	echo ; \
	echo " *** All mandatory dependencies are installed. ***"; \
	echo ; \
	)

development:
	cd scada.js && make development

release:
	cd scada.js && make release

update-src:
	git pull
	git submodule update --recursive --init

update-ui:
	cd scada.js/release/main; git pull

create-virtual-env:
	pip install nodeenv --user
	[[ -e virtual-env-path.sh ]] || echo export SCADAJS_VENV_PATH=$(DIR)/scadajs-venv > virtual-env-path.sh
	(source virtual-env-path.sh && cd scada.js && make create-venv)

 
