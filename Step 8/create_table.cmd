@echo off
rem Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
rem
rem This file is licensed under the Apache License, Version 2.0 (the "License").
rem You may not use this file except in compliance with the License. A copy of
rem the License is located at
rem
rem http://aws.amazon.com/apache2.0/
rem
rem This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
rem CONDITIONS OF ANY KIND, either express or implied. See the License for the
rem specific language governing permissions and limitations under the License.


aws dynamodb create-table ^
    --table-name Movies ^
    --attribute-definitions ^
        AttributeName=year,AttributeType=N ^
        AttributeName=title,AttributeType=S ^
    --key-schema ^
        AttributeName=year,KeyType=HASH ^
        AttributeName=title,KeyType=RANGE ^
    --billing-mode PROVISIONED ^
    --provisioned-throughput ^
        ReadCapacityUnits=10,WriteCapacityUnits=10
            
