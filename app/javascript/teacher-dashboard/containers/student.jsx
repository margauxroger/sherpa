import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class Student extends Component {

  componentDidMount() {
    // this.props.getStudents(this.props.course); // to comment to use preloaded data --> cannot be sure if it's faster
  }


  render() {
    return (
      <div class="card-class-dashboard-student">
        <div class="card-class-dashboard-student-name">
          {this.props.student.first_name}
        </div>
        <div class="card-class-dashboard-student-photo">
          <img src={this.props.student.picture_url} className={style}/>
                  <%= image_tag student.picture_url, alt: "card image", class: "img-fluid #{student.border_color(@material)}" %>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    students: state.students,
  };
}

export default connect(mapStateToProps)(Student);
