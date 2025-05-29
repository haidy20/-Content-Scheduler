import React, { useState, useEffect } from 'react'; 
import { useNavigate } from 'react-router-dom';  
import API from '../api';
import 'bootstrap/dist/css/bootstrap.min.css';

const getMinDateTime = () => {
  const now = new Date();
  now.setSeconds(0, 0);
  return now.toISOString().slice(0, 16);
};

export default function PostEditor() {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [platforms, setPlatforms] = useState([]);
  const [selectedPlatforms, setSelectedPlatforms] = useState([]);
  const [image, setImage] = useState(null);
  const [scheduledTime, setScheduledTime] = useState('');
  const [status, setStatus] = useState('draft');
  const [contentError, setContentError] = useState(null);
  const [submitError, setSubmitError] = useState(null);  // <-- هنا رسالة الخطأ العامة (مثلاً تجاوز حد المجدولة)

  const navigate = useNavigate();

  const fetchScheduledPostsCount = async () => {
    try {
      const response = await API.get('/posts/scheduled-count');
      return response.data.count;
    } catch (error) {
      console.error('Error fetching scheduled posts count', error);
      return 0;
    }
  };

  const platformLimits = {
    twitter: 5,
    linkedin: 5,
  };

  useEffect(() => {
    API.get('/platforms').then(res => {
      const activePlatforms = res.data.data.filter(p => p.is_active);
      setPlatforms(activePlatforms);
    });
  }, []);

  useEffect(() => {
    if (status !== 'scheduled') {
      setScheduledTime('');
    }
    setSubmitError(null);  // مسح الخطأ لما تغير الحالة
  }, [status]);

  useEffect(() => {
    const errors = [];

    for (const platform of platforms) {
      if (selectedPlatforms.includes(platform.id)) {
        const platformName = platform.name.toLowerCase();
        const limit = platformLimits[platformName];

        if (limit && content.length > limit) {
          errors.push(`❌ Content exceeds limit for ${platform.name}: max ${limit} characters allowed.`);
        }
      }
    }

    setContentError(errors.length > 0 ? errors.join('\n') : null);
    setSubmitError(null);  // مسح الخطأ العام لما المحتوى يتغير
  }, [content, selectedPlatforms, platforms]);

  const handleContentChange = (e) => {
    setContent(e.target.value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    setSubmitError(null);  // مسح رسالة الخطأ قبل أي تحقق

    if (contentError) return;

    if (status === 'scheduled') {
      const scheduledCount = await fetchScheduledPostsCount();
      if (scheduledCount >= 10) {
        setSubmitError('❌ You have reached the limit of 10 scheduled posts for today.');
        return;
      }
    }

    const formData = new FormData();
    formData.append('title', title);
    formData.append('content', content);
    formData.append('status', status);
    if (status === 'scheduled') {
      formData.append('scheduled_time', scheduledTime);
    }
    if (image) formData.append('image', image);
    selectedPlatforms.forEach(id => formData.append('platforms[]', id));

    try {
      await API.post('/posts', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      navigate('/');
    } catch (err) {
      console.error(err);
      setSubmitError('❌ Error creating post: ' + (err.response?.data?.message || err.message));
    }
  };

  return (
    <div className="container mt-3">
      <div className="card shadow p-4 bg-light rounded">
        <h3 className="mb-4 text-center">📝 Create New Post</h3>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <input
              type="text"
              className="form-control"
              placeholder="Enter Title"
              value={title}
              onChange={e => setTitle(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <textarea
              className={`form-control ${contentError ? 'is-invalid' : ''}`}
              placeholder="Write your content..."
              rows="4"
              value={content}
              onChange={handleContentChange}
              required
            ></textarea>
            <div className="mb-1 text-end text-muted">
              Characters: {content.length}
            </div>
            {contentError && (
              <div className="invalid-feedback d-block">
                {contentError}
              </div>
            )}
          </div>
          <div className="mb-3">
            <label className="form-label">📷 Upload Image</label>
            <input
              type="file"
              className="form-control"
              onChange={e => setImage(e.target.files[0])}
            />
          </div>

          {status === 'scheduled' && (
            <div className="mb-3">
              <label className="form-label">📅 Schedule Time</label>
              <input
                type="datetime-local"
                className="form-control"
                value={scheduledTime}
                onChange={e => setScheduledTime(e.target.value)}
                min={getMinDateTime()}
                required
              />
            </div>
          )}

          <div className="mb-3">
            <label className="form-label">📢 Select Platforms</label>
            <div className="d-flex flex-wrap gap-2">
              {platforms.map(p => (
                <div key={p.id} className="form-check me-3">
                  <input
                    type="checkbox"
                    className="form-check-input"
                    value={p.id}
                    id={`platform-${p.id}`}
                    checked={selectedPlatforms.includes(p.id)}
                    onChange={e => {
                      setSelectedPlatforms(e.target.checked
                        ? [...selectedPlatforms, p.id]
                        : selectedPlatforms.filter(id => id !== p.id)
                      );
                      setSubmitError(null);  // مسح الخطأ لو غيرت المنصات
                    }}
                  />
                  <label className="form-check-label" htmlFor={`platform-${p.id}`}>
                    {p.name}
                  </label>
                </div>
              ))}
            </div>
          </div>

          <div className="mb-3">
            <label className="form-label">📝 Select Status</label>
            <select
              className="form-select"
              value={status}
              onChange={e => setStatus(e.target.value)}
              required
            >
              <option value="draft">Draft</option>
              <option value="scheduled">Scheduled</option>
              <option value="published">Published</option>
            </select>
          </div>

          {submitError && (
            <div className="alert alert-danger" role="alert">
              {submitError}
            </div>
          )}

          <button type="submit" className="btn btn-primary w-100" disabled={!!contentError}>
            Create Post
          </button>
        </form>
      </div>
    </div>
  );
}
