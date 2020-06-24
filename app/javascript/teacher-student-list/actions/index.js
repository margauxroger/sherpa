// TODO: add and export your own actions

export function selectActiveStudent(student) {
  // TODO: Api call! For now, simulate a DB
  return {
    type: 'SELECT_STUDENT',
    payload: student
  };
}

export function showAllStudents() {
  // TODO: Api call! For now, simulate a DB
  return {
    type: 'SHOW_STUDENTS',
    payload: true
  };
}

const ROOT_URL_INDEX = `/api/v1/users?course_id=`;

export function getStudents(course) {
  const promise = fetch(`${ROOT_URL_INDEX}${course}`)
    .then(response => response.json());
  return {
    type: "GET_STUDENTS",
    payload: promise
  };
}

const ROOT_URL_SHOW = `/api/v1/materials?course_id=`;

export function getStudentGrades(course,student) {
  const promise = fetch(`${ROOT_URL_SHOW}${course}&student_id=${student}`)
    .then(response => response.json());
  return {
    type: "GET_STUDENT_GRADES",
    payload: promise
  };
}
