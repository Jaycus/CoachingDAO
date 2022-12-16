// Searchbar Component
import React from 'react';

const Searchbar = () => {
  return (
    <div className="searchbar">
      <input type="text" placeholder="Search..." />
      <button type="submit">Search</button>
    </div>
  );
};

export default Searchbar;