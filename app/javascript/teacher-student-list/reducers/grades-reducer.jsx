const gradesReducer = (state, action) => {
  if (state === undefined) {
    // Reducer initialisation
    return [];
  }
  switch (action.type) {
    case 'GET_STUDENT_GRADES':
      return action.payload;
    default:
      return state;
  }
};
export default gradesReducer;
