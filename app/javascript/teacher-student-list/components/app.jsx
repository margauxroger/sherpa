import React from 'react';
import StudentList from "../containers/student-list";
import StudentDashboard from "../containers/student-dashboard";

const App = () => {
  return (
    <div className="app d-flex">
      <StudentList />
      <StudentDashboard />
    </div>
  );
};



export default App;
