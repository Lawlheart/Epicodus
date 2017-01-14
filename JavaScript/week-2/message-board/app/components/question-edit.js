import Ember from 'ember';

export default Ember.Component.extend({
  updateQuestionForm: false,
  actions: {
    showUpdateQuestionForm() {
      this.set('updateQuestionForm', true);
    },
    updateQuestion(question) {
      let params = {
        content: this.get('content'),
        author: this.get('author'),
        notes: this.get('notes')
      };
      this.set('updateQuestionForm', false);
      this.sendAction('updateQuestion', question, params);
    },
    deleteQuestion(question) {
      if(confirm("Are you sure you want to delete this question?")) {
        this.sendAction('deleteQuestion', question);
      }

    }
  }
});
