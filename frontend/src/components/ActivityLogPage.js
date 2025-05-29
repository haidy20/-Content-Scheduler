// src/pages/ActivityLogPage.jsx
import React, { useEffect, useState } from 'react';
import API from '../api'; // افتراض API موجود

export default function ActivityLogPage() {
  const [logs, setLogs] = useState([]);

  useEffect(() => {
    API.get('/activity-logs')
      .then(res => setLogs(res.data.data))
      .catch(err => console.error(err));
  }, []);

  return (
    <div className="container my-4">
      <h3>📝 Activity Log</h3>
      <table className="table table-striped table-hover mt-3">
        <thead className="table-light">
          <tr>
            <th>Date & Time</th>
            <th>User</th>
            <th>Action</th>
            <th>Entity</th>
            <th>Changes</th>
          </tr>
        </thead>
        <tbody>
          {logs.length > 0 ? logs.map(log => (
            <tr key={log.id}>
              <td>{new Date(log.created_at).toLocaleString()}</td>
              <td>{log.user?.name || 'Unknown'}</td>
              <td>{log.action}</td>
              <td>{`Post #${log.entity_id}`}</td>
              <td>
                {log.changes ? (
                  <details>
                    <summary>View</summary>
                    <pre>{JSON.stringify(JSON.parse(log.changes), null, 2)}</pre>
                  </details>
                ) : '—'}
              </td>
            </tr>
          )) : (
            <tr><td colSpan="5" className="text-center">No activity logs found.</td></tr>
          )}
        </tbody>
      </table>
    </div>
  );
}
