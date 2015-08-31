

GenericShop.IndexRoute = Ember.Route.extend
  model: ->  $.get('merchandise.json?')

