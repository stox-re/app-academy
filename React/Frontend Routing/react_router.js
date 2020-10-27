// root.jsx
import { Route, HashRouter } from 'react-router-dom';

const Root = () => (
  <HashRouter>
    // HashRouter can only have a single child component, so we wrap our routes in this div
    <div>
      <Header />
      <Route exact path="/" component={Feed} />
      <Route path="/users" component={Users} />
    </div>
  </HashRouter>
);


const Users = () => (
  // render the index of no id is included
  <div>
    <Route exact path="/users" component={UsersIndex} />
    <Route path="/users/:userId" component={Profile} />
  </div>
);

/*

  Note that there's no need to use HashRouter again - as long as it wraps our root file
  all of our Route components will be able to connect to it.

*/

/*

  Location props are passed to the Profile component

  location - This is an object that makes the current URL available to us.
    It's most important key is pathname, which returns the current URL.

  match - This is an object that contains important information about how the current URL matches the route path.
    Here are some of the more useful keys on the match object

*/

class Profile extends React.Component {
  componentDidMount() {
    const id = this.props.match.params.userId;
    fetchUser(id);
  }

  render() {
    // ...
  }
}

