controllers = angular.module('controllers')
controllers.controller("HostController", [ '$scope', '$routeParams', '$resource', 'flash', '$location'
  ($scope, $routeParams, $resource, flash, $location)->
    Host = $resource('/hosts/:hostId', { hostId: "@id", format: 'json' })

    Host.get({ hostId: $routeParams.hostId},
      ((host)-> $scope.host = host ),
      ((httpResponse)->
        $scope.host = null
        flash.error = "There is no host with ID #{$routeParams.hostId}")
    )

    $scope.back = -> $location.path("/")
])
