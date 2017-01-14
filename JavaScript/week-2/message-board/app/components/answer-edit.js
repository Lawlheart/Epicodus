import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    updateAnswer(answer) {
      let params = {
        content: this.get('content'),
        author: this.get('author')
      };
      this.sendAction('updateAnswer', answer, params);
    }
  }
});
