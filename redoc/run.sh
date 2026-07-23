#!/bin/bash
#echo "python -m http.server" | xclip -r -selection clipboard
helium http://localhost:8000/test.html
python -m http.server
exit 0
