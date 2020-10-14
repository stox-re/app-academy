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