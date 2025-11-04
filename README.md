# Lightbulb Automation

## chip-build Image

The chip-build image provides all the necessary tools to actually build and run chip-tool, but doesn't actually have it built already.

## Running the REPL as Sudo

sudo out/python_env/bin/python3 out/python_env/bin/matter-repl

scripts/build_python.sh -p false -b false -d true -g chip_enable_ethernet=true -g chip_enable_wifi=false -m platform -i out/python_nowifi
