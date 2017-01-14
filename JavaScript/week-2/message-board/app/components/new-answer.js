import Ember from 'ember';

export default Ember.Component.extend({
  newAnswerForm: false,
  actions: {
    showNewAnswerForm() {
      this.set('newAnswerForm', true);
    },
    saveAnswer() {
      let params = {
        content: this.get('content'),
        author: this.get('author'),
        question: this.get('question')
      };
      this.set('newAnswerForm', false);
      this.sendAction('saveAnswer', params);
    }
  }
});
