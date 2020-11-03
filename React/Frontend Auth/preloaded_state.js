// Stores can be initialized with a preloaded state

const preloadedState = { user: window.currentUser };
const store = createStore(reducer, preloadedState, enhancers);