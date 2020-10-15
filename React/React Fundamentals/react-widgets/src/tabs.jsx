import React from 'react';
import TabHeader from './tab_header';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedTab: 0
    }
    this.updateTabTo = this.updateTabTo.bind(this);
  }

  updateTabTo(index) {
    this.setState({
      selectedTab: index
    });
  }

  render() {
    let tabItems = [];
    this.props.tabObjects.forEach((tabItem, index) => {
      tabItems.push(<TabHeader key={index} tabIndex={index} selectedTab={this.state.selectedTab} title={tabItem.title} onClick={this.updateTabTo}/>);
    });

    return (
      <div className='tabs'>
       <ul>
         {tabItems}
       </ul>
       <article>
         {this.props.tabObjects[this.state.selectedTab].content}
       </article>
      </div>
    )
  }
}

export default Tabs;