import Ember from 'ember';

export default Ember.Component.extend({
  isUpdateFormShowing: false,
  actions: {
    showUpdateForm() {
      this.set('isUpdateFormShowing', true);
    },
    hideUpdateForm() {
      this.set('isUpdateFormShowing', false);
    },
    deletePost(post) {
      if(confirm('Are you sure?')) {
        this.sendAction('deletePost', post);
      }
    },
    updatePost(post) {
      let params = {
        title: this.get('title'),
        author: this.get('author'),
        date: this.get('date'),
        body: this.get('body')
      };
      this.set('isUpdateFormShowing', false);
      this.sendAction('updatePost', post, params);
    }
  }
});
