import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';
import { Link } from 'react-router-dom';

ReactDOM.render(<App />, document.getElementById('root'));

window.addEventListener('load', () => {
  const coachingRequestInput = document.getElementById('coaching-request-input');
  const coachingRequestSubmit = document.getElementById('coaching-request-submit');
  const coachingResponse = document.getElementById('coaching-response');

  coachingRequestSubmit.addEventListener('click', () => {
    const coachingRequest = coachingRequestInput.value;
    if (coachingRequest) {
      fetch('/coaching-dao', {
        method: 'POST',
        body: JSON.stringify({coachingRequest}),
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(response => response.json())
        .then(data => {
          coachingResponse.innerHTML = `<p>${data.response}</p>`;
        });
    }
  });
});

// Animations for UI
(document).ready(function(){
  (".button").on("click", function(){
    (this).animate({
      width: "100px",
      height: "100px"
    }, 500);
  });
});

// Navigation Bar 
const Navbar = () => {
  return (
    <div className="navbar">
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/about">About</Link></li>
        <li><Link to="/contact">Contact</Link></li>
      </ul>
    </div>
  )
};

// Render Navigation Bar
ReactDOM.render(<Navbar />, document.getElementById('root'));

// Search Bar
const Searchbar = () => {
  return (
    <div className="searchbar">
      <input type="text" placeholder="Search..." />
      <button type="submit">Search</button>
    </div>
  )
};

// Render Search Bar
ReactDOM.render(<Searchbar />, document.getElementById('root'));