SHELL = /bin/bash

install-deps:
	@( cd scada.js; \
	[[ ! -d ./nodeenv ]] && make create-venv;\
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

update:
	git pull
	git submodule update --recursive --init

update-ui:
	cd scada.js/release/main; git pull
