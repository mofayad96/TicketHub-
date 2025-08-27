# ⚡ TicketHub - Quick Start Guide

## 🚀 Get Started in 5 Minutes

This guide will get you up and running with TicketHub in just a few minutes.

### 📋 Prerequisites

- **Node.js** (v16 or higher) - [Download here](https://nodejs.org/)
- **Git** - [Download here](https://git-scm.com/)
- **Docker** (optional) - [Download here](https://www.docker.com/)

### 🎯 Quick Setup

#### 1. Clone & Install
```bash
# Clone the repository
git clone <repository-url>
cd TicketHub

# Install backend dependencies
cd backend
npm install

# Install frontend dependencies
cd ../frontend
npm install
```

#### 2. Environment Setup
Create `.env` files in both directories:

**Backend (.env):**
```env
PORT=4000
MONGO_URI=mongodb://127.0.0.1:27017/tickethub
JWT_SECRET=your_secret_key_here
CLIENT_URL=http://localhost:5173
```

**Frontend (.env):**
```env
VITE_API_URL=http://localhost:4000/api
```

#### 3. Start MongoDB
```bash
# Using Docker (recommended)
docker-compose up -d

# Or start MongoDB manually
```

#### 4. Start the Application
```bash
# Terminal 1 - Start Backend
cd backend
npm run dev

# Terminal 2 - Start Frontend
cd frontend
npm run dev
```

#### 5. Access the Application
- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:4000
- **MongoDB Express**: http://localhost:8081

### 🔑 Default Login

**Admin Account:**
- Email: `admin@tickethub.test`
- Password: `Admin123!`

### 🎯 What's Next?

1. **Explore the UI** - Navigate through the application
2. **Create Events** - Use admin account to create test events
3. **Book Tickets** - Register a user account and book tickets
4. **Check Documentation** - Read [DOCUMENTATION.md](./DOCUMENTATION.md) for detailed information

### 🛠️ Development Scripts

**Backend:**
```bash
npm run dev    # Development server with auto-reload
npm start      # Production server
```

**Frontend:**
```bash
npm run dev    # Development server
npm run build  # Production build
npm run preview # Preview production build
```

### 🔧 Troubleshooting

**Common Issues:**

1. **MongoDB Connection Error**
   - Ensure MongoDB is running
   - Check connection string in `.env`

2. **Port Already in Use**
   - Change PORT in backend `.env`
   - Update frontend API URL accordingly

3. **Module Not Found**
   - Run `npm install` in respective directories
   - Clear `node_modules` and reinstall if needed

### 📚 Additional Resources

- [Complete Documentation](./DOCUMENTATION.md)
- [Deployment Guide](./DEPLOYMENT-GUIDE.md)
- [User Workflow Guide](./USER-WORKFLOW-GUIDE.md)
- [Security Documentation](./SECURITY.md)

---

**Need Help?** Check the [Troubleshooting](./DOCUMENTATION.md#troubleshooting) section in the full documentation.
