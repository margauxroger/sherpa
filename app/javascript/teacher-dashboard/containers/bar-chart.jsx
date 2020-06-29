import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class BarChart extends Component {

  componentDidMount() {
    // this.props.getStudents(this.props.course); // to comment to use preloaded data --> cannot be sure if it's faster
  }


  render() {
    console.log(this.props.chapters)
    console.log(this.props.scores)
    const data_graph = []
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
            text: "Flashcard progression over chapters",
            fontSize: 30,
          },
          data: [{
                    type: "column",
                    color: "rgb(128, 1, 128)",
                    dataPoints: data_graph
           }],
            backgroundColor: "transparent",
       }

       return (
          <div className="barchart-graph">
            <CanvasJSChart options = {options_bar} />
          </div>
        );
      }
    }

function mapStateToProps(state) {
  return {
    score: state.score,
    chapter: state.chapter,
  };
}

export default connect(mapStateToProps)(BarChart);
