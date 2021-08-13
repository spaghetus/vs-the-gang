all: clean build pack

run: clean build
	#!/bin/bash
	set -m
	cd Kade-Engine/export/release/html5/bin
	php -S 127.0.0.1:8000 &
	xdg-open http://127.0.0.1:8000
	fg %1

build: week_data week_characters week_names week_icons
	#!/bin/bash
	cd Kade-Engine
	./build-with-docker.sh

clean:
	#!/bin/bash
	cd Kade-Engine
	git clean -f -d
	git reset --hard

week_data:
	node week_data/script.js

week_characters:
	node week_characters/script.js

week_names:
	cat week_names.txt > Kade-Engine/assets/preload/data/weekNames.txt

week_icons:
	cp icons/* Kade-Engine/assets/preload/images/storymenu

pack:
	rm out.tar.gz || echo "No existing artifact found."
	tar -czvf out.tar.gz Kade-Engine/export/release/html5/bin CODE_LICENSE ART_LICENSE