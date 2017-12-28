angular.module("doubtfire.common.services.redirect", [])

.factory("redirectService", ($state, $stateParams) ->
  #
  # The redirect service object
  #
  redirectService = {}

  # TODO: (@alexcu) need to test multiple params and nested objects here...
  deserialize = (str, prefix) ->
    result = {}
    parts = str.split "&"
    for i, attr of parts
      kv = attr.split "="
      k = kv[0]
      v = kv[1]
      result[k] = v
    result

  redirectService.redirect = (defaultState, defaultParams) ->
    destState = defaultState
    destParams = defaultParams
    if $stateParams["dest"] && !_.includes(['not_found', 'unauthorised'], $stateParams["dest"])
      destState = $stateParams["dest"]
      destParams = deserialize $stateParams["params"] if $stateParams["params"]?
    $state.go destState, destParams

  redirectService
)
