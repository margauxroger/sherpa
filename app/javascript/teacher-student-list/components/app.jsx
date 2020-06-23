import React from 'react';
import StudentList from "../containers/student-list";
import StudentDashboard from "../containers/student-dashboard";

const App = () => {
  return (
    <div className="app">
      <StudentList className="col-5" />
      <StudentDashboard className="col-6" />
    </div>
  );
};



export default App;
