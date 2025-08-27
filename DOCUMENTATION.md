# 📚 TicketHub - Complete Project Documentation

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture & Technology Stack](#architecture--technology-stack)
3. [Installation & Setup](#installation--setup)
4. [Development Guide](#development-guide)
5. [API Documentation](#api-documentation)
6. [Database Schema](#database-schema)
7. [User Workflows](#user-workflows)
8. [Deployment Guide](#deployment-guide)
9. [Security & Best Practices](#security--best-practices)
10. [Troubleshooting](#troubleshooting)
11. [Contributing Guidelines](#contributing-guidelines)

---

## 🎯 Project Overview

**TicketHub** is a modern, full-stack event management platform that enables event organizers to create, manage, and sell tickets for events while providing attendees with a seamless booking experience.

### ✨ Key Features

- 🎨 **Modern UI/UX** - Beautiful, responsive design with smooth animations
- 🔐 **User Authentication** - Secure login/register system with JWT
- 👥 **Role-Based Access** - Admin and user roles with different permissions
- 🎭 **Event Management** - Create, edit, and manage events (Admin)
- 🔍 **Event Discovery** - Browse and search events with filters
- 🎟️ **Ticket Booking** - Book seats with real-time availability
- 📱 **QR Code Generation** - Unique QR codes for each ticket
- 💳 **Payment Integration** - Track ticket prices and revenue
- 📊 **Admin Dashboard** - Statistics and event management tools
- 📱 **Mobile Responsive** - Optimized for all devices

### 🎯 Target Users

- **Event Organizers** - Create and manage events, track sales
- **Event Attendees** - Discover and book tickets for events
- **Administrators** - Oversee platform operations and user management

---

## 🏗️ Architecture & Technology Stack

### Frontend Architecture
```
Frontend (React + Vite)
├── React 18 - Modern React with hooks
├── Vite - Fast build tool and dev server
├── React Router DOM - Client-side routing
├── Zustand - Lightweight state management
├── Axios - HTTP client for API calls
├── Tailwind CSS - Utility-first CSS framework
└── Responsive Design - Mobile-first approach
```

### Backend Architecture
```
Backend (Node.js + Express)
├── Node.js - JavaScript runtime
├── Express.js - Web application framework
├── MongoDB - NoSQL database
├── Mongoose - MongoDB object modeling
├── JWT - JSON Web Token authentication
├── bcryptjs - Password hashing
├── qrcode - QR code generation
└── CORS - Cross-origin resource sharing
```

### Project Structure
```
TicketHub/
├── frontend/                 # React frontend application
│   ├── src/
│   │   ├── components/      # Reusable UI components
│   │   ├── pages/          # Page components
│   │   ├── store/          # Zustand state management
│   │   ├── styles.css      # Global styles and CSS variables
│   │   └── main.jsx        # Application entry point
│   ├── package.json
│   └── tailwind.config.js  # Tailwind CSS configuration
├── backend/                 # Node.js backend API
│   ├── src/
│   │   ├── models/         # Mongoose data models
│   │   ├── routes/         # API route handlers
│   │   ├── middleware/     # Authentication middleware
│   │   └── server.js       # Express server setup
│   ├── package.json
│   └── .env                # Environment variables
├── docker-compose.yml       # MongoDB and Mongo Express
├── start.bat               # Windows startup script
├── start.ps1               # PowerShell startup script
└── README.md               # Project overview
```

---

## 🚀 Installation & Setup

### Prerequisites

- **Node.js** (v16 or higher)
- **MongoDB** (local or cloud)
- **Docker** (optional, for MongoDB)
- **Git** (for version control)

### Quick Start

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd TicketHub
   ```

2. **Install dependencies**
   ```bash
   # Install backend dependencies
   cd backend
   npm install
   
   # Install frontend dependencies
   cd ../frontend
   npm install
   ```

3. **Environment Setup**
   
   Create `.env` files in both `backend/` and `frontend/` directories:
   
   **Backend (.env):**
   ```env
   PORT=4000
   MONGO_URI=mongodb://127.0.0.1:27017/tickethub
   JWT_SECRET=your_jwt_secret_key_here
   CLIENT_URL=http://localhost:5173
   ```
   
   **Frontend (.env):**
   ```env
   VITE_API_URL=http://localhost:4000/api
   ```

4. **Start MongoDB**
   ```bash
   # Using Docker (recommended)
   docker-compose up -d
   
   # Or start MongoDB service manually
   ```

5. **Start the application**
   ```bash
   # Start backend (from backend directory)
   npm run dev
   
   # Start frontend (from frontend directory)
   npm run dev
   ```

6. **Access the application**
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:4000
   - MongoDB Express: http://localhost:8081

### Default Admin Account

For testing purposes, a default admin account is created:
- **Email**: admin@tickethub.test
- **Password**: Admin123!
- **Role**: Administrator

---

## 💻 Development Guide

### Development Scripts

**Backend Scripts:**
```bash
npm run dev    # Start development server with nodemon
npm start      # Start production server
```

**Frontend Scripts:**
```bash
npm run dev    # Start development server
npm run build  # Build for production
npm run preview # Preview production build
```

### Code Style Guidelines

- **JavaScript/React**: Use ES6+ features, functional components with hooks
- **CSS**: Use Tailwind CSS utility classes, custom CSS for complex components
- **File Naming**: Use kebab-case for files, PascalCase for components
- **Comments**: Add JSDoc comments for functions and components

### State Management

The application uses **Zustand** for state management:

```javascript
// Example store structure
const useAuthStore = create((set) => ({
  user: null,
  isAuthenticated: false,
  login: (userData) => set({ user: userData, isAuthenticated: true }),
  logout: () => set({ user: null, isAuthenticated: false }),
}));
```

### API Integration

All API calls are made using **Axios** with centralized configuration:

```javascript
// API base configuration
const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
  withCredentials: true,
});
```

---

## 🔌 API Documentation

### Authentication Endpoints

#### Register User
```http
POST /api/auth/register
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "SecurePass123!",
  "role": "user"
}
```

#### Login User
```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "SecurePass123!"
}
```

#### Get Current User
```http
GET /api/auth/me
Authorization: Bearer <jwt_token>
```

#### Logout User
```http
POST /api/auth/logout
Authorization: Bearer <jwt_token>
```

### Event Endpoints

#### Get All Events
```http
GET /api/events
```

#### Get Event by ID
```http
GET /api/events/:id
```

#### Create Event (Admin Only)
```http
POST /api/events
Authorization: Bearer <jwt_token>
Content-Type: application/json

{
  "title": "Tech Conference 2025",
  "description": "Annual technology conference",
  "date": "2025-03-15",
  "time": "09:00",
  "venue": "Convention Center",
  "price": 99.00,
  "totalSeats": 200,
  "category": "Technology"
}
```

#### Update Event (Admin Only)
```http
PUT /api/events/:id
Authorization: Bearer <jwt_token>
Content-Type: application/json

{
  "title": "Updated Event Title",
  "price": 149.00
}
```

#### Delete Event (Admin Only)
```http
DELETE /api/events/:id
Authorization: Bearer <jwt_token>
```

### Ticket Endpoints

#### Book Ticket
```http
POST /api/tickets/book/:eventId
Authorization: Bearer <jwt_token>
Content-Type: application/json

{
  "quantity": 2
}
```

#### Get User's Tickets
```http
GET /api/tickets/mine
Authorization: Bearer <jwt_token>
```

#### Check-in Ticket
```http
POST /api/tickets/checkin/:ticketId
Authorization: Bearer <jwt_token>
```

### Response Formats

#### Success Response
```json
{
  "success": true,
  "data": {
    // Response data
  },
  "message": "Operation successful"
}
```

#### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "statusCode": 400
}
```

---

## 🗄️ Database Schema

### User Model
```javascript
{
  _id: ObjectId,
  name: String (required),
  email: String (required, unique),
  password: String (required, hashed),
  role: String (enum: ['user', 'admin'], default: 'user'),
  createdAt: Date (default: Date.now),
  updatedAt: Date (default: Date.now)
}
```

### Event Model
```javascript
{
  _id: ObjectId,
  title: String (required),
  description: String (required),
  date: Date (required),
  time: String (required),
  venue: String (required),
  price: Number (required),
  totalSeats: Number (required),
  availableSeats: Number (required),
  category: String (required),
  status: String (enum: ['upcoming', 'ongoing', 'completed'], default: 'upcoming'),
  createdBy: ObjectId (ref: 'User'),
  createdAt: Date (default: Date.now),
  updatedAt: Date (default: Date.now)
}
```

### Ticket Model
```javascript
{
  _id: ObjectId,
  eventId: ObjectId (ref: 'Event', required),
  userId: ObjectId (ref: 'User', required),
  ticketNumber: String (required, unique),
  qrCode: String (required),
  status: String (enum: ['active', 'used', 'cancelled'], default: 'active'),
  price: Number (required),
  bookedAt: Date (default: Date.now),
  usedAt: Date
}
```

---

## 👥 User Workflows

### Admin Workflow

#### 1. Initial Setup & Login
1. Access the application
2. Login with admin credentials
3. Access admin dashboard

#### 2. Event Management
1. Create new events with details
2. Edit existing events
3. Delete events if needed
4. Monitor event statistics

#### 3. User Management
1. View all registered users
2. Monitor user activity
3. Track booking patterns

### User Workflow

#### 1. Account Creation & Access
1. Register new account
2. Login with credentials
3. Access user dashboard

#### 2. Event Discovery & Booking
1. Browse available events
2. Search and filter events
3. View event details
4. Book tickets
5. Receive QR codes

#### 3. Ticket Management
1. View booked tickets
2. Download QR codes
3. Check ticket status

---

## 🚀 Deployment Guide

### Production Deployment Overview

- **Frontend**: Vercel (React)
- **Backend**: Render (Node.js/Express)
- **Database**: MongoDB Atlas (Cloud)

### Step-by-Step Deployment

#### 1. MongoDB Atlas Setup
1. Create MongoDB Atlas account
2. Configure database access
3. Set up network access
4. Get connection string

#### 2. Backend Deployment (Render)
1. Prepare backend for production
2. Deploy to Render
3. Set environment variables
4. Test deployment

#### 3. Frontend Deployment (Vercel)
1. Prepare frontend for production
2. Deploy to Vercel
3. Configure environment variables
4. Test application

### Environment Variables

**Production Backend:**
```env
NODE_ENV=production
PORT=10000
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/database
JWT_SECRET=your_super_secure_jwt_secret_here
CLIENT_URL=https://your-frontend-domain.vercel.app
```

**Production Frontend:**
```env
VITE_API_URL=https://your-backend-url.onrender.com/api
```

---

## 🔒 Security & Best Practices

### Security Measures

1. **JWT Authentication** - Secure token-based authentication
2. **Password Hashing** - bcryptjs for password security
3. **CORS Configuration** - Proper cross-origin resource sharing
4. **Input Validation** - Server-side validation for all inputs
5. **Environment Variables** - Secure configuration management

### Best Practices

1. **Code Organization** - Modular structure with clear separation
2. **Error Handling** - Comprehensive error handling and logging
3. **API Design** - RESTful API design principles
4. **Database Design** - Proper indexing and relationships
5. **Performance** - Optimized queries and caching strategies

### Security Checklist

- [ ] JWT tokens are properly configured
- [ ] Passwords are hashed using bcryptjs
- [ ] CORS is properly configured
- [ ] Environment variables are secured
- [ ] Input validation is implemented
- [ ] Error messages don't expose sensitive information
- [ ] Database connections are secure
- [ ] API endpoints are properly protected

---

## 🛠️ Troubleshooting

### Common Issues

#### Backend Issues

**MongoDB Connection Error**
```
Error: connect ECONNREFUSED 127.0.0.1:27017
```
**Solution**: Ensure MongoDB is running and connection string is correct

**JWT Token Error**
```
Error: jwt malformed
```
**Solution**: Check JWT secret configuration and token format

**CORS Error**
```
Access to fetch at 'http://localhost:4000/api/events' from origin 'http://localhost:5173' has been blocked by CORS policy
```
**Solution**: Verify CORS configuration in backend

#### Frontend Issues

**API Connection Error**
```
Error: Network Error
```
**Solution**: Check API URL configuration and backend status

**Build Error**
```
Error: Cannot find module 'react'
```
**Solution**: Run `npm install` in frontend directory

### Debug Steps

1. **Check Console Logs** - Review browser and server console for errors
2. **Verify Environment Variables** - Ensure all required variables are set
3. **Test API Endpoints** - Use Postman or similar tool to test API
4. **Check Database Connection** - Verify MongoDB is accessible
5. **Review Network Tab** - Check for failed requests in browser

### Performance Optimization

1. **Database Indexing** - Add indexes for frequently queried fields
2. **API Caching** - Implement caching for static data
3. **Image Optimization** - Compress and optimize images
4. **Code Splitting** - Implement lazy loading for components
5. **Bundle Optimization** - Minimize bundle size

---

## 🤝 Contributing Guidelines

### Development Setup

1. **Fork the repository**
2. **Create feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make changes** following coding standards
4. **Test thoroughly** - Ensure all functionality works
5. **Commit changes** with descriptive messages
6. **Push to branch** and create pull request

### Code Standards

- **JavaScript**: Use ES6+ features, consistent formatting
- **React**: Functional components with hooks, proper prop types
- **CSS**: Tailwind CSS utilities, consistent naming
- **Git**: Descriptive commit messages, clean history

### Pull Request Process

1. **Update documentation** if needed
2. **Add tests** for new features
3. **Ensure all tests pass**
4. **Update README** if adding new features
5. **Request review** from maintainers

### Issue Reporting

When reporting issues, include:
- **Description** of the problem
- **Steps to reproduce**
- **Expected vs actual behavior**
- **Environment details** (OS, browser, Node version)
- **Screenshots** if applicable

---

## 📞 Support & Resources

### Documentation Links

- [README.md](./README.md) - Project overview
- [DEPLOYMENT-GUIDE.md](./DEPLOYMENT-GUIDE.md) - Detailed deployment instructions
- [USER-WORKFLOW-GUIDE.md](./USER-WORKFLOW-GUIDE.md) - User experience guide
- [SECURITY.md](./SECURITY.md) - Security documentation
- [MONGODB-SETUP.md](./MONGODB-SETUP.md) - Database setup guide
- [MONGODB-ATLAS-SETUP.md](./MONGODB-ATLAS-SETUP.md) - Cloud database setup

### External Resources

- [React Documentation](https://react.dev/)
- [Node.js Documentation](https://nodejs.org/docs/)
- [MongoDB Documentation](https://docs.mongodb.com/)
- [Express.js Documentation](https://expressjs.com/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)

### Community Support

- **GitHub Issues** - Report bugs and request features
- **Discussions** - Ask questions and share ideas
- **Wiki** - Community-maintained documentation

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Inter Font** - Beautiful typography from Google Fonts
- **Heroicons** - Beautiful SVG icons
- **Tailwind CSS** - Utility-first CSS framework
- **React Community** - Amazing React ecosystem
- **Node.js Community** - Robust backend ecosystem

---

**Built with ❤️ using modern web technologies**

*Last updated: December 2024*
