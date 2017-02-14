import Ember from 'ember';

export default Ember.Component.extend({
  displayNewPostForm: false,
  actions: {
    showNewPostForm() {
      this.set('displayNewPostForm', true);
    },
    savePost() {
      let params = {
        title: this.get('title'),
        author: this.get('author'),
        date: this.get('date'),
        body: this.get('body')
      };
      this.set('displayNewPostForm', false);
      this.sendAction('savePost', params);
    }
  }
});
