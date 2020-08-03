install-deps:
	cd scada.js; make install-deps CONF=../dcs-modules.txt

main-dev:
	cd scada.js && make development APP=main

main-production:
	cd scada.js && make production APP=main
