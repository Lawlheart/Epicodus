import Ember from 'ember';

export default Ember.Component.extend({
  newCommentForm: false,
  actions: {
    showNewCommentForm() {
      this.set('newCommentForm', true);
    },
    saveComment() {
      let params = {
        message: this.get('message'),
        author: this.get('author'),
        post: this.get('post')
      };
      this.set('newCommentForm', false);
      this.sendAction('saveComment', params);
    }
  }
});
