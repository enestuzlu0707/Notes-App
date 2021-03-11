import React, { Component } from 'react';
import Datetime from 'react-datetime';
import moment from 'moment';

export default class DateTimePicker extends Component {
  constructor(props) {
    super(props);

    this.state = {
      name: this.props.name,
      value: this.props.value,
    };
  }

  onChange = e => {
    this.setState({ value: e.valueOf() });
  };

  render() {
    return (
      <Datetime
        timeConstraints={{ minutes: { step: 5 } }}
        value={moment(this.state.value)}
        onChange={this.onChange}
        defaultValue={new Date()}
        closeOnSelect
        inputProps={{ readOnly: true, name: this.state.name }}
      />
    );
  }
}
