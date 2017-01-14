import Ember from 'ember';

export default Ember.Component.extend({
  newQuestionForm: false,
  actions: {
    showNewQuestionForm() {
      this.set('newQuestionForm', true);
    },
    saveQuestion() {
      let params = {
        content: this.get('content'),
        author: this.get('author'),
        notes: this.get('notes')
      };
      this.set('newQuestionForm', false);
      this.sendAction('saveQuestion', params);
    }
  }
});
