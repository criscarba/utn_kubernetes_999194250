#!/bin/bash

# Wait for the database to be ready
while ! mysqladmin ping -h${MYSQL_DB_HOST} -uroot -p${MYSQL_ROOT_PASSWORD} --silent; do
    sleep 1
done

# Print custom instruction
echo My argument is: $1

# Start the Flask application
export FLASK_APP=query.py
python3 -m flask run --host=0.0.0.0