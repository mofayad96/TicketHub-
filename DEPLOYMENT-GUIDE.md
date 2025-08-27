# 🚀 **TicketHub Production Deployment Guide**

## 📋 **Deployment Overview**

This guide will walk you through deploying your TicketHub application to production:
- **Frontend**: Vercel (React)
- **Backend**: Render (Node.js/Express)
- **Database**: MongoDB Atlas (Cloud)

## 🗄️ **Step 1: MongoDB Atlas Setup**

### **1.1 Create MongoDB Atlas Account**
1. Visit [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Sign up for a free account
3. Create a new cluster (M0 Sandbox - Free)

### **1.2 Configure Database Access**
1. Go to **Security → Database Access**
2. Add new user: `tickethub-user`
3. Set strong password
4. Grant "Read and write to any database" permissions

### **1.3 Configure Network Access**
1. Go to **Security → Network Access**
2. Click "Add IP Address"
3. Select "Allow Access from Anywhere" (0.0.0.0/0)
4. Click "Confirm"

### **1.4 Get Connection String**
1. Go to **Clusters → Connect**
2. Choose "Connect your application"
3. Select Node.js driver
4. Copy the connection string

### **1.5 Update Connection String**
Replace the placeholder values:
```
mongodb+srv://tickethub-user:YOUR_PASSWORD@tickethub-cluster.xxxxx.mongodb.net/tickethub?retryWrites=true&w=majority
```

## ⚙️ **Step 2: Backend Deployment (Render)**

### **2.1 Prepare Backend for Production**
1. **Update Environment Variables**
   ```bash
   cd backend
   # Create production .env file
   echo "NODE_ENV=production" > .env.production
   echo "PORT=10000" >> .env.production
   ```

2. **Verify Package.json Scripts**
   ```json
   {
     "scripts": {
       "start": "node src/server.js",
       "dev": "nodemon src/server.js"
     }
   }
   ```

### **2.2 Deploy to Render**
1. **Sign Up**: [Render.com](https://render.com)
2. **New Web Service**: Connect your GitHub repository
3. **Configure Service**:
   - **Name**: `tickethub-backend`
   - **Environment**: Node
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Free

### **2.3 Set Environment Variables in Render**
1. **Environment Variables Tab**:
   ```
   NODE_ENV=production
   PORT=10000
   MONGO_URI=mongodb+srv://tickethub-user:YOUR_PASSWORD@tickethub-cluster.xxxxx.mongodb.net/tickethub?retryWrites=true&w=majority
   JWT_SECRET=your_super_secure_jwt_secret_here_minimum_64_characters
   ADMIN_EMAIL=admin@yourdomain.com
   ADMIN_PASSWORD=your_secure_admin_password
   ```

2. **Click "Save Changes"**

### **2.4 Deploy and Test**
1. **Deploy**: Click "Deploy" button
2. **Wait**: Build and deployment process
3. **Test Health Endpoint**: `https://your-service.onrender.com/api/health`
4. **Note Backend URL**: Save for frontend configuration

## 🎨 **Step 3: Frontend Deployment (Vercel)**

### **3.1 Prepare Frontend for Production**
1. **Update Environment Variables**
   ```bash
   cd frontend
   # Update production .env file
   echo "VITE_API_URL=https://your-backend-url.onrender.com/api" > .env.production
   ```

2. **Verify Build Script**
   ```json
   {
     "scripts": {
       "build": "vite build",
       "dev": "vite"
     }
   }
   ```

### **3.2 Deploy to Vercel**
1. **Sign Up**: [Vercel.com](https://vercel.com)
2. **Import Project**: Connect your GitHub repository
3. **Configure Project**:
   - **Framework Preset**: Vite
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
   - **Install Command**: `npm install`

### **3.3 Set Environment Variables in Vercel**
1. **Environment Variables Tab**:
   ```
   VITE_API_URL=https://your-backend-url.onrender.com/api
   ```

2. **Click "Save"**

### **3.4 Deploy and Test**
1. **Deploy**: Click "Deploy" button
2. **Wait**: Build and deployment process
3. **Test**: Visit your Vercel URL
4. **Note Frontend URL**: Save for final testing

## 🧪 **Step 4: Testing & Verification**

### **4.1 Backend Health Check**
```bash
curl https://your-backend-url.onrender.com/api/health
# Expected: {"ok":true,"service":"TicketHub Backend","timestamp":"..."}
```

### **4.2 Frontend Connection Test**
1. Visit your Vercel frontend URL
2. Try to register a new user
3. Check browser console for API calls
4. Verify backend communication

### **4.3 Database Connection Test**
1. **Test User Registration**:
   - Go to frontend registration page
   - Create a test user account
   - Verify user appears in MongoDB Atlas

2. **Test Admin Login**:
   - Use admin credentials from environment
   - Verify admin dashboard access
   - Test event creation

## 🔐 **Step 5: Production Security**

### **5.1 Environment Variables**
- ✅ All secrets in environment variables
- ✅ No hardcoded credentials
- ✅ Strong JWT secrets
- ✅ Secure database passwords

### **5.2 CORS Configuration**
- ✅ Frontend domain whitelisted
- ✅ Secure cookie settings
- ✅ HTTPS enforcement

### **5.3 Database Security**
- ✅ TLS/SSL enabled
- ✅ Strong authentication
- ✅ Network access restricted
- ✅ Regular backups (if paid plan)

## 📱 **Step 6: Complete User Workflow**

### **6.1 User Registration & Login**
1. **Visit**: Your Vercel frontend URL
2. **Register**: Create new user account
3. **Login**: Access user dashboard
4. **Profile**: View and edit profile

### **6.2 Event Browsing & Booking**
1. **Browse Events**: View available events
2. **Event Details**: Click on event for details
3. **Book Tickets**: Select seats and book
4. **My Tickets**: View booked tickets with QR codes

### **6.3 Admin Management**
1. **Admin Login**: Use admin credentials
2. **Dashboard**: View statistics and manage events
3. **Create Events**: Add new events with details
4. **Manage Users**: View user accounts and activity

## 🚨 **Troubleshooting Common Issues**

### **Backend Issues**
1. **Build Failures**: Check package.json scripts
2. **Environment Variables**: Verify all required vars are set
3. **Database Connection**: Test MongoDB Atlas connection
4. **Port Conflicts**: Ensure PORT is set correctly

### **Frontend Issues**
1. **Build Errors**: Check Vite configuration
2. **API Connection**: Verify VITE_API_URL is correct
3. **CORS Errors**: Check backend CORS configuration
4. **Environment Variables**: Ensure VITE_ prefix for Vite

### **Database Issues**
1. **Connection Timeout**: Check network access settings
2. **Authentication Failed**: Verify username/password
3. **Cluster Status**: Check MongoDB Atlas dashboard
4. **IP Restrictions**: Ensure deployment IPs are allowed

## 📊 **Monitoring & Maintenance**

### **Performance Monitoring**
- **Render Dashboard**: Monitor backend performance
- **Vercel Analytics**: Track frontend usage
- **MongoDB Atlas**: Database performance metrics

### **Regular Maintenance**
- **Security Updates**: Keep dependencies updated
- **Backup Verification**: Test database backups
- **Performance Review**: Monitor response times
- **User Feedback**: Collect and address issues

## 🎉 **Success Indicators**

Your deployment is successful when:
- ✅ Frontend loads without errors
- ✅ Backend health endpoint responds
- ✅ User registration works
- ✅ Admin login successful
- ✅ Events can be created and viewed
- ✅ Tickets can be booked
- ✅ QR codes generate properly

---

**🎯 Next Steps**: After successful deployment, test all user workflows and monitor performance. Consider setting up monitoring and alerting for production use.
