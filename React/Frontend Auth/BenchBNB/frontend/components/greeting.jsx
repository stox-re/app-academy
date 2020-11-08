import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    console.log("Greeting props");
    console.log(this.props);

    let loggedInRender =
      <div>
        <Link className="btn" to="/signup">Sign Up</Link>
        <Link className="btn" to="/login">Log In</Link>
      </div>;
    if (typeof this.props.currentUser != 'undefined') {
      loggedInRender =
      <div>
        <h2>Welcome back, {this.props.currentUser.email}</h2>
        <button onClick={this.props.logout}>Logout</button>
      </div>;
    }

    return (
      <div>
        {loggedInRender}
      </div>
    );
  }
}

export default Greeting;