const studentsReducer = (state, action) => {
  if (state === undefined) {
    // Reducer initialisation
    return [];
  }
  // TODO: handle some actions
  switch (action.type) {
    case 'GET_STUDENTS':
      return action.payload;
    default:
      return state;
  }
};
export default studentsReducer;
