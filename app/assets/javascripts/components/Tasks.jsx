class Tasks extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      response: null
    }

    this.click = this.click.bind(this)
  }

  click() {
    fetch("/rate_limited.json").then((response) => {
      response.json().then((data) => {
        this.setState({response: data.response})
      })
    })
  }

  render() {
    return <div className="tasks-form">
      <table className="tasks-table">
        <tbody>
          <tr>
            <td className="header">Subject:</td>
            <td><input type="text" className="subject" /></td>
          </tr>
          <tr>
            <td className="header">Content:</td>
            <td><textarea className="content" rows="10"></textarea></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="button" value="Submit" onClick={ this.click } /></td>
          </tr>
        </tbody>
      </table>
      { this.state.response }
    </div>
  }
}
