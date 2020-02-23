#!/bin/bash

# Remove default folders`
for folder in Desktop Downloads Pictures Templates Documents Music Public Videos; do
	rm -rf ${HOME}/${folder}
done
