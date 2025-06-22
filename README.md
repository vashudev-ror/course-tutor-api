# 📚 Course and Tutor API (JWT Auth)

This is a Ruby on Rails API application that allows users to manage **Courses** and their associated **Tutors**, with secure **JWT-based authentication**.

## 📌 Overview

This API includes:
- Creating courses along with nested tutors
- Listing all courses with pagination
- Secure user login using JWT
- Validations for email format, presence, and uniqueness
- Full test coverage with RSpec & SimpleCov
- Clean code practices with RuboCop

## ✅ Features Implemented

- `POST /api/v1/login`: JWT authentication
- `POST /api/v1/courses`: Create course with tutors
- `GET /api/v1/courses`: Paginated course listing with tutors
- Validations for course and tutor models
- Authentication filter for protected routes
- Token handling in `ApplicationController`
- RuboCop auto-linting & `.rubocop.yml` config
- RSpec + FactoryBot + Request & Model Specs

---

## 🛠️ Getting Started

### 🔧 Prerequisites

- Ruby `3.2.2`
- Rails `7.1.3.4`
- PostgreSQL
- Bundler (`gem install bundler`)

### ⚙️ Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/course-tutor-api.git
   cd course-tutor-api
   ```

2. Install the dependencies specified in the Gemfile:

   ```bash
   bundle install
   ```

3. Run tests:

   ```bash
   bundle exec rspec
   ```

4. Run RuboCop for style checks:

   ```bash
   bundle exec rubocop
   ```

## Code Coverage

Code coverage is measured using [SimpleCov](https://github.com/simplecov-ruby/simplecov).

To generate a coverage report:

```bash
bundle exec rspec
```

After running the tests, open the report in your browser:

```bash
open coverage/index.html   # For macOS
# or
xdg-open coverage/index.html  # For Linux
```

This will display an HTML report showing how much of your code is covered by tests.

### 📬 API Collection

You can test the APIs using this Postman collection:  
[👉 Postman Collection Link](https://documenter.getpostman.com/view/46099609/2sB2xBEqUD)


### 🔐 Authentication (JWT)

This API is protected using JWT-based authentication. You need to authenticate first to access the protected endpoints.

## Seed a Default User
Run the following command to create a default user in your local database:

```bash
rails db:seed
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Write tests for your feature or fix.
4. Submit a pull request.

