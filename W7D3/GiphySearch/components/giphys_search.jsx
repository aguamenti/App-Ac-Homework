import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch {
  constructor(props) {
    this.props = props;
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({searchTerm: e.currentTarget.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm.split(' ').join('+'));
  }

  render() {
    return (
      <form >
        <input type="text" value={this.state.searchTerm} onChange={this.handleChange}></input>
        <button type="submit" onClick={this.handleSubmit}>Search</button>
      </form>
    );
  }
}

export default GiphysSearch;
