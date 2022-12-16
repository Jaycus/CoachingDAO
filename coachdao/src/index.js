import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';
import { Link } from 'react-router-dom';

ReactDOM.render(<App />, document.getElementById('root'));

// Navigation Bar
const Navbar = () => {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/about">About</Link>
      <Link to="/contact">Contact</Link>
    </nav>
  );
};

// Render Navigation Bar
ReactDOM.render(<Navbar />, document.getElementById('nav'));

// Search Bar
const Searchbar = () => {
  return (
    <div className="searchbar">
      <input type="text" placeholder="Search..." />
      <button type="submit">Search</button>
    </div>
  );
};

// Render Search Bar
ReactDOM.render(<Searchbar />, document.getElementById('search'));
