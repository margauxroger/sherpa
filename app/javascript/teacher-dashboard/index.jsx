// external modules
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import { logger } from 'redux-logger';
import ReduxPromise from 'redux-promise';

// internal modules
import App from './components/app';
// import '../assets/stylesheets/application.scss';

// import studentsReducer from "./reducers/students-reducer";
// import activeStudentReducer from "./reducers/active-student-reducer";
// import courseReducer from "./reducers/course-reducer";
// import gradesReducer from "./reducers/grades-reducer";
// import showAllStudentsReducer from "./reducers/show-all-students-reducer";



const dashContainer = document.getElementById('root2');
// console.log(listContainer)

if (dashContainer) {
  const initialState = {
    scores: JSON.parse(dashContainer.dataset.score),
    chapters: JSON.parse(dashContainer.dataset.chapters),
    // course: JSON.parse(dashContainer.dataset.course)
  };
  // console.log(JSON.parse(listContainer.dataset.course))

  // State and reducers
  const reducers = combineReducers({
    // students: studentsReducer,
    // activeStudent: activeStudentReducer,
    // course: courseReducer,
    // grades: gradesReducer,
    // allStudents: showAllStudentsReducer,
  });

  const middlewares = applyMiddleware(logger, ReduxPromise);

  // render an instance of the component in the DOM
  ReactDOM.render(
    <Provider store={createStore(reducers, initialState, middlewares)}>
      <App />
    </Provider>,
    dashContainer
  );

}
