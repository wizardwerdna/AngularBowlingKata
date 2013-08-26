'use strict'

angular.module('bowlingApp')
  .controller 'MainCtrl', ($scope) ->

    $scope.addRoll = (pins)->
      $scope.rolls.push pins

    $scope.reset = ->
      $scope.rolls = []

    $scope.reset()
