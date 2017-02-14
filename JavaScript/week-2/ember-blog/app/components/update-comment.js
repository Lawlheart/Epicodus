import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    updateComment(comment) {
      let params = {
        message: this.get('message'),
        author: this.get('author')
      };
      this.sendAction('updateComment', comment, params)
    }
  }
});
