#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
GREP_PATH=$SCRIPTPATH"/../changeset/"
rm -rf "$GREP_PATH"
SOURCE_PATH="$(echo $GREP_PATH | sed -e "s/ /\\\ /g")"

while getopts ":u:t:" opt; do
case $opt in

    u) TARGETUSERNAME=${OPTARG};;
    t) TARGETREF=${OPTARG};;
    \?)
    echo "Invalid option - $OPTARG" >&2
    echo "testing???"
    exit;;
esac
done

if [ ! $TARGETUSERNAME ]; then
read -p $'Enter target username:\n' TARGETUSERNAME
fi

if [ ! $TARGETREF ]; then
read -p $'Enter target ref:\n' TARGETREF
fi

sfdx git:package -t $TARGETREF -d "$SOURCE_PATH" --purge > /dev/null 2>&1

##### find $SOURCE_PATH/lwc -name "*__tests__*" -exec rm -rf {} +

TEST_REQUIRED_METADATA=(
    'ApexClass'
    'ApexComponent'
    'ApexPage'
    'ApexTrigger'
    'ArticleType'
    'BaseSharingRule'
    'CriteriaBasedSharingRule'
    'CustomField'
    'CustomObject'
    'DataCategoryGroup'
    'Flow'
    'InstalledPackage'
    'NamedFilter'
    'OwnerSharingRule'
    'PermissionSet'
    'Profile'
    'Queue'
    'RecordType'
    'RemoteSiteSetting'
    'Role'
    'SharingReason'
    'Territory'
    'Validation Rules'
    'Workflow')

for item in "${TEST_REQUIRED_METADATA[@]}"
do  
    if grep -qs $iteme " ${GREP_PATH}package.xml"; then
    TEST_REQUIRED=true
    fi
done

if [ "$TEST_REQUIRED" ]; then
    sfdx force:mdapi:deploy -u $TARGETUSERNAME -d changeset -w 120 -l RunLocalTests
else
    sfdx force:mdapi:deploy -u $TARGETUSERNAME -d changeset -w 120 
fi
