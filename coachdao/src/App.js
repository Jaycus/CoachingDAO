import React from 'react';
import './App.css';

function App() {
  return (
    <div className="App">
      <h1>Coaching DAO</h1>
      <div id="coaching-request">
        <input type="text" id="coaching-request-input" placeholder="Enter your coaching request" />
        <button id="coaching-request-submit">Submit</button>
      </div>
      <div id="coaching-response"></div>
    </div>
  );
}

export default App;