
import React, { Component } from 'react';
import { Card, CardImg, CardText, CardBody,
  CardTitle, CardSubtitle, Button } from 'reactstrap';

class Result extends Component {
  static defaultProps = {
    result: []
  }

  constructor(props) {
    super(props)
  }

  render() {
    const result = this.props.result;

    return (
      <div>
        {
          result.map((item)=>(
            <Card>
              <CardBody>
                <CardTitle>{item["Name"]}</CardTitle>
                <CardSubtitle>{item["Type"]}</CardSubtitle>
                <CardText>{item["Designed by"]}</CardText>
              </CardBody>
            </Card>
          )
          )
        }
      </div>
    );
  }

}

export default Result;
