import React, { useState } from 'react';
import PropTypes from 'prop-types';
import Datetime from 'react-datetime';
import moment from 'moment';

const DateTimePicker = props => {
  const [name, setName] = useState(props.name);
  const [value, setValue] = useState(props.value);

  return (
    <Datetime
      timeConstraints={{ minutes: { step: 15 } }}
      value={moment(value)}
      onChange={e => setValue(e.valueOf())}
      defaultValue={new Date()}
      closeOnSelect
      inputProps={{ readOnly: true, name: name }}
    />
  );
};

DateTimePicker.propTypes = {
  name: PropTypes.string.isRequired,
  value: PropTypes.string.isRequired,
};

export default DateTimePicker;
