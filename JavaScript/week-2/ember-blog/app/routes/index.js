import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findAll('post');
  },
  actions: {
    savePost(params) {
      this.store.createRecord('post', params).save();
      this.transitionTo('index');
    }
  }
});
