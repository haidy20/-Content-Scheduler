import axios from 'axios';

const API = axios.create({
  baseURL: 'http://localhost:8000/api',  // عدل لو سيرفرك في مكان تاني
    headers: {
    'Content-Type': 'application/json',
  },
});

// إضافة الـ token لو موجود
API.interceptors.request.use(config => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default API;
