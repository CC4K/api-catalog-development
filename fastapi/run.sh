#!/bin/bash
source venv/bin/activate
helium http://localhost:8000/redoc
fastapi dev
exit 0