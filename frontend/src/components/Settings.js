import React, { useState, useEffect } from 'react';
import API from '../api';  // تأكد من صحة المسار

const Settings = () => {
  const [platforms, setPlatforms] = useState([]);

  // جلب كل المنصات
  const fetchPlatforms = async () => {
    try {
      const response = await API.get('/platforms');
      setPlatforms(response.data.data);
    } catch (error) {
      console.error('Error fetching platforms:', error);
    }
  };

  useEffect(() => {
    fetchPlatforms();
  }, []);

  // تغيير حالة التفعيل لكل منصة
  const handleToggle = async (platformId) => {
    try {
      // ترسل فقط platform_id لتغيير الحالة
      const response = await API.post('/platforms/toggle', {
        platform_id: platformId
      });

      const updatedPlatform = response.data.data;

      setPlatforms(prev =>
        prev.map(p =>
          p.id === updatedPlatform.platform_id
            ? { ...p, is_active: updatedPlatform.is_active }
            : p
        )
      );
    } catch (error) {
      console.error('Error toggling platform:', error);
    }
  };

  return (
    <div className="container mt-4" style={{ maxWidth: '600px', margin: 'auto' }}>
      <div className="card shadow p-4">
        <h2 className="mb-4 text-center">⚙️ Manage Available Platforms</h2>

        <table className="table table-bordered text-center">
          <thead>
            <tr>
              <th>Platform</th>
              <th>Status</th>
              <th>Toggle</th>
            </tr>
          </thead>
          <tbody>
            {platforms.length === 0 ? (
              <tr><td colSpan="3">No platforms available.</td></tr>
            ) : (
              platforms.map(platform => (
                <tr key={platform.id}>
                  <td>{platform.name}</td>
                  <td>{platform.is_active ? '✅ Active' : '❌ Inactive'}</td>
                  <td>
                    <button
                      className={`btn ${platform.is_active ? 'btn-danger' : 'btn-success'}`}
                      onClick={() => handleToggle(platform.id)}
                    >
                      {platform.is_active ? 'Deactivate' : 'Activate'}
                    </button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Settings;
