# 🔌 TicketHub API Reference

## 📋 Overview

The TicketHub API is a RESTful service built with Node.js and Express. All endpoints return JSON responses and use JWT for authentication.

**Base URL:** `http://localhost:4000/api` (development)  
**Content-Type:** `application/json`

## 🔐 Authentication

Most endpoints require authentication via JWT tokens. Include the token in the Authorization header:

```http
Authorization: Bearer <your_jwt_token>
```

## 📊 Response Format

### Success Response
```json
{
  "success": true,
  "data": {
    // Response data
  },
  "message": "Operation successful"
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "statusCode": 400
}
```

---

## 🔑 Authentication Endpoints

### Register User

**POST** `/auth/register`

Create a new user account.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "SecurePass123!",
  "role": "user"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "_id": "507f1f77bcf86cd799439011",
      "name": "John Doe",
      "email": "john@example.com",
      "role": "user",
      "createdAt": "2024-12-01T10:00:00.000Z"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  },
  "message": "User registered successfully"
}
```

### Login User

**POST** `/auth/login`

Authenticate user and receive JWT token.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "SecurePass123!"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "_id": "507f1f77bcf86cd799439011",
      "name": "John Doe",
      "email": "john@example.com",
      "role": "user"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  },
  "message": "Login successful"
}
```

### Get Current User

**GET** `/auth/me`

Get current authenticated user's information.

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "_id": "507f1f77bcf86cd799439011",
      "name": "John Doe",
      "email": "john@example.com",
      "role": "user",
      "createdAt": "2024-12-01T10:00:00.000Z"
    }
  }
}
```

### Logout User

**POST** `/auth/logout`

Logout current user (clears JWT token).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Logged out successfully"
}
```

---

## 🎭 Event Endpoints

### Get All Events

**GET** `/events`

Retrieve all published events.

**Query Parameters:**
- `category` (optional) - Filter by event category
- `search` (optional) - Search in title and description
- `status` (optional) - Filter by event status (upcoming, ongoing, completed)

**Example:**
```http
GET /api/events?category=Technology&search=conference
```

**Response:**
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "_id": "507f1f77bcf86cd799439012",
        "title": "Tech Conference 2025",
        "description": "Annual technology conference",
        "date": "2025-03-15T00:00:00.000Z",
        "time": "09:00",
        "venue": "Convention Center",
        "price": 99.00,
        "totalSeats": 200,
        "availableSeats": 150,
        "category": "Technology",
        "status": "upcoming",
        "createdBy": "507f1f77bcf86cd799439011",
        "createdAt": "2024-12-01T10:00:00.000Z"
      }
    ],
    "total": 1
  }
}
```

### Get Event by ID

**GET** `/events/:id`

Retrieve a specific event by its ID.

**Response:**
```json
{
  "success": true,
  "data": {
    "event": {
      "_id": "507f1f77bcf86cd799439012",
      "title": "Tech Conference 2025",
      "description": "Annual technology conference",
      "date": "2025-03-15T00:00:00.000Z",
      "time": "09:00",
      "venue": "Convention Center",
      "price": 99.00,
      "totalSeats": 200,
      "availableSeats": 150,
      "category": "Technology",
      "status": "upcoming",
      "createdBy": {
        "_id": "507f1f77bcf86cd799439011",
        "name": "Admin User"
      },
      "createdAt": "2024-12-01T10:00:00.000Z"
    }
  }
}
```

### Create Event (Admin Only)

**POST** `/events`

Create a new event (requires admin role).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Request Body:**
```json
{
  "title": "Tech Conference 2025",
  "description": "Annual technology conference featuring industry leaders",
  "date": "2025-03-15",
  "time": "09:00",
  "venue": "Convention Center Hall A",
  "price": 99.00,
  "totalSeats": 200,
  "category": "Technology"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "event": {
      "_id": "507f1f77bcf86cd799439012",
      "title": "Tech Conference 2025",
      "description": "Annual technology conference featuring industry leaders",
      "date": "2025-03-15T00:00:00.000Z",
      "time": "09:00",
      "venue": "Convention Center Hall A",
      "price": 99.00,
      "totalSeats": 200,
      "availableSeats": 200,
      "category": "Technology",
      "status": "upcoming",
      "createdBy": "507f1f77bcf86cd799439011",
      "createdAt": "2024-12-01T10:00:00.000Z"
    }
  },
  "message": "Event created successfully"
}
```

### Update Event (Admin Only)

**PUT** `/events/:id`

Update an existing event (requires admin role).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Request Body:**
```json
{
  "title": "Updated Tech Conference 2025",
  "price": 149.00,
  "totalSeats": 250
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "event": {
      "_id": "507f1f77bcf86cd799439012",
      "title": "Updated Tech Conference 2025",
      "price": 149.00,
      "totalSeats": 250,
      "availableSeats": 200,
      "updatedAt": "2024-12-01T11:00:00.000Z"
    }
  },
  "message": "Event updated successfully"
}
```

### Delete Event (Admin Only)

**DELETE** `/events/:id`

Delete an event (requires admin role).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Event deleted successfully"
}
```

---

## 🎟️ Ticket Endpoints

### Book Ticket

