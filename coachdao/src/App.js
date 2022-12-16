import React, { useState } from 'react';
import './App.css';
import Navbar from './Navbar';
import Searchbar from './Searchbar';

function App() {
  const [coachingRequest, setCoachingRequest] = useState('');
  const [coachingResponse, setCoachingResponse] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    if (coachingRequest) {
      fetch('/coaching-dao', {
        method: 'POST',
        body: JSON.stringify({ coachingRequest }),
        headers: { 'Content-Type': 'application/json' },
      })
        .then((response) => response.json())
        .then((result) => {
          setCoachingResponse(result.coachingResponse);
        });
    }
  };

  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={coachingRequest}
          onChange={(event) => setCoachingRequest(event.target.value)}
        />
        <button type="submit">Submit</button>
      </form>
      {coachingResponse && <p>{coachingResponse}</p>}
    </div>
  );
}

export default App;