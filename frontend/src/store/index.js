// import { createStore } from 'redux';
// import reducer from './reducer';

// // ==============================|| REDUX - MAIN STORE ||============================== //

// const store = createStore(reducer);
// const persister = 'Free';

// export { store, persister };

import { configureStore } from '@reduxjs/toolkit';
import rootReducer from './reducer';

const store = configureStore({
  reducer: rootReducer,
  // Add middleware or other configuration options here
});

const persister = 'Free';

export { store, persister };
