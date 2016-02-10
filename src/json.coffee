_ = require('lodash')
flat = require('flat')
response = require('./response')
validate = require('./validate')
normalize = require('./normalize')
variables = require('./variables')



#
# Request Function --------------------------------------------------------
#

request = (vars) ->
  body = JSON.stringify(normalize(vars.json_property))

  url: vars.url
  method: 'POST'
  headers:
    'Content-Type': 'application/json'
    'Content-Length': body.length
    'Accept': 'application/json;q=0.9,text/xml;q=0.8,application/xml;q=0.7,text/html;0.6,text/plain;q=0.5'
  body: body



#
# Variables --------------------------------------------------------------
#

request.variables = ->
  [
    { name: 'url', description: 'Server URL', type: 'string', required: true }
    { name: 'method', description: 'HTTP method (POST, PUT, or DELETE)', type: 'string', required: true }
    { name: 'json_property.*', type: 'wildcard', required: false }
  ].concat(variables)



#
# Exports ----------------------------------------------------------------
#

module.exports =
  name: 'Generic JSON'
  request: request
  response: response
  validate: (vars) ->
    validate.url(vars) ? validate.method(vars, ['POST', 'PUT', 'DELETE'])

