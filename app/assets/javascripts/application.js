
//= require jquery
//= require foundation
//= require_tree .
//= require ./generic_shop

GenericShop = Ember.Application.create({
  ready: function() {
    Ember.run.next(this, function(){ 
      $(document).foundation(); 
    });
  }
});
