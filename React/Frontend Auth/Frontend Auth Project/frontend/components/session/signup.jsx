import React from 'react';

class Signup extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      email: '',
      password: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInput = this.handleInput.bind(this);
  }

  handleInput(type) {
    return (event) => {
      this.setState({
        [type]: event.target.value
      });
    }
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.createNewUser(this.state).then(() => {
      this.props.history.push('/chirps');
    });
  }

  render() {
    return (
      <div className="session-form">
        <h2>Signup</h2>
        <form>
          <label>Username</label>
          <input type="text" value={this.state.username} onChange={this.handleInput('username')}></input>

          <label>Email</label>
          <input type="text" value={this.state.email} onChange={this.handleInput('email')}></input>

          <label>Password</label>
          <input type="password" value={this.state.password} onChange={this.handleInput('password')}></input>

          <button onClick={this.handleSubmit}>Signup</button>
        </form>
      </div>
    );
  }
}

export default Signup;