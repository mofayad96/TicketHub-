# MongoDB Setup Guide for EventX Studio

## 🚨 **Current Status**
Your EventX Studio is running but needs MongoDB to function properly.

## 🔧 **Setup Options**

### Option 1: Docker (Recommended)
```bash
# Install Docker Desktop from https://www.docker.com/products/docker-desktop/
# Start Docker Desktop
docker-compose up -d
```

### Option 2: Local MongoDB Installation
1. **Download MongoDB Community Server**
   - Go to: https://www.mongodb.com/try/download/community
   - Download Windows version
   - Install with default settings

2. **Start MongoDB Service**
   ```bash
   # Open Services (services.msc)
   # Find "MongoDB" service and start it
   # Or run as administrator:
   net start MongoDB
   ```

3. **Create Database**
   ```bash
   # Connect to MongoDB
   mongosh
   # Create database
   use eventx
   # Exit
   exit
   ```

### Option 3: MongoDB Atlas (Cloud - Free)
1. **Create Account**
   - Go to: https://www.mongodb.com/atlas
   - Sign up for free account

2. **Create Cluster**
   - Create free cluster
   - Get connection string

3. **Update Backend .env**
   ```env
   MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/eventx
   ```

## 🧪 **Test MongoDB Connection**

### Check if MongoDB is running:
```bash
# Check if port 27017 is open
netstat -an | findstr :27017

# Test connection
mongosh mongodb://127.0.0.1:27017/eventx
```

### Test Backend API:
```bash
curl http://localhost:4000/api/events
```

## 🚀 **Quick Fix for Testing**

If you want to test the frontend without MongoDB:

1. **Comment out MongoDB connection in backend/src/server.js**
2. **Add mock data endpoints**
3. **Test UI functionality**

## 📱 **Access Your App**

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:4000
- **MongoDB Express** (if using Docker): http://localhost:8081

## 🔍 **Troubleshooting**

### Docker Issues:
- Ensure Docker Desktop is running
- Check Docker service status
- Restart Docker Desktop

### MongoDB Connection Errors:
- Verify MongoDB is running on port 27017
- Check firewall settings
- Ensure .env file has correct MONGO_URI

### Port Conflicts:
- Backend: 4000
- Frontend: 5173
- MongoDB: 27017

## ✅ **Success Indicators**

When everything is working:
1. Backend shows "Connected to MongoDB"
2. Frontend loads without errors
3. You can register/login users
4. Events can be created and viewed
5. Tickets can be booked

---

**Need Help?** Check the console logs in your terminal windows for specific error messages.
