#!/bin/bash

if command -v pip &> /dev/null
then
    pip install -r requirements.txt
else
    echo "Please, install Python >= 3.10"
fi

pm2 start "gunicorn -w 4 -k uvicorn.workers.UvicornWorker main:app" --name TamilParserServer