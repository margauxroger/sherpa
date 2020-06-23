const activeStudentReducer = (state, action) => {
  if (state === undefined) {
    // Reducer initialisation
    return false;
  }
  // TODO: handle some actions
  switch (action.type) {
    case 'SELECT_STUDENT':
      return action.payload;
    default:
      return state;
  }
};
export default activeStudentReducer;
