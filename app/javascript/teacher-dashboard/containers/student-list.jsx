import React, { Component } from 'react';
import Student from "./student";
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class StudentList extends Component {

  componentDidMount() {
    // this.props.getStudents(this.props.course); // to comment to use preloaded data --> cannot be sure if it's faster
  }


  render() {
    return (
      <div className="student-list-small">
          {students.map((student) => {
            return (
              <Student student={student} key={student.id}/>
            );
          })}
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    students: state.students,
  };
}

export default connect(mapStateToProps)(StudentList);
