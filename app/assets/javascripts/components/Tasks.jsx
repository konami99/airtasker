class Tasks extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      response: null
    }

    this.submit = this.submit.bind(this)
  }

  classes() {
    return classNames({
      "alert": true,
      "alert-success": this.state.response === "ok",
      "alert-warning": this.state.response !== "ok" && this.state.response !== null
    })
  }

  submit(event) {
    event.preventDefault()
    this.setState({response: null})
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
    let message
    if (this.state.response !== null) {
      message = <div className={ this.classes() } role="alert">
        <strong>{ this.state.response }</strong>
      </div>
    }

    return <div className="container">
      <div className="row">
        <div className="col-0 col-md-3"></div>
        <div className="col-12 col-md-6">
          <form className="form-group" id="task-form" onSubmit={ this.submit }>
            <div className="form-group">
              <label for="subject">Subject</label>
              <input type="text" id="subject" className="form-control" name="subject" />
            </div>
            <div className="form-group">
              <label for="content">Content</label>
              <textarea id="content" className="form-control" name="content" rows="3"></textarea>
            </div>

            <button type="submit" className="btn btn-primary">Submit</button>
          </form>
          { message }
        </div>
        <div className="col-0 col-md-3"></div>
      </div>
    </div>
  }
}
