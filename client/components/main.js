import React from 'react'
import ReactDOM from 'react-dom'

export class Root extends React.Component {
  constructor(props) {
    super(props)
    this.state = { messages: [] }
  }

  render() {
    return (
      <div>
        <h1>Message</h1>
        <form className="messageForm">
          <input type="text" placeholder="message..." ref="message" />
          <input type="submit" value="Post" />
        </form>
        <ul>
        {
          this.state.messages.map(function(message) {
            return <li key={message}>{message}</li>
          })
        }
        </ul>
      </div>
    )
  }
}
ReactDOM.render(
  <Root />, document.querySelector('#root')
)
