import React from 'react'
import ReactDOM from 'react-dom'

export class Root extends React.Component {
  constructor(props) {
    super(props)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.state = { messages: [] }
  }

  handleSubmit(e) {
    e.preventDefault()
    var input = ReactDOM.findDOMNode(this.refs.message).value

    fetch('http://localhost:9393/answer?input=' + encodeURIComponent(input))
    .then(function(response){
      return response.json()
    }).then(function(json){
      ReactDOM.findDOMNode(this.refs.message).value = ''
      this.setState({
        messages: this.state.messages.concat({body: json.name + ':' + json.responder + '> ' + json.answer, created_at: json.created_at}).sort(function(a,b){
          return (a.created_at > b.created_at) ? -1 : 1
        })
      })
    }.bind(this))
  }

  render() {
    return (
      <div>
        <h1>Message</h1>
        <form className="messageForm" onSubmit={this.handleSubmit}>
          <input type="text" placeholder="message..." ref="message" />
          <input type="submit" value="Post" />
        </form>
        <ul>
        {
          this.state.messages.map(function(message) {
            return <li>{message.body}</li>
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
