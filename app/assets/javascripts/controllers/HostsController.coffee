controllers = angular.module('controllers')
controllers.controller("HostsController", [ '$scope', '$routeParams' , '$location', '$resource', 'flash'
  ($scope, $routeParams, $location, $resource, flash)->
    $scope.search = (keywords)-> $location.path("/").search('keywords',keywords)
    Host = $resource('/hosts/:hostId', { hostId: "@id", format: 'json' },
      {
        'create': {method: 'POST'},
      }
    )

    if $routeParams.keywords
      Host.query(keywords: $routeParams.keywords, (results)-> $scope.hosts = results)
    else
      $scope.hosts = []

    $scope.view = (hostId)-> $location.path("/hosts/#{hostId}")
    $scope.newHost =()-> $location.path("/hosts/new")

    $scope.cancel = ->
      # if $scope.host.id
      #   $location.path("/hosts/#{$scope.host.id }")
      # else
        $location.path("/")

    onError = (_httpResponse)-> flash.error = "Something went wrong"

    $scope.save = ->
      Host.create($scope.host,
        ( (newHost)-> $location.path("/hosts/#{newHost.id}") )
        onError
      )

])
