# usermgr-ms API Documentation

**Version:** 0.0.1-SNAPSHOT  
**Base URL:** `http://localhost:8080`  
**OpenAPI Specification:** 3.1.1

## 📖 Overview

The usermgr-ms microservice provides a RESTful API for User management and authentication service. This API follows REST principles and returns JSON responses for all endpoints.

### Key Features

- **RESTful Design** - Standard HTTP methods and status codes
- **JSON API** - All requests and responses use JSON format
- **Authentication** - Secure access using JWT tokens
- **Validation** - Comprehensive input validation with detailed error messages
- **Pagination** - Support for paginated responses on collection endpoints
- **Filtering & Sorting** - Query parameters for data filtering and sorting
- **Rate Limiting** - Request throttling to ensure service stability
- **CORS Support** - Cross-origin resource sharing enabled
- **Health Checks** - Built-in monitoring and health endpoints

### API Documentation Access

- **Swagger UI**: [`http://localhost:8080/swagger-ui/index.html`](http://localhost:8080/swagger-ui/index.html)
- **OpenAPI JSON**: [`http://localhost:8080/v3/api-docs`](http://localhost:8080/v3/api-docs)
- **OpenAPI YAML**: [`http://localhost:8080/v3/api-docs.yaml`](http://localhost:8080/v3/api-docs.yaml)

## 🚀 Quick Reference

### Core Resources

| Resource | Description | Endpoints |
|----------|-------------|-----------|
| **User** | User account management | `GET` `POST` `PUT` `DELETE` `/api/v1/users` |
| **Health** | Application health status | `GET` `/actuator/health` |
| **Metrics** | Application metrics | `GET` `/actuator/metrics` |

### HTTP Methods Summary

| Method | Usage | Idempotent | Safe |
|--------|-------|------------|------|
| `GET` | Retrieve resources | ✅ | ✅ |
| `POST` | Create new resources | ❌ | ❌ |
| `PUT` | Update/replace resources | ✅ | ❌ |
| `PATCH` | Partial update resources | ❌ | ❌ |
| `DELETE` | Remove resources | ✅ | ❌ |
| `HEAD` | Get resource metadata | ✅ | ✅ |
| `OPTIONS` | Get allowed methods | ✅ | ✅ |

### Common Query Parameters

| Parameter | Type | Description | Example |
|-----------|------|-------------|---------|
| `page` | integer | Page number (0-based) | `?page=0` |
| `size` | integer | Page size (max 100) | `?size=20` |
| `sort` | string | Sort field and direction | `?sort=name,asc` |
| `filter` | string | Filter criteria | `?filter=status:active` |

## 🔐 Authentication

The API uses **JWT (JSON Web Token)** authentication. Include the token in the `Authorization` header:

```http
Authorization: Bearer <your-jwt-token>
```

### Authentication Endpoints

#### Login
```http
POST /api/v1/auth/login
Content-Type: application/json

{
  "username": "user@example.com",
  "password": "your-password"
}
```

**Response:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expiresIn": 3600,
  "tokenType": "Bearer"
}
```

#### Refresh Token
```http
POST /api/v1/auth/refresh
Authorization: Bearer <refresh-token>
```

## 📝 API Endpoints

### User Management

#### List Users
```http
GET /api/v1/users?page=0&size=20&sort=createdAt,desc
Authorization: Bearer <token>
```

**Response (200 OK):**
```json
{
  "content": [
    {
      "id": "123e4567-e89b-12d3-a456-426614174000",
      "name": "John Doe",
      "status": "ACTIVE",
      "createdAt": "2025-07-31T10:00:00Z",
      "updatedAt": "2025-07-31T10:00:00Z"
    }
  ],
  "pageable": {
    "page": 0,
    "size": 20,
    "totalElements": 1,
    "totalPages": 1
  }
}
```

#### Get User by ID
```http
GET /api/v1/users/123e4567-e89b-12d3-a456-426614174000
Authorization: Bearer <token>
```

**Response (200 OK):**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "name": "John Doe",
  "description": "Active user account",
  "status": "ACTIVE",
  "metadata": {
    "key": "value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T10:00:00Z"
}
```

#### Create User
```http
POST /api/v1/users
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "John Doe",
  "description": "Active user account",
  "metadata": {
    "key": "value"
  }
}
```

**Response (201 Created):**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "name": "John Doe",
  "description": "Active user account",
  "status": "ACTIVE",
  "metadata": {
    "key": "value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T10:00:00Z"
}
```

#### Update User
```http
PUT /api/v1/users/123e4567-e89b-12d3-a456-426614174000
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "Updated John Doe",
  "description": "Updated Active user account",
  "status": "INACTIVE",
  "metadata": {
    "key": "updated-value"
  }
}
```

**Response (200 OK):**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "name": "Updated John Doe",
  "description": "Updated Active user account",
  "status": "INACTIVE",
  "metadata": {
    "key": "updated-value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T12:00:00Z"
}
```

#### Partial Update User
```http
PATCH /api/v1/users/123e4567-e89b-12d3-a456-426614174000
Authorization: Bearer <token>
Content-Type: application/json

{
  "status": "INACTIVE"
}
```

**Response (200 OK):**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "name": "John Doe",
  "description": "Active user account",
  "status": "INACTIVE",
  "metadata": {
    "key": "value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T12:00:00Z"
}
```

#### Delete User
```http
DELETE /api/v1/users/123e4567-e89b-12d3-a456-426614174000
Authorization: Bearer <token>
```

**Response (204 No Content)**

### Health & Monitoring

#### Health Check
```http
GET /actuator/health
```

**Response (200 OK):**
```json
{
  "status": "UP",
  "components": {
    "db": {
      "status": "UP",
      "details": {
        "database": "PostgreSQL",
        "validationQuery": "isValid()"
      }
    },
    "diskSpace": {
      "status": "UP",
      "details": {
        "total": 499963174912,
        "free": 91897286656,
        "threshold": 10485760,
        "path": "/app/."
      }
    }
  }
}
```

#### Application Info
```http
GET /actuator/info
```

**Response (200 OK):**
```json
{
  "app": {
    "name": "usermgr-ms",
    "version": "0.0.1-SNAPSHOT",
    "description": "User management and authentication service"
  },
  "build": {
    "time": "2025-07-31T10:00:00Z",
    "version": "0.0.1-SNAPSHOT"
  }
}
```

## 📋 HTTP Status Codes

### Success Codes

| Code | Status | Description |
|------|--------|-------------|
| `200` | OK | Request successful |
| `201` | Created | Resource created successfully |
| `202` | Accepted | Request accepted for processing |
| `204` | No Content | Request successful, no content returned |

### Client Error Codes

| Code | Status | Description |
|------|--------|-------------|
| `400` | Bad Request | Invalid request format or parameters |
| `401` | Unauthorized | Authentication required or failed |
| `403` | Forbidden | Access denied |
| `404` | Not Found | Resource not found |
| `405` | Method Not Allowed | HTTP method not supported |
| `409` | Conflict | Resource conflict (e.g., duplicate) |
| `422` | Unprocessable Entity | Validation errors |
| `429` | Too Many Requests | Rate limit exceeded |

### Server Error Codes

| Code | Status | Description |
|------|--------|-------------|
| `500` | Internal Server Error | Unexpected server error |
| `502` | Bad Gateway | Invalid response from upstream |
| `503` | Service Unavailable | Service temporarily unavailable |
| `504` | Gateway Timeout | Upstream timeout |

## 🚨 Error Responses

All error responses follow a consistent format:

```json
{
  "timestamp": "2025-07-31T12:00:00Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Validation failed for object='createRequest'",
  "path": "/api/v1/users",
  "details": [
    {
      "field": "name",
      "rejectedValue": "",
      "message": "Name cannot be empty"
    },
    {
      "field": "email",
      "rejectedValue": "invalid-email",
      "message": "Email must be a valid email address"
    }
  ]
}
```

### Validation Error (422)
```json
{
  "timestamp": "2025-07-31T12:00:00Z",
  "status": 422,
  "error": "Unprocessable Entity",
  "message": "Validation failed",
  "path": "/api/v1/users",
  "details": [
    {
      "field": "name",
      "rejectedValue": null,
      "message": "Name is required"
    }
  ]
}
```

### Authentication Error (401)
```json
{
  "timestamp": "2025-07-31T12:00:00Z",
  "status": 401,
  "error": "Unauthorized",
  "message": "Invalid or expired token",
  "path": "/api/v1/users"
}
```

### Rate Limit Error (429)
```json
{
  "timestamp": "2025-07-31T12:00:00Z",
  "status": 429,
  "error": "Too Many Requests",
  "message": "Rate limit exceeded. Try again in 60 seconds",
  "path": "/api/v1/users"
}
```

## 🔄 Request/Response Headers

### Common Request Headers

| Header | Required | Description | Example |
|--------|----------|-------------|---------|
| `Authorization` | Yes* | JWT token for authentication | `Bearer eyJhbGc...` |
| `Content-Type` | Yes** | Request payload format | `application/json` |
| `Accept` | No | Preferred response format | `application/json` |
| `X-Request-ID` | No | Unique request identifier | `123e4567-e89b-12d3` |

*Required for authenticated endpoints  
**Required for POST/PUT/PATCH requests

### Common Response Headers

| Header | Description | Example |
|--------|-------------|---------|
| `Content-Type` | Response format | `application/json;charset=UTF-8` |
| `X-Request-ID` | Request correlation ID | `123e4567-e89b-12d3` |
| `X-Rate-Limit-Remaining` | Remaining requests | `99` |
| `X-Rate-Limit-Reset` | Rate limit reset time | `1627747200` |
| `Cache-Control` | Caching directives | `no-cache, no-store` |

## 📊 OpenAPI 3.1.1 Specification

This API is fully documented using OpenAPI 3.1.1 specification. The complete specification includes:

- **Detailed schemas** for all request/response models
- **Security schemes** and authentication flows
- **Parameter definitions** with validation rules
- **Example values** for all endpoints
- **Error response schemas** with detailed error codes

### Access OpenAPI Documentation

- **Interactive Swagger UI**: [`http://localhost:8080/swagger-ui/index.html`](http://localhost:8080/swagger-ui/index.html)
- **OpenAPI JSON Format**: [`http://localhost:8080/v3/api-docs`](http://localhost:8080/v3/api-docs)
- **OpenAPI YAML Format**: [`http://localhost:8080/v3/api-docs.yaml`](http://localhost:8080/v3/api-docs.yaml)

### OpenAPI Features

- ✅ **OpenAPI 3.1.1** compliant
- ✅ **JSON Schema** validation
- ✅ **Security definitions** (JWT Bearer)
- ✅ **Request/Response examples**
- ✅ **Parameter descriptions** and constraints
- ✅ **Error response schemas**
- ✅ **Server definitions** for different environments

## 🧪 Testing the API

### Using cURL

```bash
# Get authentication token
curl -X POST "http://localhost:8080/api/v1/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"user@example.com","password":"password"}'

# Use the API with token
curl -X GET "http://localhost:8080/api/v1/users" \
  -H "Authorization: Bearer <your-token>" \
  -H "Accept: application/json"
```

### Using HTTPie

```bash
# Login
http POST http://localhost:8080/api/v1/auth/login \
  username=user@example.com password=password

# API call
http GET http://localhost:8080/api/v1/users \
  Authorization:"Bearer <your-token>"
```

### Postman Collection

Import the OpenAPI specification into Postman:
1. Open Postman
2. Click "Import"
3. Enter URL: `http://localhost:8080/v3/api-docs`
4. Configure authentication in the collection settings

## 📈 Rate Limiting

The API implements rate limiting to ensure fair usage:

- **Standard Users**: 1000 requests per hour
- **Premium Users**: 5000 requests per hour
- **Rate limit headers** included in all responses
- **429 status code** when limit exceeded

Rate limit information is provided in response headers:
- `X-Rate-Limit-Limit`: Total requests allowed
- `X-Rate-Limit-Remaining`: Remaining requests
- `X-Rate-Limit-Reset`: Reset timestamp

## 🔍 Filtering and Searching

### Query Parameters

```http
GET /api/v1/users?filter=status:ACTIVE&search=john&sort=createdAt,desc
```

| Parameter | Description | Example |
|-----------|-------------|---------|
| `filter` | Field-based filtering | `filter=status:ACTIVE` |
| `search` | Full-text search | `search=john` |
| `sort` | Sort by field and direction | `sort=name,asc` |
| `page` | Page number (0-based) | `page=0` |
| `size` | Page size (max 100) | `size=20` |

### Filter Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `:` | Equals | `status:ACTIVE` |
| `:!` | Not equals | `status:!INACTIVE` |
| `:>` | Greater than | `createdAt:>2025-01-01` |
| `:<` | Less than | `createdAt:<2025-12-31` |
| `:~` | Contains | `name:~john` |

## 📝 Changelog

### Version 0.0.1-SNAPSHOT

- Initial API release
- User CRUD operations
- JWT authentication
- Rate limiting
- OpenAPI 3.1.1 specification
- Comprehensive error handling

---

**Note**: Replace template placeholders (e.g., `usermgr-ms`, `User`) with actual project values during initialization.

For more information, visit the [Swagger UI](http://localhost:8080/swagger-ui/index.html) or download the [OpenAPI specification](http://localhost:8080/v3/api-docs.yaml).
