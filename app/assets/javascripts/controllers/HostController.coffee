controllers = angular.module('controllers')
controllers.controller("HostController", [ '$scope', '$routeParams', '$resource', 'flash', '$location'
  ($scope, $routeParams, $resource, flash, $location)->
    Host = $resource('/hosts/:hostId', { hostId: "@id", format: 'json' },
      {
        'update': {method: 'PUT'}
      }
    )

    Host.get({ hostId: $routeParams.hostId},
      ((host)-> $scope.host = host ),
      ((httpResponse)->
        $scope.host = null
        flash.error = "There is no host with ID #{$routeParams.hostId}")
    )

    $scope.changeTab = () ->
      console.log "clicked"
      $scope.panel_edit = true
      $scope.panel_overview = false

    $scope.back = -> $location.path("/")

    $scope.edit = (host) ->
      console.log "hello"
      Host.update( {id: host.id, first_name: host.first_name, last_name: host.last_name, email: host.email})
])
