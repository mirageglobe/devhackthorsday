#!/bin/sh

nginx -t

exec "$@"


