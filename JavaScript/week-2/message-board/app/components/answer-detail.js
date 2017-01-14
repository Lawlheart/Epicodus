import Ember from 'ember';

export default Ember.Component.extend({
  updateAnswerForm: false,
  actions: {
    showUpdateAnswerForm() {
      this.set('updateAnswerForm', true);
    },
    updateAnswer(answer, params) {
      this.set('updateAnswerForm', false);
      this.sendAction('updateAnswer', answer, params);
    },
    deleteAnswer(answer) {
      if(confirm("Are you sure you want to delete this answer?")) {
        this.sendAction('deleteAnswer', answer);
      }
    }
  }
});
