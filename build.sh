#!/bin/bash
docker build -t mapic/redis:latest .
docker push mapic/redis:latest