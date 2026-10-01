#!/bin/sh

# Optional: wait for the database to be ready (requires 'postgresql-client' installed)
# while ! pg_isready -h db -p 5432 -U postgres; do
#   echo "Waiting for database..."
#   sleep 2
# done

echo "Applying database migrations..."
python3 /app/manage.py migrate

echo "Starting Gunicorn..."
# Execute the CMD passed to the docker container
exec "$@"
