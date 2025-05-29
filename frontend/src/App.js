import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import Login from './components/Login';
import Dashboard from './components/Dashboard';
import PostEditor from './components/PostEditor';
import Settings from './components/Settings';
import ActivityLogPage from './components/ActivityLogPage';


function App() {
  const [loggedIn, setLoggedIn] = useState(!!localStorage.getItem('token'));

  const handleLogin = () => setLoggedIn(true);
  const handleLogout = () => {
    localStorage.removeItem('token');
    setLoggedIn(false);
  };

  return (
    <Router>
      {loggedIn ? (
        <>
          {/* زر Logout في الأعلى على اليمين */}
          <div style={{
            display: 'flex',
            justifyContent: 'flex-end',
            padding: '10px 20px',
            backgroundColor: '#f8f9fa', // خلفية فاتحة (اختياري)
            borderBottom: '1px solid #ddd' // خط تحت (اختياري)
          }}>
            <button
              onClick={handleLogout}
              className="btn btn-outline-danger btn-sm"
            >
              Logout
            </button>
          </div>

          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/create-post" element={<PostEditor />} />
            <Route path="/settings" element={<Settings />} />
            <Route path="/activity-log" element={<ActivityLogPage />} />

          </Routes>
        </>
      ) : (
        <Routes>
          <Route path="*" element={<Login onLogin={handleLogin} />} />
        </Routes>
      )}
    </Router>
  );
}

export default App;
