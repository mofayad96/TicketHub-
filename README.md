# 🎫 TicketHub - Modern Event Management Platform

A beautiful, full-stack event management application built with React, Node.js, and MongoDB. TicketHub provides a seamless experience for event organizers and attendees to create, discover, and book events.

## ✨ **Features**

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

## 🚀 **Quick Start**

### Prerequisites
- Node.js (v16 or higher)
- MongoDB (local or cloud)
- Docker (optional, for MongoDB)

### Installation

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

## 🎨 **Design Features**

### **Modern Logo & Branding**
- **TicketHub Logo**: Beautiful gradient logo with ticket icon
- **Color Scheme**: Blue, purple, and pink gradients
- **Typography**: Inter font for modern readability
- **Glass Effects**: Beautiful backdrop blur and transparency

### **UI Components**
- **Responsive Cards**: Modern event and ticket cards
- **Gradient Headers**: Beautiful color transitions
- **Smooth Animations**: Hover effects and transitions
- **Status Badges**: Color-coded event and ticket status
- **Interactive Forms**: Modern input fields with focus states

## 🏗️ **Project Structure**

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
└── README.md               # This file
```

## 🔧 **API Endpoints**

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `GET /api/auth/me` - Get current user

### Events
- `GET /api/events` - List all events
- `GET /api/events/:id` - Get event details
- `POST /api/events` - Create new event (Admin)
- `PUT /api/events/:id` - Update event (Admin)
- `DELETE /api/events/:id` - Delete event (Admin)

### Tickets
- `POST /api/tickets/book/:eventId` - Book a ticket
- `GET /api/tickets/mine` - Get user's tickets
- `POST /api/tickets/checkin/:ticketId` - Check in ticket

## 🎯 **Default Admin Account**

For testing purposes, a default admin account is created:
- **Email**: admin@tickethub.test
- **Password**: Admin123!
- **Role**: Administrator

## 🛠️ **Technologies Used**

### Frontend
- **React 18** - Modern React with hooks
- **Vite** - Fast build tool and dev server
- **React Router DOM** - Client-side routing
- **Zustand** - Lightweight state management
- **Axios** - HTTP client for API calls
- **Tailwind CSS** - Utility-first CSS framework

### Backend
- **Node.js** - JavaScript runtime
- **Express.js** - Web application framework
- **MongoDB** - NoSQL database
- **Mongoose** - MongoDB object modeling
- **JWT** - JSON Web Token authentication
- **bcryptjs** - Password hashing
- **qrcode** - QR code generation

### Development
- **Nodemon** - Auto-restart server during development
- **CORS** - Cross-origin resource sharing
- **Morgan** - HTTP request logger
- **Cookie-parser** - Cookie parsing middleware

## 📱 **Responsive Design**

TicketHub is built with a mobile-first approach:
- **Mobile**: Optimized for small screens
- **Tablet**: Responsive grid layouts
- **Desktop**: Full-featured interface
- **Touch Friendly**: Mobile-optimized interactions

## 🚀 **Deployment**

### Frontend Deployment
```bash
cd frontend
npm run build
# Deploy the dist/ folder to your hosting service
```

### Backend Deployment
```bash
cd backend
npm start
# Use PM2 or similar for production
```

### Environment Variables
Update your production environment variables:
- `MONGO_URI` - Production MongoDB connection string
- `JWT_SECRET` - Strong, unique secret key
- `CLIENT_URL` - Production frontend URL

## 🤝 **Contributing**

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 **License**

This project is licensed under the MIT License.

## 🆘 **Support**

If you encounter any issues:
1. Check the console logs for error messages
2. Verify MongoDB is running and accessible
3. Ensure all environment variables are set correctly
4. Check that all dependencies are installed

## 🎉 **Acknowledgments**

- **Inter Font** - Beautiful typography from Google Fonts
- **Heroicons** - Beautiful SVG icons
- **Tailwind CSS** - Utility-first CSS framework
- **React Community** - Amazing React ecosystem

---

**Built with ❤️ using modern web technologies**




