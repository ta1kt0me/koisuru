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
        messages: this.state.messages.concat({
          user: json.name + ': ' + json.responder,
          body: json.answer,
          created_at: json.created_at
        }).sort(function(a,b){
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
          <div className="form-group">
            <input type="text" placeholder="message..." ref="message" className="form-control" />
          </div>
          <input type="submit" value="Post" className="btn btn-default" />
        </form>
        <ul className="padding-bottom-5 list-unstyled">
        {
          this.state.messages.map(function(message) {
            return (
              <li key={message.created_at} className="alert alert-info" role="alert">
                <span className='text-muted small'>{message.user}</span>: <span>{message.body}</span>
              </li>
            )
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
