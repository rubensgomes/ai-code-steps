# API Documentation

## Overview

This RESTful API provides endpoints for managing [resource description]. The API follows REST principles and returns JSON responses.

**Base URL**: `https://api.example.com/api`

**Authentication**: Bearer Token (JWT)

**Content Type**: `application/json`

## Quick Reference

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/useraccount` | Get all user accounts |
| GET | `/useraccount/{id}` | Get user account by ID |
| POST | `/useraccount` | Create a new user account |
| PUT | `/useraccount/{id}` | Update user account |
| PATCH | `/useraccount/{id}` | Partial update user account |
| DELETE | `/useraccount/{id}` | Delete user account |

## Authentication

Include the JWT token in the Authorization header:

```bash
Authorization: Bearer your_jwt_token_here
```

### Getting a Token

```bash
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expires_in": 3600,
  "user": {
    "id": 1,
    "email": "user@example.com",
    "username": "johndoe"
  }
}
```

## Endpoints

### User Accounts

#### Get All User Accounts

```http
GET /useraccount
```

**Query Parameters:**
- `page` (optional): Page number (default: 1)
- `size` (optional): Page size (default: 20, max: 100)
- `sort` (optional): Sort field (default: id)
- `order` (optional): Sort order - asc|desc (default: asc)
- `search` (optional): Search term for username or email

**Example Request:**
```bash
curl -X GET "https://api.example.com/api/useraccount?page=1&size=10&sort=username&order=asc" \
  -H "Authorization: Bearer your_token"
```

**Success Response (200 OK):**
```json
{
  "data": [
    {
      "id": 1,
      "username": "johndoe",
      "email": "john@example.com",
      "created_at": "2025-07-30T10:30:00Z",
      "updated_at": "2025-07-30T10:30:00Z"
    },
    {
      "id": 2,
      "username": "janesmith",
      "email": "jane@example.com",
      "created_at": "2025-07-30T11:00:00Z",
      "updated_at": "2025-07-30T11:00:00Z"
    }
  ],
  "pagination": {
    "current_page": 1,
    "per_page": 10,
    "total": 25,
    "total_pages": 3
  }
}
```

#### Get User Account by ID

```http
GET /useraccount/{id}
```

**Path Parameters:**
- `id` (required): User Account ID (integer)

**Example Request:**
```bash
curl -X GET "https://api.example.com/api/useraccount/1" \
  -H "Authorization: Bearer your_token"
```

**Success Response (200 OK):**
```json
{
  "id": 1,
  "username": "johndoe",
  "email": "john@example.com",
  "profile": {
    "bio": "Software developer",
    "location": "San Francisco, CA"
  },
  "created_at": "2025-07-30T10:30:00Z",
  "updated_at": "2025-07-30T10:30:00Z"
}
```

**Error Response (404 Not Found):**
```json
{
  "error": "Not Found",
  "message": "User account with ID 1 not found",
  "code": "USER_ACCOUNT_NOT_FOUND",
  "timestamp": "2025-07-30T12:00:00Z"
}
```

#### Create User Account

```http
POST /useraccount
```

**Request Body:**
```json
{
  "username": "johndoe",
  "email": "john@example.com",
  "password": "securePassword123",
  "profile": {
    "bio": "Software developer",
    "location": "San Francisco, CA"
  }
}
```

**Field Validation:**
- `username`: Required, 3-30 characters, alphanumeric and underscores only, unique
- `email`: Required, valid email format, unique
- `password`: Required, minimum 8 characters, must contain uppercase, lowercase, and number
- `profile.bio`: Optional, max 500 characters
- `profile.location`: Optional, max 100 characters

**Example Request:**
```bash
curl -X POST "https://api.example.com/api/useraccount" \
  -H "Authorization: Bearer your_token" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "johndoe",
    "email": "john@example.com",
    "password": "SecurePass123"
  }'
```

**Success Response (201 Created):**
```json
{
  "id": 3,
  "username": "johndoe",
  "email": "john@example.com",
  "profile": {
    "bio": null,
    "location": null
  },
  "created_at": "2025-07-30T12:15:00Z",
  "updated_at": "2025-07-30T12:15:00Z"
}
```

**Validation Error Response (422 Unprocessable Entity):**
```json
{
  "error": "Validation Failed",
  "message": "The given data was invalid",
  "errors": {
    "email": ["The email has already been taken"],
    "username": ["The username has already been taken"],
    "password": ["The password must be at least 8 characters"]
  },
  "timestamp": "2025-07-30T12:00:00Z"
}
```

#### Update User Account

```http
PUT /useraccount/{id}
```

**Path Parameters:**
- `id` (required): User Account ID (integer)

**Request Body:** (All fields required)
```json
{
  "username": "johnsmith",
  "email": "johnsmith@example.com",
  "profile": {
    "bio": "Senior software developer",
    "location": "Austin, TX"
  }
}
```

**Example Request:**
```bash
curl -X PUT "https://api.example.com/api/useraccount/1" \
  -H "Authorization: Bearer your_token" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "johnsmith",
    "email": "johnsmith@example.com"
  }'
