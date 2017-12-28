angular.module('doubtfire.units.states.edit.directives.unit-tutorials-editor', [])

#
# Editor for modifying the tutorials in a unit
#
.directive('unitTutorialsEditor', ->
  replace: true
  restrict: 'E'
  templateUrl: 'units/states/edit/directives/unit-tutorials-editor/unit-tutorials-editor.tpl.html'
  controller: ($scope, $modal, $rootScope, Unit, UnitRole, Tutorial, UnitTutorialEditModal, alertService) ->
    $scope.editTutorial = (tutorial) ->
      UnitTutorialEditModal.show $scope.unit, tutorial

    $scope.deleteTutorial = (tutorial) ->
      Tutorial.delete { id: tutorial.id },
        (response) ->
          $scope.unit.tutorials = _.without $scope.unit.tutorials, tutorial
          alertService.add("info", "Tutorial #{tutorial.abbreviation} was deleted successfully")
        (response) ->
          alertService.add("danger", response.data.error)

    $scope.createTutorial = ->
      UnitTutorialEditModal.show $scope.unit

)
