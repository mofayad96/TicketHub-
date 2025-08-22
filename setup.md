# EventX Studio - Setup Guide

## Quick Start

### 1. Create Environment Files

**Backend (.env file in backend folder):**
```env
PORT=4000
MONGO_URI=mongodb://127.0.0.1:27017/eventx
JWT_SECRET=change_me_to_a_secure_secret_key
CLIENT_URL=http://localhost:5173
```

**Frontend (.env file in frontend folder):**
```env
VITE_API_URL=http://localhost:4000/api
```

### 2. Start MongoDB

**Option A: Docker (Recommended)**
```bash
docker-compose up -d
```

**Option B: Local MongoDB**
- Install MongoDB Community Edition
- Start MongoDB service
- Create database: `eventx`

**Option C: MongoDB Atlas (Cloud)**
- Create free account at https://www.mongodb.com/atlas
- Create cluster and get connection string
- Update MONGO_URI in backend .env

### 3. Start Backend**
```bash
cd backend
npm install
npm run dev
```

### 4. Start Frontend**
```bash
cd frontend
npm install
npm run dev
```

### 5. Access the Application**
- Frontend: http://localhost:5173
- Backend API: http://localhost:4000
- MongoDB Express (if using Docker): http://localhost:8081

## Default Admin Account
- Email: admin@eventx.test
- Password: Admin123!

## Features
- ✅ User authentication (login/register)
- ✅ Event creation and management (admin)
- ✅ Event browsing and search
- ✅ Ticket booking system
- ✅ QR code generation for tickets
- ✅ Role-based access control
- ✅ Responsive UI with Tailwind CSS

## Project Structure
```
├── backend/          # Express.js API
│   ├── src/
│   │   ├── models/   # MongoDB schemas
│   │   ├── routes/   # API endpoints
│   │   ├── middleware/ # Auth middleware
│   │   └── server.js # Main server file
├── frontend/         # React app
│   ├── src/
│   │   ├── pages/    # React components
│   │   ├── store/    # Zustand state management
│   │   └── styles.css
└── docker-compose.yml # MongoDB services
```

## Troubleshooting

### MongoDB Connection Issues
- Ensure MongoDB is running on port 27017
- Check if .env file exists and has correct MONGO_URI
- Verify Docker is running if using docker-compose

### Port Conflicts
- Backend default: 4000
- Frontend default: 5173
- MongoDB: 27017
- MongoDB Express: 8081

### Authentication Issues
- Check JWT_SECRET in backend .env
- Ensure cookies are enabled in browser
- Verify CORS settings match frontend URL
