# Dart API Learning Examples - Beginner Friendly

This repository contains simple, beginner-friendly examples for learning API calling in Dart. Each example focuses on one specific concept with clear explanations.

## 📚 Topics Covered

### 1. Basic HTTP Methods (`01_basic_http_methods.dart`)
- **GET** - Read data from server
- **POST** - Create new data
- **PUT** - Update entire resource
- **PATCH** - Update partial resource
- **DELETE** - Remove resource

**Why learn this?** These are the fundamental operations for any API interaction.

**Best use cases:**
- GET: Loading user profiles, fetching posts, getting settings
- POST: User registration, creating posts, form submission
- PUT: Updating entire user profile, replacing documents
- PATCH: Updating only email, changing password, partial updates
- DELETE: Deleting posts, removing users, clearing data

### 2. JSON Parsing (`02_json_parsing.dart`)
- Parse simple JSON objects
- Parse JSON arrays
- Create JSON from Dart objects
- Handle nested JSON structures

**Why learn this?** Most APIs return data in JSON format.

**Best use cases:**
- Converting API responses to Dart objects
- Sending data to servers
- Handling complex data structures

### 3. Future and Await (`03_future_await.dart`)
- Basic async/await usage
- Multiple API calls (sequential vs parallel)
- Error handling
- Performance comparison

**Why learn this?** API calls take time, you need to wait for them properly.

**Best use cases:**
- Any network request
- File operations
- Loading multiple data sources
- Dashboard with multiple widgets

### 4. Streams (`04_streams.dart`)
- Basic stream usage
- API polling with streams
- Stream transformation
- Error handling in streams

**Why learn this?** Streams provide continuous data flow for real-time updates.

**Best use cases:**
- Real-time updates
- Live chat
- Stock prices
- Progress tracking
- Notifications

### 5. Caching and Optimization (`05_caching_optimization.dart`)
- Simple in-memory caching
- Performance comparison
- Request batching
- Parallel requests
- Compression

**Why learn this?** Improves app performance and reduces server load.

**Best use cases:**
- User profiles and settings
- Static data
- Large datasets
- Production apps

### 6. Headers and Authentication (`06_headers_authentication.dart`)
- Basic headers
- API key authentication
- Bearer token authentication
- Custom headers

**Why learn this?** Servers need to know how to handle your requests and verify your identity.

**Best use cases:**
- All API calls
- User authentication
- Third-party API integration
- Secure data access

## 🚀 How to Run Examples

1. **Run individual examples:**
   ```bash
   dart run lib/examples/01_basic_http_methods.dart
   dart run lib/examples/02_json_parsing.dart
   dart run lib/examples/03_future_await.dart
   dart run lib/examples/04_streams.dart
   dart run lib/examples/05_caching_optimization.dart
   dart run lib/examples/06_headers_authentication.dart
   ```

2. **Run all examples:**
   ```bash
   dart run lib/main.dart
   ```

## 📖 Learning Path

1. Start with **Basic HTTP Methods** to understand the fundamentals
2. Learn **JSON Parsing** to handle API responses
3. Master **Future and Await** for proper async programming
4. Explore **Streams** for real-time data
5. Implement **Caching** for better performance
6. Add **Headers and Authentication** for production apps

## 💡 Key Concepts

- **Always handle errors** - Networks can fail
- **Use parallel requests** when possible - It's faster
- **Cache data** when appropriate - Improves performance
- **Include proper headers** - Servers need context
- **Handle authentication** - Secure your API calls

## 🔧 Dependencies

Make sure you have the `http` package in your `pubspec.yaml`:

```yaml
dependencies:
  http: ^1.1.0
```

## 📝 Notes

- All examples use `jsonplaceholder.typicode.com` for testing
- Examples are designed to be simple and educational
- Each example includes "Why?" and "Best use case" explanations
- Error handling is included in all examples
- Performance comparisons show the benefits of optimization techniques
