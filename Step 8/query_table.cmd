REM Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
REM
REM This file is licensed under the Apache License, Version 2.0 (the "License").
REM You may not use this file except in compliance with the License. A copy of
REM the License is located at
REM
REM http://aws.amazon.com/apache2.0/
REM
REM This file is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR
REM CONDITIONS OF ANY KIND, either express or implied. See the License for the
REM specific language governing permissions and limitations under the License.

aws dynamodb query ^
    --table-name Movies ^
    --key-condition-expression "#y = :yr" ^
    --projection-expression "title" ^
    --expression-attribute-names "{\"#y\":\"year\"}" ^
    --expression-attribute-values "{\":yr\":{\"N\":\"1985\"}}" 
 
