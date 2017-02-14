import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    return this.store.findRecord('post', params.post_id);
  },
  actions: {
    deletePost(post) {
      post.destroyRecord();
      this.transitionTo('index');
    },
    updatePost(post, params) {
      Object.keys(params).forEach(function(key) {
        if(params[key] !== undefined) {
          post.set(key,params[key]);
        }
      });
      post.save();
      this.transitionTo('index');
    },
    saveComment(params) {
      let newComment = this.store.createRecord('comment', params);
      let post = params.post;
      post.get('comments').addObject(newComment);
      newComment.save().then(function() {
        return post.save();
      });
      this.transitionTo('post', post);
    },
    deleteComment(comment) {
      comment.destroyRecord();
    },
    updateComment(comment, params) {
      console.log(comment, params)
      Object.keys(params).forEach(function(key) {
        if(params[key] !== undefined) {
          comment.set(key,params[key]);
        }
      });
      comment.save();
    }
  }
});
