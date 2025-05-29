import React, { useEffect, useState } from 'react';
import Calendar from 'react-calendar';
import 'react-calendar/dist/Calendar.css';
import API from '../api';
import 'bootstrap/dist/css/bootstrap.min.css';
import { useNavigate } from 'react-router-dom';

export default function Dashboard() {
  const [posts, setPosts] = useState([]);
  const [filteredPosts, setFilteredPosts] = useState([]);
  const [platforms, setPlatforms] = useState([]);
  const [selectedDate, setSelectedDate] = useState(null);
  const [selectedPlatform, setSelectedPlatform] = useState('');
  const [stats, setStats] = useState(null);
  const [editRowId, setEditRowId] = useState(null);
  const [editPostData, setEditPostData] = useState({});
  const [validationErrors, setValidationErrors] = useState({});

  const navigate = useNavigate();

  useEffect(() => {
    API.get('/posts')
      .then(res => {
        setPosts(res.data.data);
        setFilteredPosts(res.data.data);
      })
      .catch(err => console.error(err));

    API.get('/platforms')
      .then(res => setPlatforms(res.data.data))
      .catch(err => console.error(err));

    API.get('/dashboard/stats')
      .then(res => setStats(res.data.data))
      .catch(err => console.error(err));
  }, []);

  useEffect(() => {
    let filtered = posts;

    if (selectedDate) {
      const y = selectedDate.getFullYear();
      const m = selectedDate.getMonth();
      const d = selectedDate.getDate();
      // Filter for scheduled posts on the selected date
      filtered = filtered.filter(post => {
        const postDate = new Date(post.scheduled_time);
        return (
          post.status === 'scheduled' && // <-- Added this condition
          postDate.getFullYear() === y &&
          postDate.getMonth() === m &&
          postDate.getDate() === d
        );
      });
    }

    if (selectedPlatform) {
      filtered = filtered.filter(post =>
        post.platforms.some(p =>
          (typeof p === 'object' ? p.id : p) == selectedPlatform
        )
      );
    }

    setFilteredPosts(filtered);
  }, [selectedDate, selectedPlatform, posts]);

  const renderStatusIcon = (status) => {
    switch (status) {
      case 'published': return '✔️';
      case 'scheduled': return '🕒';
      case 'draft': return '❌';
      default: return '';
    }
  };

  const tileClassName = ({ date, view }) => {
    if (view === 'month') {
      const dayHasPost = posts.some(post => {
        const postDate = new Date(post.scheduled_time);
        return (
          post.status === 'scheduled' && // <-- Added this condition for calendar tile highlighting as well
          postDate.getFullYear() === date.getFullYear() &&
          postDate.getMonth() === date.getMonth() &&
          postDate.getDate() === date.getDate()
        );
      });
      return dayHasPost ? 'bg-primary text-white rounded' : null;
    }
  };

  const handleDelete = (id) => {
    API.delete(`/posts/${id}`)
      .then(() => {
        setPosts(prev => prev.filter(p => p.id !== id));
      })
      .catch(err => console.error(err));
  };


  const handleEdit = (post) => {
    setEditRowId(post.id);
    setEditPostData({
      title: post.title,
      status: post.status,
      scheduled_time: post.scheduled_time,
      platforms: post.platforms.map(p => (typeof p === 'object' ? p.id : p))
    });
    setValidationErrors({});
  };

  const handleCancelEdit = () => {
    setEditRowId(null);
    setEditPostData({});
    setValidationErrors({});
  };

  const handleUpdate = (id) => {
    let errors = {};

    const originalPost = posts.find(p => p.id === id);

    // Prevent modification of status or platforms if the post is already published
    if (originalPost.status === 'published') {
      if (
        originalPost.status !== editPostData.status ||
        JSON.stringify(originalPost.platforms.map(p => (typeof p === 'object' ? p.id : p)).sort()) !==
        JSON.stringify(editPostData.platforms.sort())
      ) {
        errors.status = 'Cannot modify a published post\'s status or platforms.';
        errors.platforms = 'Cannot modify a published post\'s platforms.';
      }
    }

    // Scheduled time validation
    if (editPostData.status === 'scheduled') {
      if (!editPostData.scheduled_time) {
        errors.scheduled_time = 'Please select a valid scheduled time.';
      } else {
        const selectedTime = new Date(editPostData.scheduled_time);
        const now = new Date();
        if (selectedTime < now) {
          errors.scheduled_time = 'Scheduled time cannot be in the past.';
        }
      }
    }

    if (Object.keys(errors).length > 0) {
      setValidationErrors(errors);
      return;
    }

    setValidationErrors({});

    API.put(`/posts/${id}`, editPostData)
      .then(res => {
        const updatedPost = res.data.data;
        setPosts(prev => prev.map(p => p.id === id ? updatedPost : p));
        setEditRowId(null);
        setEditPostData({});
      })
      .catch(err => console.error(err));
  };



  const handleEditChange = (field, value) => {
    setEditPostData(prev => ({ ...prev, [field]: value }));
    setValidationErrors(prevErrors => ({ ...prevErrors, [field]: undefined }));
  };

  return (
    <div className="container my-4">
      <div className="mb-4">
        <h2 className="fw-bold">📅 Dashboard - Calendar & Posts List</h2>
        <div className="d-flex justify-content-end gap-2 mb-3">
          <button className="btn btn-primary" onClick={() => navigate('/create-post')}>+ Create New Post</button>
          <button className="btn btn-secondary" onClick={() => navigate('/settings')}>⚙️ Settings</button>
          <button className="btn btn-info" onClick={() => navigate('/activity-log')}>📄 Activity Log</button>
        </div>

      </div>

      <div className="row">
        <div className="col-md-4 mb-4">
          <Calendar onChange={setSelectedDate} value={selectedDate} tileClassName={tileClassName} />
          <button className="btn btn-sm btn-outline-secondary mt-2" onClick={() => setSelectedDate(null)}>Clear Date Filter</button>
        </div>

        <div className="col-md-8">
          {stats && (
            <div className="mb-3 p-3 bg-light rounded shadow-sm">
              <h5 className="fw-bold mb-2">📊 Dashboard Stats</h5>
              <div className="row">
                <div className="col"><strong>Total Posts:</strong> {stats.total_posts}</div>
                <div className="col"><strong>Published:</strong> {stats.posts_by_status?.published || 0}</div>
                <div className="col"><strong>Scheduled:</strong> {stats.posts_by_status?.scheduled || 0}</div>
                <div className="col"><strong>Draft:</strong> {stats.posts_by_status?.draft || 0}</div>
              </div>
            </div>
          )}

          <div className="d-flex gap-3 mb-3">
            <select className="form-select" value={selectedPlatform} onChange={e => setSelectedPlatform(e.target.value)}>
              <option value="">All Platforms</option>
              {platforms.map(p => <option key={p.id} value={p.id}>{p.name}</option>)}
            </select>
            {selectedPlatform && (
              <button className="btn btn-outline-secondary" onClick={() => setSelectedPlatform('')}>Clear Platform Filter</button>
            )}
          </div>

          <table className="table table-striped">
            <thead>
              <tr>
                <th>Title</th>
                <th>Status</th>
                <th>Platforms</th>
                <th>Scheduled Time</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {filteredPosts.length > 0 ? filteredPosts.map(post => (
                <tr key={post.id}>
                  {editRowId === post.id ? (
                    <>
                      <td>
                        <input
                          type="text"
                          value={editPostData.title}
                          onChange={e => handleEditChange('title', e.target.value)}
                          className={validationErrors.title ? 'is-invalid' : ''}
                        />
                        {validationErrors.title && <div className="invalid-feedback">{validationErrors.title}</div>}
                      </td>
                      <td>
                        <select
                          value={editPostData.status}
                          onChange={e => handleEditChange('status', e.target.value)}
                          disabled={editPostData.status === 'published'}
                          className={validationErrors.status ? 'is-invalid' : ''}
                        >
                          <option value="draft">Draft</option>
                          <option value="scheduled">Scheduled</option>
                          <option value="published">Published</option>
                        </select>
                        {validationErrors.status && <div className="invalid-feedback">{validationErrors.status}</div>}
                      </td>
                      <td>
                        <select
                          multiple
                          value={editPostData.platforms}
                          onChange={e => handleEditChange('platforms', Array.from(e.target.selectedOptions, opt => opt.value))}
                          disabled={editPostData.status === 'published'}
                          className={validationErrors.platforms ? 'is-invalid' : ''}
                        >
                          {platforms.map(p => <option key={p.id} value={p.id}>{p.name}</option>)}
                        </select>
                        {validationErrors.platforms && <div className="invalid-feedback">{validationErrors.platforms}</div>}
                      </td>
                      <td>
                        {editPostData.status === 'scheduled' ? (
                          <>
                            <input
                              type="datetime-local"
                              value={new Date(editPostData.scheduled_time).toISOString().slice(0, 16)}
                              onChange={e => handleEditChange('scheduled_time', e.target.value)}
                              className={validationErrors.scheduled_time ? 'is-invalid' : ''}
                            />
                            {validationErrors.scheduled_time && <div className="invalid-feedback">{validationErrors.scheduled_time}</div>}
                          </>
                        ) : (
                          editPostData.status === 'published' ? (
                            <span>{new Date(editPostData.scheduled_time).toLocaleString()}</span>
                          ) : (
                            <span>Not applicable</span>
                          )
                        )}
                      </td>
                      <td className="d-flex align-items-center">
                        <button className="btn btn-success btn-sm me-2" onClick={() => handleUpdate(post.id)}>Update</button>
                        <button className="btn btn-secondary btn-sm" onClick={handleCancelEdit}>Cancel</button>
                      </td>

                    </>
                  ) : (
                    <>
                      <td>{post.title}</td>
                      <td>{renderStatusIcon(post.status)} {post.status}</td>
                      <td>{post.platforms.map(p => (typeof p === 'object' ? p.name : (() => { const plat = platforms.find(pl => pl.id === p); return plat ? plat.name : p; })())).join(', ')}</td>
                      <td>
                        {post.status === 'scheduled'
                          ? new Date(post.scheduled_time).toLocaleString()
                          : '-'}
                      </td>
                      <td>
                        <button className="btn btn-sm btn-primary me-2" onClick={() => handleEdit(post)}>Edit</button>
                        <button className="btn btn-sm btn-danger" onClick={() => handleDelete(post.id)}>Delete</button>
                      </td>
                    </>
                  )}
                </tr>
              )) : (
                <tr><td colSpan="5" className="text-center">No posts found.</td></tr>
              )}
            </tbody>
          </table>
        </div>
      </div>

      <style>{`
        .react-calendar { width: 300px !important; font-size: 0.8rem; }
      `}</style>
    </div>
  );
}