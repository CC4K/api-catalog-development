# Notes on API Controller


## Subscribing and Testing in API Manager :
=> Applications -> <app_name> -> Sandbox Keys
=> NEW SECRET (or still have the older secret)
=> <api_name> -> TRY OUT -> API Console -> documentation below

swagger.json available on Developer Portal
<user_name>-<api_name>--<version>.zip available on Publisher Portal




## API-CTL



### INIT

```bash
$ apictl init PizzaShackAPI --oas admin-PizzaShackAPI-1.0.0/PizzaShackAPI-1.0.0/Definitions/swagger.yaml 
Initializing a new WSO2 API Manager project in /home/cedric_k/Desktop/PizzaShackAPI_example/PizzaShackAPI
Project initialized
Open README file to learn more
```

### LOGIN/LOGOUT

```bash
$ apictl login test (-u admin)
Password:
Logged into APIM in  test environment
```

```bash
$ apictl logout test
Logged out from APIM in  test  environment
```


### GET

```bash
$ apictl get envs
NAME                API MANAGER ENDPOINT     REGISTRATION ENDPOINT   TOKEN ENDPOINT                        PUBLISHER ENDPOINT   DEVPORTAL ENDPOINT   ADMIN ENDPOINT      MI MANAGEMENT ENDPOINT
test                https://localhost:9443                           https://localhost:9443/oauth2/token                                                                 
```

```bash
$ apictl get apps -e test
ID                                     NAME                 OWNER               STATUS              GROUP ID
b6b3d463-0972-473a-b053-4118b2dd5a4c   DefaultApplication   admin               APPROVED            
```

```bash
$ apictl get apis -e test
ID                                     NAME                VERSION             CONTEXT             STATUS              PROVIDER
13928432-2fb6-46a6-8b28-376c912bc742   hello               1.0.0               /hello              PUBLISHED           admin
54232014-8afe-4a64-bfb3-0b8aa71edf0c   PizzaShackAPI       1.0.0               /pizzashack         RETIRED             admin
fdbade72-9b70-4461-8166-ffae9ff2d241   PizzaShackAPI       2.0.0               /pizzashack         PUBLISHED           admin
```

```bash
$ apictl get api-revisions -n PizzaShackAPI -v 1.0.0 -e test (-r admin)
ID                                     REVISION            DESCRIPTION         GATEWAY_ENVS
5539aa3e-b893-4bf5-a30a-aa2493f01db9   1                   Initial Revision    [Default]
```

```bash
$ apictl get api-products -e test -l 5 (-q provider:admin)
ID                                     NAME                CONTEXT             VERSION             STATUS              PROVIDER
7e1449ca-c24f-4f8a-ad34-9d744c5f6253   Pizza               /product_test       1.0.0               PUBLISHED           admin
```

```bash
$ apictl get keys -n PizzaShackAPI -e test
WARNING: credentials are stored as a plain text in /home/cedric_k/.wso2apictl.local/keys.json
eyJ4NXQiOiJZMkUxWXpsaU5UUm1PV0kyWkRNNVpqTTVObUV4WVdGaE4yRTNPREEwT0RFek9UTmpNV1JtWW1JMU5qZGpabUZqWm1JNU5qSmxObUU0T0dGa05qVTRPQSIsImtpZCI6IlkyRTFZemxpTlRSbU9XSTJaRE01WmpNNU5tRXhZV0ZoTjJFM09EQTBPREV6T1ROak1XUm1ZbUkxTmpkalptRmpabUk1TmpKbE5tRTRPR0ZrTmpVNE9BX1JTMjU2IiwidHlwIjoiYXQrand0IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJiMjBkMDkwMC0yN2YxLTQ4ZGQtYTE5ZS0zYTZmNDQyYzMxNGEiLCJhdXQiOiJBUFBMSUNBVElPTiIsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0Ojk0NDMvb2F1dGgyL3Rva2VuIiwiZW50aXR5X2lkIjoiYWR2Zm9FQjgwYWRzcGZZdVFRdGczNFJyTTJBYSIsImNsaWVudF9pZCI6ImFkdmZvRUI4MGFkc3BmWXVRUXRnMzRSck0yQWEiLCJ1c2lkIjoiZDkwYzcxZmMtNGI3MS00MjI5LWFiYzEtYjEwNzY3ODljNDcxIiwiYXVkIjoiYWR2Zm9FQjgwYWRzcGZZdVFRdGczNFJyTTJBYSIsIm5iZiI6MTc4MjI5NDMxOSwiYXpwIjoiYWR2Zm9FQjgwYWRzcGZZdVFRdGczNFJyTTJBYSIsInNjb3BlIjoiZGVmYXVsdCIsImV4cCI6MTc4MjI5NzkxOSwiaWF0IjoxNzgyMjk0MzE5LCJqdGkiOiI4YWNiMTliNy1hOTQ5LTQwOWUtOWMxZC01MjYwOTU4MDQyNDQifQ.r5DjUmgnEKH4t1KGY25Z4NDBrc9z3vU1E3Uc4SIGWx98RdheHNLE3K_e-nwKE1qPVobPVjHEQkIZVC4X_uypfGvVNKbJ0axcLNah1hy6DPQf_EMPxS_ZQbskbM_bG-zhYHaUFWlBPkfZSQ7us0HDeGM2bdiN9bD0fFpYuqxTkuLrTq5DQnnYJM1IPlcvykOMm8Gy5Aec87zH8kBgVg5pszrJ0pSL1_r_kWWC4--dWPps8Slqwoz29ITv67hh81Lpp1bKh1LhL6FGenXkHd8hgpFwHz2ID1xAxxAW2MsK2BsWClhE1FyXX2cg0zuxJUVaprD8cVLY3TrawngLMTKNhQ
```

