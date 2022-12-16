import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import Navbar from './Navbar';
import Searchbar from './Searchbar';
import './index.css';
import { Link } from 'react-router-dom';

ReactDOM.render(<App />, document.getElementById('root'));

// Render Navigation Bar
ReactDOM.render(<Navbar />, document.getElementById('nav'));

// Render Search Bar
ReactDOM.render(<Searchbar />, document.getElementById('search'));