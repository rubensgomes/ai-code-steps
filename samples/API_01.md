# {{PROJECT_NAME}} API Documentation

**Version:** {{API_VERSION}}  
**Base URL:** `{{BASE_URL}}`  
**OpenAPI Specification:** 3.1.1

## 📖 Overview

The {{PROJECT_NAME}} microservice provides a RESTful API for {{API_DESCRIPTION}}. This API follows REST principles and returns JSON responses for all endpoints.

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

- **Swagger UI**: [`{{BASE_URL}}/swagger-ui/index.html`]({{BASE_URL}}/swagger-ui/index.html)
- **OpenAPI JSON**: [`{{BASE_URL}}/v3/api-docs`]({{BASE_URL}}/v3/api-docs)
- **OpenAPI YAML**: [`{{BASE_URL}}/v3/api-docs.yaml`]({{BASE_URL}}/v3/api-docs.yaml)

## 🚀 Quick Reference

### Core Resources

| Resource | Description | Endpoints |
|----------|-------------|-----------|
| **{{RESOURCE_NAME}}** | {{RESOURCE_DESCRIPTION}} | `GET` `POST` `PUT` `DELETE` `/api/v1/{{RESOURCE_ENDPOINT}}` |
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

### {{RESOURCE_NAME}} Management

#### List {{RESOURCE_NAME}}s
```http
GET /api/v1/{{RESOURCE_ENDPOINT}}?page=0&size=20&sort=createdAt,desc
Authorization: Bearer <token>
```

**Response (200 OK):**
```json
{
  "content": [
    {
      "id": "{{SAMPLE_ID}}",
      "name": "{{SAMPLE_NAME}}",
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

#### Get {{RESOURCE_NAME}} by ID
```http
GET /api/v1/{{RESOURCE_ENDPOINT}}/{{SAMPLE_ID}}
Authorization: Bearer <token>
```

**Response (200 OK):**
```json
{
  "id": "{{SAMPLE_ID}}",
  "name": "{{SAMPLE_NAME}}",
  "description": "{{SAMPLE_DESCRIPTION}}",
  "status": "ACTIVE",
  "metadata": {
    "key": "value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T10:00:00Z"
}
```

#### Create {{RESOURCE_NAME}}
```http
POST /api/v1/{{RESOURCE_ENDPOINT}}
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "{{SAMPLE_NAME}}",
  "description": "{{SAMPLE_DESCRIPTION}}",
  "metadata": {
    "key": "value"
  }
}
```

**Response (201 Created):**
```json
{
  "id": "{{SAMPLE_ID}}",
  "name": "{{SAMPLE_NAME}}",
  "description": "{{SAMPLE_DESCRIPTION}}",
  "status": "ACTIVE",
  "metadata": {
    "key": "value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T10:00:00Z"
}
```

#### Update {{RESOURCE_NAME}}
```http
PUT /api/v1/{{RESOURCE_ENDPOINT}}/{{SAMPLE_ID}}
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "Updated {{SAMPLE_NAME}}",
  "description": "Updated {{SAMPLE_DESCRIPTION}}",
  "status": "INACTIVE",
  "metadata": {
    "key": "updated-value"
  }
}
```

**Response (200 OK):**
```json
{
  "id": "{{SAMPLE_ID}}",
  "name": "Updated {{SAMPLE_NAME}}",
  "description": "Updated {{SAMPLE_DESCRIPTION}}",
  "status": "INACTIVE",
  "metadata": {
    "key": "updated-value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T12:00:00Z"
}
```

#### Partial Update {{RESOURCE_NAME}}
```http
PATCH /api/v1/{{RESOURCE_ENDPOINT}}/{{SAMPLE_ID}}
Authorization: Bearer <token>
Content-Type: application/json

{
  "status": "INACTIVE"
}
```

**Response (200 OK):**
```json
{
  "id": "{{SAMPLE_ID}}",
  "name": "{{SAMPLE_NAME}}",
  "description": "{{SAMPLE_DESCRIPTION}}",
  "status": "INACTIVE",
  "metadata": {
    "key": "value"
  },
  "createdAt": "2025-07-31T10:00:00Z",
  "updatedAt": "2025-07-31T12:00:00Z"
}
```

#### Delete {{RESOURCE_NAME}}
```http
DELETE /api/v1/{{RESOURCE_ENDPOINT}}/{{SAMPLE_ID}}
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
    "name": "{{PROJECT_NAME}}",
    "version": "{{API_VERSION}}",
    "description": "{{API_DESCRIPTION}}"
  },
  "build": {
    "time": "2025-07-31T10:00:00Z",
    "version": "{{API_VERSION}}"
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
  "path": "/api/v1/{{RESOURCE_ENDPOINT}}",
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
  "path": "/api/v1/{{RESOURCE_ENDPOINT}}",
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
  "path": "/api/v1/{{RESOURCE_ENDPOINT}}"
}
```

### Rate Limit Error (429)
```json
{
  "timestamp": "2025-07-31T12:00:00Z",
  "status": 429,
  "error": "Too Many Requests",
  "message": "Rate limit exceeded. Try again in 60 seconds",
  "path": "/api/v1/{{RESOURCE_ENDPOINT}}"
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

- **Interactive Swagger UI**: [`{{BASE_URL}}/swagger-ui/index.html`]({{BASE_URL}}/swagger-ui/index.html)
- **OpenAPI JSON Format**: [`{{BASE_URL}}/v3/api-docs`]({{BASE_URL}}/v3/api-docs)
- **OpenAPI YAML Format**: [`{{BASE_URL}}/v3/api-docs.yaml`]({{BASE_URL}}/v3/api-docs.yaml)

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
curl -X POST "{{BASE_URL}}/api/v1/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"user@example.com","password":"password"}'

# Use the API with token
curl -X GET "{{BASE_URL}}/api/v1/{{RESOURCE_ENDPOINT}}" \
  -H "Authorization: Bearer <your-token>" \
  -H "Accept: application/json"
```

### Using HTTPie

```bash
# Login
http POST {{BASE_URL}}/api/v1/auth/login \
  username=user@example.com password=password

# API call
http GET {{BASE_URL}}/api/v1/{{RESOURCE_ENDPOINT}} \
  Authorization:"Bearer <your-token>"
```

### Postman Collection

Import the OpenAPI specification into Postman:
1. Open Postman
2. Click "Import"
3. Enter URL: `{{BASE_URL}}/v3/api-docs`
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
GET /api/v1/{{RESOURCE_ENDPOINT}}?filter=status:ACTIVE&search=john&sort=createdAt,desc
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

### Version {{API_VERSION}}

- Initial API release
- {{RESOURCE_NAME}} CRUD operations
- JWT authentication
- Rate limiting
- OpenAPI 3.1.1 specification
- Comprehensive error handling

---

**Note**: Replace template placeholders (e.g., `{{PROJECT_NAME}}`, `{{RESOURCE_NAME}}`) with actual project values during initialization.

For more information, visit the [Swagger UI]({{BASE_URL}}/swagger-ui/index.html) or download the [OpenAPI specification]({{BASE_URL}}/v3/api-docs.yaml).
