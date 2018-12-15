import React, { Component } from 'react';
import { Container, Button, Form, FormGroup, Label, Input, FormText } from 'reactstrap';
import api from 'superagent'
import Result from './result';

class Search extends Component {
  constructor(props) {
    super(props)
    this.state = {
      result: []
    }
  }

  render() {
    const matches = this.result_matches;

    return (
      <Container style={{"margin-top": "10px"}}>
      <Form onSubmit={this.submit}>
        <FormGroup>
          <Input type="text" name="query" id="query" placeholder="input here to search" onChange={(e)=>{
            this.setState({query: e.target.value})
          }}></Input>
        </FormGroup>
        <div>
          <p>{matches} matches.</p>
        </div>
        <Result result={this.state.result} />
      </Form>
      </Container>
    );
  }

  submit = (e, form) => {
    e.preventDefault();
    api.get("http://localhost:3000/api/search")
      .query({query: this.state.query})
      .end((err, res)=>{
        console.log(res, err);
        if(res) {
          this.setState({result: res.body});
        } else {
          this.setState({result: []});
        }
      })
  }

  get result_matches() {
    return this.state.result.length;
  }
}

export default Search;
