import React from 'react';
import { Socket } from 'phoenix';

class Square extends React.Component {
  constructor(props) {
    super(props);
    this.socket = new Socket("/socket", {params: {token: }})
  }

  clickSquare = () => {
    console.log("clicked a square!");
  }

  render() {
    return (
      <div className="square" onClick={this.clickSquare}>{this.props.value}</div>
    );
  }
}

class Game extends React.Component {
  state = {
    board: [
      [null, null, null],
      [null, null, null],
      [null, null, null],
    ]
  }

  render() {
    return (
      <div className="game">
        <div className="row">
          <Square value={this.state.board[0][0]} />
          <Square value={this.state.board[0][1]} />
          <Square value={this.state.board[0][2]} />
        </div>
        <div className="row">
          <Square value={this.state.board[1][0]} />
          <Square value={this.state.board[1][1]} />
          <Square value={this.state.board[1][2]} />
        </div>
        <div className="row">
          <Square value={this.state.board[2][0]} />
          <Square value={this.state.board[2][1]} />
          <Square value={this.state.board[2][2]} />
        </div>
      </div>
    );
  }
}

export default Game;