**POST** `/tickets/book/:eventId`

Book tickets for a specific event.

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Request Body:**
```json
{
  "quantity": 2
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "tickets": [
      {
        "_id": "507f1f77bcf86cd799439013",
        "eventId": "507f1f77bcf86cd799439012",
        "userId": "507f1f77bcf86cd799439011",
        "ticketNumber": "TKT-2025-001",
        "qrCode": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
        "status": "active",
        "price": 99.00,
        "bookedAt": "2024-12-01T10:00:00.000Z"
      },
      {
        "_id": "507f1f77bcf86cd799439014",
        "eventId": "507f1f77bcf86cd799439012",
        "userId": "507f1f77bcf86cd799439011",
        "ticketNumber": "TKT-2025-002",
        "qrCode": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
        "status": "active",
        "price": 99.00,
        "bookedAt": "2024-12-01T10:00:00.000Z"
      }
    ]
  },
  "message": "Tickets booked successfully"
}
```

### Get User's Tickets

**GET** `/tickets/mine`

Get all tickets for the current user.

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "tickets": [
      {
        "_id": "507f1f77bcf86cd799439013",
        "eventId": {
          "_id": "507f1f77bcf86cd799439012",
          "title": "Tech Conference 2025",
          "date": "2025-03-15T00:00:00.000Z",
          "time": "09:00",
          "venue": "Convention Center"
        },
        "ticketNumber": "TKT-2025-001",
        "qrCode": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
        "status": "active",
        "price": 99.00,
        "bookedAt": "2024-12-01T10:00:00.000Z"
      }
    ]
  }
}
```

### Check-in Ticket

**POST** `/tickets/checkin/:ticketId`

Check-in a ticket (mark as used).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "ticket": {
      "_id": "507f1f77bcf86cd799439013",
      "status": "used",
      "usedAt": "2024-12-01T10:00:00.000Z"
    }
  },
  "message": "Ticket checked in successfully"
}
```

---

## 📊 Admin Endpoints

### Get Dashboard Statistics

**GET** `/admin/dashboard`

Get admin dashboard statistics (requires admin role).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "stats": {
      "totalEvents": 15,
      "totalUsers": 125,
      "totalTickets": 342,
      "totalRevenue": 33858.00
    },
    "recentEvents": [
      {
        "_id": "507f1f77bcf86cd799439012",
        "title": "Tech Conference 2025",
        "ticketsSold": 50,
        "revenue": 4950.00
      }
    ]
  }
}
```

### Get All Users

**GET** `/admin/users`

Get all registered users (requires admin role).

**Headers:**
```http
Authorization: Bearer <jwt_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "users": [
      {
        "_id": "507f1f77bcf86cd799439011",
        "name": "John Doe",
        "email": "john@example.com",
        "role": "user",
        "createdAt": "2024-12-01T10:00:00.000Z",
        "ticketsCount": 5
      }
    ],
    "total": 125
  }
}
```

---

## 🚨 Error Codes

| Status Code | Description |
|-------------|-------------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request - Invalid input data |
| 401 | Unauthorized - Invalid or missing token |
| 403 | Forbidden - Insufficient permissions |
| 404 | Not Found - Resource not found |
| 409 | Conflict - Resource already exists |
| 500 | Internal Server Error |

### Common Error Responses

**Validation Error (400):**
```json
{
  "success": false,
  "error": "Validation failed",
  "details": {
    "email": "Email is required",
    "password": "Password must be at least 6 characters"
  },
  "statusCode": 400
}
```

**Unauthorized (401):**
```json
{
  "success": false,
  "error": "Access denied. No token provided",
  "statusCode": 401
}
```

**Forbidden (403):**
```json
{
  "success": false,
  "error": "Access denied. Admin role required",
  "statusCode": 403
}
```

**Not Found (404):**
```json
{
  "success": false,
  "error": "Event not found",
  "statusCode": 404
}
```

---

## 🔧 Testing the API

### Using cURL

**Register User:**
```bash
curl -X POST http://localhost:4000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "SecurePass123!"
  }'
```

**Login User:**
```bash
curl -X POST http://localhost:4000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "SecurePass123!"
  }'
```

**Get Events (with token):**
```bash
curl -X GET http://localhost:4000/api/events \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Using Postman

1. **Import Collection** - Create a new collection in Postman
2. **Set Base URL** - `http://localhost:4000/api`
3. **Add Headers** - `Content-Type: application/json`
4. **Authentication** - Use Bearer Token for protected endpoints

### Environment Variables

Set up environment variables in Postman:
- `baseUrl`: `http://localhost:4000/api`
- `token`: Your JWT token after login

---

## 📝 Rate Limiting

The API implements rate limiting to prevent abuse:
- **Authentication endpoints**: 5 requests per minute
- **General endpoints**: 100 requests per minute
- **Admin endpoints**: 50 requests per minute

---

## 🔒 Security

- All sensitive endpoints require JWT authentication
- Passwords are hashed using bcryptjs
- CORS is configured for security
- Input validation is enforced on all endpoints
- SQL injection protection via Mongoose

---

*For more information, see the [Complete Documentation](./DOCUMENTATION.md)*
