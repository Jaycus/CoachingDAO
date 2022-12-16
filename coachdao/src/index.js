import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';

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