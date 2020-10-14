class Counts extends React.Component {
  constructor(props) {
    super(props);
    this.setState({
      something: 5
    });
  }

  componentDidMount() { debugger }
  componentDidUpdate() { debugger }
  componentWillUnmount() { debugger }

  static getDerivedStateFromProps(props, state) {
    //after a component is instantiated as well as before it is rendered
    //It can return an object to update state, or null to indicate that the new props do not require any state updates.
    debugger
  }

  render() {
    return (<div></div>);
  }
}

export default Counts;


// An AJAX Component using componentDidMount

class MyAjaxComponent extends React.Component {
  constructor() {
    super();
    this.state = { items: [] };
  }

  componentDidMount() {
    /*$.ajax({
      url: '/items',
      success: response => this.setState({ items: response });
    });*/
  }

  render() {
    if (this.state.items.length === 0) {
      return (
        <div>Fetching Items...</div>
      );
    } else {
      return (
        <ul>
          {this.state.items.map(item => <li>{item}</li>)}
        </ul>
      );
    }
  }
};