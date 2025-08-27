# 🗄️ **MongoDB Atlas Production Setup Guide**

## 🚀 **Step-by-Step MongoDB Atlas Configuration**

### **1. Create MongoDB Atlas Account**
1. **Visit**: https://www.mongodb.com/atlas
2. **Sign Up**: Create a free account
3. **Choose Plan**: Select "Free" tier (M0 Sandbox)

### **2. Create Database Cluster**
1. **Cluster Name**: `tickethub-cluster`
2. **Cloud Provider**: Choose AWS, Google Cloud, or Azure
3. **Region**: Select closest to your deployment region
4. **Cluster Tier**: M0 Sandbox (Free)
5. **Click "Create"**

### **3. Database Access Setup**
1. **Security → Database Access**
2. **Add New Database User**
3. **Username**: `tickethub-user`
4. **Password**: Generate a strong password (12+ characters)
5. **Database User Privileges**: "Read and write to any database"
6. **Click "Add User"**

### **4. Network Access Configuration**
1. **Security → Network Access**
2. **Add IP Address**
3. **For Production**: Click "Allow Access from Anywhere" (0.0.0.0/0)
4. **For Development**: Add your local IP address
5. **Click "Confirm"**

### **5. Get Connection String**
1. **Clusters → Connect**
2. **Choose Connection Method**: "Connect your application"
3. **Driver**: Node.js
4. **Version**: 5.0 or later
5. **Copy Connection String**

### **6. Connection String Format**
```
mongodb+srv://tickethub-user:YOUR_PASSWORD@tickethub-cluster.xxxxx.mongodb.net/tickethub?retryWrites=true&w=majority
```

### **7. Environment Variables**
```env
# Backend .env
MONGO_URI=mongodb+srv://tickethub-user:YOUR_PASSWORD@tickethub-cluster.xxxxx.mongodb.net/tickethub?retryWrites=true&w=majority
JWT_SECRET=your_super_secure_jwt_secret_here_minimum_64_characters
ADMIN_EMAIL=admin@yourdomain.com
ADMIN_PASSWORD=your_secure_admin_password
NODE_ENV=production
PORT=10000
```

## 🔒 **Security Best Practices**

### **Database User Permissions**
- **Read/Write**: Only to specific databases
- **No Admin**: Avoid superuser privileges
- **IP Restrictions**: Limit to deployment servers

### **Connection Security**
- **TLS/SSL**: Always enabled
- **Authentication**: Username/password required
- **Network**: Restrict to necessary IPs

### **Monitoring & Alerts**
- **Database Metrics**: Monitor performance
- **Access Logs**: Track connections
- **Alerts**: Set up for unusual activity

## 🧪 **Test Connection**

### **Local Testing**
```bash
# Test connection string
mongosh "mongodb+srv://username:password@cluster.mongodb.net/tickethub"

# Test from backend
cd backend
npm run dev
```

### **Production Testing**
```bash
# Test health endpoint
curl https://your-backend-url.onrender.com/api/health

# Test database connection
curl https://your-backend-url.onrender.com/api/events
```

## 📊 **Database Management**

### **MongoDB Compass (GUI)**
1. **Download**: https://www.mongodb.com/try/download/compass
2. **Connect**: Use your connection string
3. **Browse**: View collections and documents
4. **Query**: Run database queries

### **MongoDB Atlas Dashboard**
- **Collections**: View data structure
- **Indexes**: Optimize queries
- **Performance**: Monitor database health
- **Backups**: Automated backups (paid plans)

## 🚨 **Troubleshooting**

### **Common Issues**
1. **Connection Refused**: Check network access
2. **Authentication Failed**: Verify username/password
3. **Timeout**: Check cluster status
4. **SSL Issues**: Ensure TLS is enabled

### **Support Resources**
- **MongoDB Documentation**: https://docs.mongodb.com/
- **Atlas Status**: https://status.mongodb.com/
- **Community Forum**: https://www.mongodb.com/community/forums/

---

**Next Steps**: After setting up MongoDB Atlas, proceed to deploy your backend to Render and frontend to Vercel.



