import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { selectActiveStudent } from '../actions';
import { getStudentGrades } from '../actions';



class Student extends Component {
  handleClick = () => {
    this.props.selectActiveStudent(this.props.student);
    this.props.getStudentGrades(this.props.course, this.props.student.id)
  }

  render() {
    return (
      <div className="frontside mb-3">
          <div className="card-student-list" onClick={this.handleClick}>
            <div className="card-body-student">
              <div className="photo-nom">
                <img src={this.props.student.picture_url} className={this.props.student.last_name} alt=""/>
                <h20 className="card-title">
                  {this.props.student.first_name}
                </h20>
              </div>
              <p className="card-student-text flex-grow-1">{this.props.student.email}</p>
              <p>{this.props.student.grade} / 100</p>


            </div>
          </div>
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { selectActiveStudent: selectActiveStudent, getStudentGrades : getStudentGrades },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    activeStudent: state.activeStudent,
    course: state.course
  };
}
export default connect(mapStateToProps, mapDispatchToProps)(Student);
