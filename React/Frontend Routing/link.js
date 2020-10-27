import { Link } from 'react-router-dom';

<div>

  <div>
    <Link to="/about">About</Link>
    <Link to="/about" onClick={e => this.handleClick(e)}>Link</Link>
  </div>

  {
    //app.jsx
  }

  <div>
  <NavLink to={`users/${user.id}`} activeClassName="active">{user.name}</NavLink>
    {
      // when at path `users/123` the following html is rendered
    }
    <a href="#/users/123" class="active">Michael</a>
    {
      // when not at path `users/123` the following is html rendered
    }
    <a href="#/users/123">Michael</a>
  </div>
  <div>
     {
      // this link will match the URL `/users/123`
    }
    <NavLink to="/users">Users</NavLink>
    {
      // whereas this one will not
    }
    <NavLink exact={true} to="/users">Users</NavLink>
  </div>

</div>