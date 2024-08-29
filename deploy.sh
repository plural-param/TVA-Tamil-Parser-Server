#!/bin/bash

if command -v pip &> /dev/null
then
    pip install -r requirements.txt
    pip install gdown
else
    echo "Please, install Python >= 3.10"
fi

if [ -d "Models" ]; then
    rm -rf Models
fi

mkdir Models
mkdir Models/Model_V1.1


if [ -d "Aug12-run" ]; then
    mv Aug12-run/* Models/Model_V1.1/
fi

gdown --folder https://drive.google.com/drive/folders/13LGnj5SMKW_775sFdJT93P05op4C9TBB
mv Aug12-run/* Models/Model_V1.1/

rm Aug12-run

pm2 start "gunicorn -w 4 -k uvicorn.workers.UvicornWorker main:app" --name TamilParserServer