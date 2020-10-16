import React from 'react';

class Modal extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className='modal'>
        <div className='modal-display'>
          <h1>{this.props.alert ? 'Congratulations, you won!' : 'Aww, you lost.'}</h1>
          <button onClick={this.props.restartFunction}>Restart game</button>
        </div>
      </div>
    )
  }
}

export default Modal;