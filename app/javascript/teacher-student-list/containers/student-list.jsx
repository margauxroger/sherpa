import React, { Component } from 'react';
import Student from "./student";
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { getStudents } from '../actions';
import { showAllStudents } from '../actions';

class StudentList extends Component {

  handleClick = () => {
    this.props.getStudents(this.props.course);
    this.props.showAllStudents();
  }

  componentDidMount() {
    // this.props.getStudents(this.props.course); // to comment to use preloaded data --> cannot be sure if it's faster
  }


  render() {
    const students = (this.props.allStudents) ? this.props.students : this.props.students.slice(0,5);
    const style = `btn-sherpa mb-5 text-center ${(this.props.students.length > 5) ? "display-none" : "" }`
        return (
      <div className="student-list col-6">
        <h1 className="mt-3 mb-5">
          <span className="highlight-orange">List of Students</span>
        </h1>
          {students.map((student) => {
            return (
              <Student student={student} key={student.id}/>
            );
          })}
          <div className={style} onClick={ this.handleClick }>See all students</div>
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { getStudents, showAllStudents },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    students: state.students,
    course: state.course,
    allStudents: state.allStudents,
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(StudentList);
