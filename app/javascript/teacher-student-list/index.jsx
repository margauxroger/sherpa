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

import studentsReducer from "./reducers/students-reducer";
import activeStudentReducer from "./reducers/active-student-reducer";
import courseReducer from "./reducers/course-reducer";
import gradesReducer from "./reducers/grades-reducer";
import showAllStudentsReducer from "./reducers/show-all-students-reducer";



const listContainer = document.getElementById('root');
// console.log(listContainer)

if (listContainer) {
  const initialState = {
    students: JSON.parse(listContainer.dataset.students),
    course: JSON.parse(listContainer.dataset.course)
  };
  // console.log(JSON.parse(listContainer.dataset.course))

  // State and reducers
  const reducers = combineReducers({
    students: studentsReducer,
    activeStudent: activeStudentReducer,
    course: courseReducer,
    grades: gradesReducer,
    allStudents: showAllStudentsReducer,
  });

  const middlewares = applyMiddleware(logger, ReduxPromise);

  // render an instance of the component in the DOM
  ReactDOM.render(
    <Provider store={createStore(reducers, initialState, middlewares)}>
      <App />
    </Provider>,
    listContainer
  );

}