```

#### Partial Update User Account

```http
PATCH /useraccount/{id}
```

**Path Parameters:**
- `id` (required): User Account ID (integer)

**Request Body:** (Only include fields to update)
```json
{
  "username": "johnsmith"
}
```

**Example Request:**
```bash
curl -X PATCH "https://api.example.com/api/useraccount/1" \
  -H "Authorization: Bearer your_token" \
  -H "Content-Type: application/json" \
  -d '{"username": "johnsmith"}'
```

#### Delete User Account

```http
DELETE /useraccount/{id}
```

**Path Parameters:**
- `id` (required): User Account ID (integer)

**Example Request:**
```bash
curl -X DELETE "https://api.example.com/api/useraccount/1" \
  -H "Authorization: Bearer your_token"
```

**Success Response (204 No Content):**
```
(Empty response body)
```

## Data Models

### User Account Object

```json
{
  "id": "integer",
  "username": "string (3-30 chars, alphanumeric + underscores)",
  "email": "string (valid email)",
  "profile": {
    "bio": "string (max 500 chars, nullable)",
    "location": "string (max 100 chars, nullable)"
  },
  "created_at": "string (ISO 8601 datetime)",
  "updated_at": "string (ISO 8601 datetime)"
}
```

### Error Object

```json
{
  "error": "string (error type)",
  "message": "string (human-readable description)",
  "code": "string (error code for programmatic handling)",
  "timestamp": "string (ISO 8601 datetime)",
  "errors": "object (field-specific validation errors, optional)"
}
```

## HTTP Status Codes

| Code | Description | Usage |
|------|-------------|-------|
| 200 | OK | Successful GET, PUT, PATCH requests |
| 201 | Created | Successful POST requests |
| 204 | No Content | Successful DELETE requests |
| 400 | Bad Request | Invalid request syntax or parameters |
| 401 | Unauthorized | Missing or invalid authentication |
| 403 | Forbidden | Authenticated but not authorized |
| 404 | Not Found | Resource not found |
| 422 | Unprocessable Entity | Validation errors |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Server error |

## Rate Limiting

API requests are limited to:
- **Authenticated users**: 1000 requests per hour
- **Unauthenticated users**: 100 requests per hour

Rate limit headers are included in responses:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1627846261
```

## Pagination

List endpoints support pagination using query parameters:

- `page`: Page number (1-based, default: 1)
- `size`: Items per page (default: 20, max: 100)

**Pagination Response Format:**
```json
{
  "data": [...],
  "pagination": {
    "current_page": 1,
    "per_page": 20,
    "total": 150,
    "total_pages": 8,
    "has_more": true
  }
}
```

## Filtering and Sorting

### Filtering
Use query parameters to filter results:
```bash
GET /useraccount?status=active&role=admin
```

### Sorting
Use `sort` and `order` parameters:
```bash
GET /useraccount?sort=username&order=desc
```

Multiple sort fields:
```bash
GET /useraccount?sort=username,created_at&order=asc,desc
```

## Error Handling

All errors follow a consistent format:

### Client Errors (4xx)

**400 Bad Request:**
```json
{
  "error": "Bad Request",
  "message": "Invalid query parameter 'size'. Must be between 1 and 100",
  "code": "INVALID_PARAMETER",
  "timestamp": "2025-07-30T12:00:00Z"
}
```

**422 Validation Error:**
```json
{
  "error": "Validation Failed",
  "message": "The given data was invalid",
  "code": "VALIDATION_ERROR",
  "errors": {
    "email": ["The email field is required"],
    "username": ["The username field is required"],
    "password": ["The password must be at least 8 characters"]
  },
  "timestamp": "2025-07-30T12:00:00Z"
}
```

### Server Errors (5xx)

**500 Internal Server Error:**
```json
{
  "error": "Internal Server Error",
  "message": "An unexpected error occurred",
  "code": "INTERNAL_ERROR",
  "timestamp": "2025-07-30T12:00:00Z"
}
```

## Testing the API

### Using cURL

```bash
# Set your token
export TOKEN="your_jwt_token_here"

# Get all user accounts
curl -H "Authorization: Bearer $TOKEN" \
     https://api.example.com/api/useraccount

# Create a user account
curl -X POST \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"username":"testuser","email":"test@example.com","password":"TestPass123"}' \
     https://api.example.com/api/useraccount
```

### Using Postman

1. Import the API collection: [Postman Collection Link]
2. Set up environment variables:
   - `base_url`: https://api.example.com/api
   - `token`: your_jwt_token_here

### Interactive Documentation

- **Swagger UI**: https://api.example.com/docs
- **Redoc**: https://api.example.com/redoc
- **Postman Collection**: [Download Link]

## SDKs and Libraries

### Official SDKs
- **JavaScript/Node.js**: `npm install @company/api-client`
- **Python**: `pip install company-api-client`
- **Java**: Available on Maven Central

### Community Libraries
- **PHP**: [GitHub Link]
- **Ruby**: [GitHub Link]
- **Go**: [GitHub Link]

## Changelog

### v1.2.0 - 2025-07-30
- Added user profile fields
- Improved error response format
- Added rate limiting headers

### v1.1.0 - 2025-07-15
- Added pagination to list endpoints
- Implemented PATCH for partial updates
- Added search functionality

### v1.0.0 - 2025-07-01
- Initial API release
- Basic CRUD operations for user accounts
- JWT authentication