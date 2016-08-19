controllers = angular.module('controllers')
controllers.controller("HostsController", [ '$scope', '$routeParams' , '$location', '$resource'
  ($scope, $routeParams, $location, $resource)->
    $scope.search = (keywords)-> $location.path("/").search('keywords',keywords)
    Host = $resource('/hosts/:hostId', { hostId: "@id", format: 'json' })
    console.log(Host)
    if $routeParams.keywords
      Host.query(keywords: $routeParams.keywords, (results)-> $scope.hosts = results)
    else
      $scope.hosts = []
])
