install-deps:
	cd scada.js; make install-deps CONF=../dcs-modules.txt

development:
	cd scada.js && make development

production:
	cd scada.js && make production

update:
	git pull
	git submodule update --recursive --init

update-ui:
	cd scada.js/release/main; git pull
