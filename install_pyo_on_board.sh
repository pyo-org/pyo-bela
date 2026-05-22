#!/bin/bash

mkdir tmp
cd tmp
echo "=== Downloading pyo-bela wheel. ==="
wget -q https://github.com/alexdrymonitis/pyo-bela/releases/download/v1.0.6/pyo-1.0.6-cp311-cp311-linux_aarch64.whl
echo "=== Installing with pip ==="
python3 -m pip install --user --break-system-packages ../../pyo/dist/pyo-1.0.6-cp311-cp311-linux_aarch64.whl
echo "=== Cleanup. ==="
cd ..
rm -r tmp
echo "=== Done! ==="

