class Tasks extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      response: null
    }

    this.submit = this.submit.bind(this)
  }

  submit(event) {
    event.preventDefault()
    fetch("/tasks.json", {
      method: "post",
      body: new FormData(document.getElementById("task-form"))
    }).then((response) => {
      response.json().then((data) => {
        this.setState({response: data.response})
      })
    })
  }

  render() {
    return <div className="tasks-form">
      <form id="task-form" onSubmit={ this.submit }>
        <table className="tasks-table">
          <tbody>
            <tr>
              <td className="header">Subject:</td>
              <td><input name="subject" type="text" className="subject" /></td>
            </tr>
            <tr>
              <td className="header">Content:</td>
              <td><textarea name="content" className="content" rows="10"></textarea></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" value="Submit" /></td>
            </tr>
          </tbody>
        </table>
      </form>
      { this.state.response }
    </div>
  }
}
