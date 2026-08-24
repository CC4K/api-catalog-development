#!/bin/bash
source venv/bin/activate
SWAGGER_YAML=PizzaShackAPI_2.0.0/PizzaShackAPI-2.0.0/Definitions/swagger.yaml
API_YAML=PizzaShackAPI_2.0.0/PizzaShackAPI-2.0.0/api.yaml


########### OSEF un peu non ? ###########
# YAML > JSON
cat $SWAGGER_YAML | yq .

cat $SWAGGER_YAML | yq . > ./swagger.json


# JSON > YAML
cat ./swagger.json | yq -y .
#########################################



# search
cat $SWAGGER_YAML | yq .info.version
# "2.0.0"

cat $SWAGGER_YAML | yq .info
# {
#   "title": "PizzaShackAPI",
#   "description": "This is a RESTFul API for Pizza Shack online pizza delivery store.\n",
#   "contact": {
#     "name": "John Doe",
#     "url": "http://www.pizzashack.com",
#     "email": "architecture@pizzashack.com"
#   },
#   "license": {
#     "name": "Apache 2.0",
#     "url": "http://www.apache.org/licenses/LICENSE-2.0.html"
#   },
#   "version": "2.0.0"
# }

cat $API_YAML | yq .data.lastUpdatedTime
# "2026-07-03 09:46:54.848"




# filtering
yq '.info | del(.license, .contact.url)' $SWAGGER_YAML
# {
#   "title": "PizzaShackAPI",
#   "description": "This is a RESTFul API for Pizza Shack online pizza delivery store.\n",
#   "contact": {
#     "name": "John Doe",
#     "email": "architecture@pizzashack.com"
#   },
#   "version": "2.0.0"
# }

yq -y '.info | del(.license, .contact.url)' $SWAGGER_YAML
# title: PizzaShackAPI
# description: 'This is a RESTFul API for Pizza Shack online pizza delivery store.

#   '
# contact:
#   name: John Doe
#   email: architecture@pizzashack.com
# version: 2.0.0

yq '.components.schemas.Order.properties | map(select(.type != "string"))' $SWAGGER_YAML
# [
#   {
#     "type": "boolean"
#   },
#   {
#     "type": "number"
#   }
# ]

yq -y '.components.schemas.Order.properties | map(select(.type != "string"))' $SWAGGER_YAML
# - type: boolean
# - type: number

