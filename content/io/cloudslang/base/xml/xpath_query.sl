#   (c) Copyright 2016 Hewlett-Packard Enterprise Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
#!!
#! @description: Selects from an XML document using an XPATH query.
#!
#! @input xml_document: XML string or file in which to query an xpath
#! @input xml_document_source: xml document type
#!                             Default: 'xmlString'
#!                             Accepted values: 'xmlString', 'xmlPath'
#! @input xpath_query: xpath query
#! @input query_type: type of selection result from query
#!                    attribute value; leave empty if setting the value of
#!                    valid: 'node', 'nodelist' or 'value'
#!                    optional
#!                    default: 'nodelist'
#! @input delimiter: string to use as delimiter in case query_type is nodelist
#!                   optional
#!                   default: ','
#! @input secure_processing: whether to use secure processing
#!                           optional
#!                           default: 'true'
#! @output selected_value: value selected or empty if no value found
#! @output return_result: exception in case of failure, success message otherwise
#! @output result_text: 'success' or 'failure'
#! @output return_code: 0 if success, -1 if failure
#! @output error_message: an exception in case of failure
#! @result SUCCESS: value was selected
#! @result FAILURE: otherwise
#!!#
####################################################

namespace: io.cloudslang.base.xml

operation:
  name: xpath_query

  inputs:
    - xml_document
    - xmlDocument:
        default: ${get("xml_document", "")}
        required: false
        private: true
    - xml_document_source:
        required: false
    - xmlDocumentSource:
        default: ${get("xml_document_source", "xmlString")}
        private: true
    - xpath_query
    - xPathQuery:
        default: ${get("xpath_query", "")}
        required: false
        private: true
    - query_type:
        required: false
    - queryType:
        default: ${get("query_type", "nodelist")}
        private: true
    - delimiter:
        required: false
        default: ','
    - secure_processing:
        required: false
    - secureProcessing:
        default: ${get("secure_processing", "true")}
        private: true

  java_action:
    gav: 'io.cloudslang.content:cs-xml:0.0.5'
    class_name: io.cloudslang.content.xml.actions.XpathQuery
    method_name: execute

  outputs:
    - selected_value: ${selectedValue}
    - return_result: ${returnResult}
    - error_message: ${errorMessage}
    - return_code: ${returnCode}

  results:
    - SUCCESS: ${returnCode == '0'}
    - FAILURE
