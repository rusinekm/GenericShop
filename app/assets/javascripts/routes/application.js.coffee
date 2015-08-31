GenericShop.ApplicationRoute = Ember.Route.extend

  model: -> $.get('categories.json')