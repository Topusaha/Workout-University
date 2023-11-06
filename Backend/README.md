# Login REST API Documentation

## Overview

The Login REST API is built using Node.js and Express.js, and it utilizes a MongoDB database for data storage. Authentication is handled using JWT tokens. This API can be easily deployed using Docker and Docker Compose.

## Prerequisites

Before running the API, make sure you have the following tools installed on your system:

- Docker
- Docker Compose
- Make

## Running the API

To run the API, follow the instructions below:

### Production Mode

Use the following command to start the API in production mode:

```bash
make start
```

To stop the API in production mode:

```bash
make stop
```

To view the API's logs in production mode:

```bash
make logs
```

### Development Mode

To run the API in development mode, use the following command:

```bash
make start-dev
```

To stop the API in development mode:

```bash
make stop-dev
```

To view the API's logs in development mode:

```bash
make logs-dev
```

## Used Ports

The API uses the following ports:

- 3000: The port on which the API is running
- 8081: The port for Mongo Express (a MongoDB web-based admin tool)
- 27017: The port on which MongoDB is running (not exposed in production)

## API Endpoints

All API endpoints are accessible under the `/login` route. Here are the available endpoints:

### Get All Users

- **Endpoint**: `/`
- **Method**: GET
- **Description**: Get information about all users
- **Request Body**: N/A
- **Response**: List of all users

### Register a New User

- **Endpoint**: `/register`
- **Method**: POST
- **Description**: Register a new user
- **Request Body**:
  - `username`: User's username
  - `password`: User's password
  - `email`: User's email address
- **Response**: JSON Web Token (Token)

### Login

- **Endpoint**: `/login`
- **Method**: POST
- **Description**: Authenticate and login a user
- **Request Body**:
  - `username`: User's username
  - `password`: User's password
- **Response**: JSON Web Token (Token)

### Logout

- **Endpoint**: `/logout`
- **Method**: POST
- **Description**: Log out a user
- **Request Body**:
  - `token`: User's token
- **Response**: Success message

### Delete a User

- **Endpoint**: `/delete`
- **Method**: DELETE
- **Description**: Delete a user account
- **Request Body**:
  - `token`: User's token
- **Response**: Success message

### Delete All Users

- **Endpoint**: `/deleteAll`
- **Method**: DELETE
- **Description**: Delete all user accounts
- **Request Body**: N/A
- **Response**: Success message

### Get User Information

- **Endpoint**: `/user`
- **Method**: GET
- **Description**: Get information for a specific user
- **Request Body**:
  - `token`: User's token
- **Response**: User's information

## Database

The API uses a MongoDB database running in a Docker container. The database is not exposed to the outside world and is only accessible from within the backend container.

## Postman Examples

For your convenience, we provide a Postman collection with examples of how to interact with the API. You can import the collection from the file named 'REST-API.postman_collection.json'.

## Authors

Jules Torfs
