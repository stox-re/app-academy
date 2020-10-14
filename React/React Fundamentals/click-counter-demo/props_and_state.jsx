// Don't change props, use state for that

class WordInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      word: ""
    };
    this.updateWord = this.updateWord.bind(this);
  }

  updateWord(event) {
    this.setState({ word: event.currentTarget.value }, () => {
      console.log(this.state.word);
    });
  }

  render() {
    return (
      <div>
        <input onChange={this.updateWord} value={this.state.word} />
        <span>The word is: {this.state.word}</span>
      </div>
    );
  }
}

export default WordInput;

/*
  Note that because setState() triggers a re-render,
  it should not be called during a render(),
  as that would trigger an infinite loop.
  Here, setState() works because this.updateWord is called by user-input after the element is rendered.

  this.setState() takes an optional callback since it is run async
*/