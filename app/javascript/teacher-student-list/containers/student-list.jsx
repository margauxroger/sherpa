import React, { Component } from 'react';
import Student from "./student";
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { getStudents} from '../actions';

class StudentList extends Component {

  componentWillMount() {
    this.props.getStudents(this.props.course); // to comment to use preloaded data --> cannot be sure if it's faster
  }

  shouldComponentUpdate(nextProps, nextState) {
    return false
  }

  render() {
    return (

      <div className="student-list">
        {this.props.students.map((student) => {
            return (
              <Student student={student} key={student.id}/>
          );
        })}
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { getStudents: getStudents },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    students: state.students,
    course: state.course,
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(StudentList);
