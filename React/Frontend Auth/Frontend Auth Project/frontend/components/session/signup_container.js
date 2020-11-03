import { connect } from 'react-redux';
import * as SessionActions from '../../actions/sessions';
import Signup from './signup';

const mapDispatchToProps = dispatch => {
  return {
    createNewUser: (formUser) => dispatch(SessionActions.createNewUser(formUser))
  };
};

export default connect(null, mapDispatchToProps)(Signup);
