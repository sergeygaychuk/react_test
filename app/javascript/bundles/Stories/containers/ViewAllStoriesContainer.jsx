import React from 'react';
import { Provider } from 'mobx-react';
import ViewAllStories from '../components/ViewAllStories';

export default (props, _railsContext) => {
  return (
    <ViewAllStories {...props} />
  );
};
