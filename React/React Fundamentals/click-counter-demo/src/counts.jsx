import React from 'react';

/*class Counts extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <ul>
        {
          this.props.previousCounts.reverse().map((count, index) => {
            return <li key={index}>{count}</li>;
          })
        }
      </ul>
    )
  }
}*/

//const Counts = (props) => {
const Counts = ({ previousCounts }) => {
  return (
    <ul>
      {
        previousCounts.map((count, index) => {
          return <li key={index}>{count}</li>;
        })
      }
    </ul>
  )
}

export default Counts;