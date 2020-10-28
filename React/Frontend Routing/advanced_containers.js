// edit_post_form_container.jsx
// this is a .jsx file because we're going to use JSX in this container
import { connect } from "react-redux";
import React from "react";
import PostForm from "./post_form";
import { fetchPost, updatePost } from "../actions/post_actions";
import { selectPost } from "../selectors";

const mapStateToProps = (state, ownProps) => {
  const defaultPost = { title: "", body: "" };
  const post = selectPost(ownProps.match.params.postId) || defaultPost;
  // get the post this route is asking for
  // (I'm assuming here that this component is being rendered by a route)
  // if I don't have the post in state yet, give me a blank post so PostForm doesn't break
  return { post };
};

const mapDispatchToProps = dispatch => {
  // an edit form will need to fetch the relevant post, but my PostForm shouldn't handle that
  // we'll handle this problem with a higher-order component, EditPostFormContainer
  return {
    fetchPost: id => dispatch(fetchPost(id)),
    submit: post => dispatch(updatePost(post))
  };
};

class EditPostForm extends React.Component {
  // this is the higher-order component made to handle the fetch

  componentDidMount() {
    // do my fetching here so that PostForm doesn't have to
    this.props.fetchPost(this.props.match.params.postId);
  }

  render() {
    // destructure the props so I can easily pass them down to PostForm
    const { post, submit } = this.props;
    return <PostForm post={post} submit={submit} />;
  }
}

// now `connect` it to the Redux store

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EditPostForm);