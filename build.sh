#!/bin/bash
docker build -t mapic/redis:latest . || exit 1
docker push mapic/redis:latest