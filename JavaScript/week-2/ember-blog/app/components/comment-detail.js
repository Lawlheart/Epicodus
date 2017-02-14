import Ember from 'ember';

export default Ember.Component.extend({
  updateCommentForm: false,
  actions: {
    showUpdateCommentForm() {
      this.set('updateCommentForm', true);
    },
    deleteComment(comment) {
      if(confirm("are you sure?")) {
        this.sendAction('deleteComment', comment);
      }
    },
    updateComment(comment, params) {
      this.set('updateCommentForm', false);
      this.sendAction('updateComment', comment, params)
    }
  }
});
