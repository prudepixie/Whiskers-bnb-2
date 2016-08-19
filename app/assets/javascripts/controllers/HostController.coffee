controllers = angular.module('controllers')
controllers.controller("HostController", [ '$scope', '$routeParams', '$resource',
  ($scope, $routeParams, $resource)->
    Host = $resource('/hosts/:hostId', { hostId: "@id", format: 'json' })

    Host.get({ hostId: $routeParams.hostId},
      ((host)-> $scope.host = host ),
      ((httpResponse)-> $scope.host = null)
    )
])
