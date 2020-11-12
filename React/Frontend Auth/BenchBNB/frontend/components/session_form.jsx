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

    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handlePasswordChange = this.handlePasswordChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    let result = this.props.processForm(user).then((result) => {
      if (!result.success) {
        this.setState({
          email: '',
          password: ''
        })
      } else {
        this.props.history.push('/');
      }
    });
  }

  handleEmailChange(event) {
    this.setState({
      email: event.target.value
    });
  }

  handlePasswordChange(event) {
    this.setState({
      password: event.target.value
    });
  }

  render() {
    let rendering = '';
    if (this.props.formType == 'login') {
      rendering =
      <div>
        <h2>Login</h2>
        <form>
          <div>
            <label htmlFor="login-email">Email</label>
            <input onChange={this.handleEmailChange} id="login-email" type="text" value={this.state.email} placeholder='Enter your email...'></input>
          </div>
          <div>
            <label htmlFor="login-password">Password</label>
            <input onChange={this.handlePasswordChange} id="login-password" type="password" value={this.state.password} placeholder='Enter the password...'></input>
          </div>
          <div>
            <button onClick={this.handleSubmit} type="submit">Submit</button>
          </div>
        </form>
        <Link className="btn" to="/signup">Looking to sign up?</Link>
      </div>;
    } else {
      rendering =
      <div>
        <h2>Sign up</h2>
        <form>
          <div>
            <label htmlFor="signup-email">Email</label>
            <input onChange={this.handleEmailChange} id="signup-email" type="text" value={this.state.email} placeholder='Enter your email...'></input>
          </div>
          <div>
            <label htmlFor="signup-password">Password</label>
            <input onChange={this.handlePasswordChange} id="signup-password" type="password" value={this.state.password} placeholder='Enter the password...'></input>
          </div>
          <div>
            <button onClick={this.handleSubmit} type="submit">Submit</button>
          </div>
        </form>
        <Link className="btn" to="/login">Looking to login?</Link>
      </div>;
    }

    let errors = [];
    this.props.errors.session.forEach((err, idx) => {
      errors.push(<li key={idx}>{err}</li>)
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