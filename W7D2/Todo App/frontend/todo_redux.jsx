import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// Phase1: Logging
// const addLoggingToDispatch = (store) => {
//   let sd = store.dispatch;
//   return (action) => {
//     console.log("old state: ", store.getState());
//     console.log("action: ", action);
//     sd(action);
//     console.log("new state: ", store.getState());
//   };
// };

//Phase2: Refactoring
// const addLoggingToDispatch = store => next => action => {
//     console.log("old state: ", store.getState());
//     console.log("action: ", action);
//     next(action);
//     console.log("new state: ", store.getState());
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let sd = store.dispatch;
//   middlewares.forEach((middleware) => {
//     sd = middleware(store)(sd);
//   });
//   return Object.assign({}, store, { sd });
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store); //Phase1: Logging
  // store = applyMiddlewares(store, addLoggingToDispatch); //Phase2: Refactoring

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
