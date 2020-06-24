const showAllStudentsReducer = (state, action) => {
  if (state === undefined) {
    // Reducer initialisation
    return false;
  }
  // TODO: handle some actions
  switch (action.type) {
    case 'SHOW_STUDENTS':
      return action.payload;
    default:
      return state;
  }
};
export default showAllStudentsReducer;
