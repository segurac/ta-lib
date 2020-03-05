#!/bin/bash

TALIB_PATH=$(pwd)/TALIB

#./tools/build_talib_from_source.bash $TALIB_PATH

#keep only static library, this way the generated wheel package will not need any additional dependency
rm  $TALIB_PATH/lib/*so*

export TA_LIBRARY_PATH=$TALIB_PATH/lib
export TA_INCLUDE_PATH=$TALIB_PATH/include

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip wheel
pip install numpy pandas nose 

python setup.py  bdist_wheel

echo "Autocontained wheel package build in dist/*.whl" 