```bash
$ apictl get policies rate-limiting -e test -q type:api
UUID                                   NAME                TYPE
15d00748-9767-4102-bc15-c94625bb366e   10KPerMin           api
392c08ab-4946-4a08-bf70-0c20172db880   20KPerMin           api
5f25994d-4289-4086-88d7-58fa0842d7ed   50KPerMin           api
4d77c11e-6750-488d-8e8a-43063a37aae4   Unlimited           api
```

```bash
$ apictl get api-logging -e test 
API_ID                                 API_CONTEXT           LOG_LEVEL
54232014-8afe-4a64-bfb3-0b8aa71edf0c   /pizzashack/1.0.0     OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
fdbade72-9b70-4461-8166-ffae9ff2d241   /pizzashack/2.0.0     OFF
7e1449ca-c24f-4f8a-ad34-9d744c5f6253   /product_test/1.0.0   OFF
54232014-8afe-4a64-bfb3-0b8aa71edf0c   /pizzashack/1.0.0     OFF
54232014-8afe-4a64-bfb3-0b8aa71edf0c   /pizzashack/1.0.0     OFF
54232014-8afe-4a64-bfb3-0b8aa71edf0c   /pizzashack/1.0.0     OFF
54232014-8afe-4a64-bfb3-0b8aa71edf0c   /pizzashack/1.0.0     OFF
54232014-8afe-4a64-bfb3-0b8aa71edf0c   /pizzashack/1.0.0     OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
13928432-2fb6-46a6-8b28-376c912bc742   /hello/1.0.0          OFF
fdbade72-9b70-4461-8166-ffae9ff2d241   /pizzashack/2.0.0     OFF
fdbade72-9b70-4461-8166-ffae9ff2d241   /pizzashack/2.0.0     OFF
fdbade72-9b70-4461-8166-ffae9ff2d241   /pizzashack/2.0.0     OFF
fdbade72-9b70-4461-8166-ffae9ff2d241   /pizzashack/2.0.0     OFF
fdbade72-9b70-4461-8166-ffae9ff2d241   /pizzashack/2.0.0     OFF
```


### EXPORT/IMPORT

```bash
$ apictl export api -n PizzaShackAPI -v 1.0.0 -e test
Successfully exported API!
Find the exported API at /home/cedric_k/.wso2apictl/exported/apis/test/PizzaShackAPI_1.0.0.zip
```

```bash
$ apictl export apis -e test
Exporting APIs for the migration...
Cleaning all the previously exported APIs of the given target tenant, in the given environment if any, and prepare to export APIs from beginning
Batch of 2 APIs exported successfully..!

Total number of APIs exported: 2
API export path: /home/cedric_k/.wso2apictl/exported/migration/test/tenant-default/apis

Command: export-apis execution completed !
```

```bash
$ apictl export app -n DefaultApplication -o admin -e test
Successfully exported Application!
Find the exported Application at /home/cedric_k/.wso2apictl/exported/apps/test/admin_DefaultApplication.zip
```

```bash
$ apictl export apps -e test --with-keys 
Exporting Applications...
Cleaning all the previously exported Apps of the given target tenant, in the given environment if any, and prepare to export Apps from beginning
Successfully exported Application!
Find the exported Application at /home/cedric_k/.wso2apictl/exported/migration/test/tenant-default/apps/admin_DefaultApplication.zip
Successfully exported Application!
Find the exported Application at /home/cedric_k/.wso2apictl/exported/migration/test/tenant-default/apps/admin_default-apictl-app.zip
Batch of 2 Apps exported successfully..!

Total number of Apps exported: 2
App export path: /home/cedric_k/.wso2apictl/exported/migration/test/tenant-default/apps

Command: export-apps execution completed !
```

```bash
$ apictl import api -f .wso2apictl/exported/apis/test/PizzaShackAPI_1.0.0.zip -e test
Status: 409 
Response: {"code":900300,"message":"The API already exists.","description":"The API already exists","moreInfo":"","error":[]}
apictl: Error importing API Reason: 409 
Exit status 1
```


### ADD/REMOVE ENV

```bash
$ apictl remove env test
Successfully removed environment 'production'
Execute 'apictl add env --help' to see how to add a new environment
```

```bash
$ apictl add env test --apim  https://localhost:9443
Default token endpoint 'https://localhost:9443/oauth2/token' is added as the token endpoint 
Successfully added environment 'test'
```


### CHANGE-STATUS

```bash
$ apictl change-status api -a Deprecate -e test -n PizzaShackAPI -v 1.0.0
PizzaShackAPI API state changed successfully!
```

```bash
$ apictl change-status api -a Retire -e test -n PizzaShackAPI -v 1.0.0
PizzaShackAPI API state changed successfully!
```
