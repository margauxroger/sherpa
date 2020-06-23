const courseReducer = (state, action) => {
  if (state === undefined) {
    // Reducer initialisation
    return null;
  }
  switch (action.type) {
    // case 'SELECT_STUDENT':
    //   return action.payload;
    default:
      return state;
  }
};
export default courseReducer;
