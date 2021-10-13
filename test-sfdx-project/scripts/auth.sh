#!/bin/bash
if [$1 == "prod"]; then
sfdx force:auth:web:login --setalias prod --instanceurl https://login.salesforce.com
elif [ $1 == "stage"]; then
sfdx force:auth:web:login --setalias stage --instanceurl https://test.salesforce.com
else 
sfdx force:auth:web:login --setalias $1 --instanceurl https://test.salesforce.com --setdefaultusername
fi