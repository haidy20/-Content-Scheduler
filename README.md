
# 📝 GetInPay Company Task

A Laravel + React-based platform for scheduling and managing social media posts across multiple platforms like Twitter, Instagram, LinkedIn, etc.

## 🚀 Key Features

- **User Authentication**:  
  Secure login, registration, and profile management using Laravel Sanctum.

- **Post Management**:  
  - Create, update, and delete posts with platform selection.
  - Schedule posts for future publication.
  - Filter posts by status (draft, scheduled, published) and date.
  - Character counter and platform-specific validation (e.g., character limits).

- **Platform Management**:  
  - List available platforms.
  - Toggle active platforms for each user.

- **Post Scheduling Engine**:  
  - Laravel process due posts using Command.
  - Mock post publishing process for testing purposes using logs.

- **Dashboard**:  
  - Calendar view of scheduled posts using **React Calendar**.
  - List view with filtering options and status indicators.

- **Creative Challenges**:
  - 📈 **Post Analytics**: View posts per platform, scheduled, draft and published counts.
  - 🚦 **Rate Limiting**: Limit to max 10 scheduled posts per user per day.
  - 📝 **Activity Logging**: Track and display user actions for accountability.

## 🛠️ Tech Stack
- **Backend**: Laravel (Sanctum, Eloquent, Queues)
- **Frontend**: React (React Router, Axios, React Calendar)
- **Database**: MySQL
- **Authentication**: Laravel Sanctum
- **Styling**: Bootstrap

## 📂 How to Run the Project

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/getinpay-company-task.git
cd getinpay-company-task
```

### 2️⃣ Backend Setup (Laravel)
```bash
cd content_scheduler
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate  # Migration files are located in the `database` folder
php artisan db:seed  # optional: seed data
php artisan serve
```

### 3️⃣ Frontend Setup (React)
```bash
cd frontend
npm install
npm start
```

### 4️⃣ Queue Worker (for scheduled posts)
```bash
php artisan queue:work
```

## 🚦 Future Improvements
- Implement real-time notifications for post status.
---

© 2025 Haidy. All rights reserved.
