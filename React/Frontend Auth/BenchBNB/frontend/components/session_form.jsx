import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.state = {
      email: '',
      password: ''
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    let rendering = '';
    if (this.props.formType == 'login') {
      rendering =
      <div>
        <h2>Login</h2>
        <Link className="btn" to="/signup">Sign Up</Link>
      </div>;
    } else {
      rendering =
      <div>
        <h2>Sign up</h2>
        <Link className="btn" to="/login">Login</Link>
      </div>;
    }

    let errors = [];
    this.props.errors.session.forEach((err) => {
      errors.push(<li>{err}</li>)
    });

    return (
      <div>
        {rendering}
        <ul>
          {errors}
        </ul>
      </div>
    )
  }
}

export default SessionForm;