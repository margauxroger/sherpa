import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import CanvasJSReact from '../canvasjs.react';
import { getStudentGrades } from '../actions';


const CanvasJS = CanvasJSReact.CanvasJS;
const CanvasJSChart = CanvasJSReact.CanvasJSChart;

class StudentDashboard extends Component {

  // componentWillMount() {
  //   this.props.getStudentGrades(this.props.course, this.props.activeStudent.id)
  // }

  // shouldComponentUpdate(nextProps, nextState) {
  //   // return this.props.activeStudent !== nextProps.activeStudent
  //   return true
  // }

  // componentDidUpdate() {
  //   this.props.getStudentGrades(this.props.course, this.props.activeStudent.id)
  // }

  render() {
  if (!this.props.activeStudent) {
    return (
      <div className="student-dashboard">
        <h3 className="pt-5">Select a student to see his/her performance...</h3>
      </div>
    );
  }


const data_graph = []
console.log(this.props.grades)
const data = Object.keys(this.props.grades).forEach((chapter) => {
                    let i = 0;
                    let hash = new Object();

                    hash.label = chapter;
                    hash.y = this.props.grades[chapter];
                    data_graph.push(hash);
                });
// console.log(data_graph);

const options_bar = {
      title: {
        text: "Flashcard score chapter by chapter",
        fontSize: 18,
      },
      data: [{
                type: "column",
                color: "rgb(128, 1, 128)",
                dataPoints: data_graph
       }],
       scales: {
              yAxes: [{
                  ticks: {
                      display: true,
                      beginAtZero: true,
                      suggestedMin: 0,
                      suggestedMax: 100
                  },
                  gridLines : {
                    display: true,
                  }
              }]
          },
        backgroundColor: "transparent",
   }

   return (
      <div className="student-dashboard col-6 position-sticky">
        <h2>{this.props.activeStudent.first_name}'s Individual Dashboard</h2>
        <img src={this.props.activeStudent.picture_url} alt="" className="avatar"/>
        <p>Overall score: {this.props.activeStudent.grade} / 100</p>
        <CanvasJSChart options = {options_bar} />
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { getStudentGrades: getStudentGrades },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    activeStudent: state.activeStudent,
    course: state.course,
    grades: state.grades
  };
}
export default connect(mapStateToProps, mapDispatchToProps)(StudentDashboard);
