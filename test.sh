#!/bin/bash
docker run -it -v $(pwd):/app 99bottles:latest rspec $@
