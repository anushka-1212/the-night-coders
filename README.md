# E-Learning Platform

A comprehensive web-based e-learning system designed for college environments, facilitating seamless communication between students and faculty while streamlining course management.

## Features

- User Authentication (Students, Faculty, Admin)
- Course Management
- Assignment Submission and Grading
- Real-time Communication
- Live Class Streaming
- Progress Tracking
- AI-based Course Recommendations
- Gamification and Leaderboard
- Plagiarism Detection

## Project Structure

```
e-learning-platform/
├── client/                 # React frontend
├── server/                 # Node.js backend
│   ├── controllers/        # Route controllers
│   ├── models/             # Database models
│   ├── routes/             # API routes
│   ├── middleware/         # Custom middleware
│   └── utils/              # Utility functions
├── .env                    # Environment variables
├── package.json            # Project dependencies
└── README.md               # Project documentation
```

## Prerequisites

- Node.js (v14 or higher)
- MongoDB
- npm or yarn

## Setup Instructions

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   cd client
   npm install
   ```
3. Create a `.env` file in the root directory with the following variables:
   ```
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/elearning
   JWT_SECRET=your_jwt_secret_key
   NODE_ENV=development
   EMAIL_SERVICE=gmail
   EMAIL_USER=your_email@gmail.com
   EMAIL_PASSWORD=your_email_password
   ```
4. Start the development server:
   ```bash
   npm run dev:full
   ```

## API Documentation

The API documentation will be available at `http://localhost:5000/api-docs` once the server is running.

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

# GitHub Push Script

This script helps you push your code to GitHub with minimal effort. It handles the initialization of Git repository, adding files, committing changes, and pushing to GitHub.

## Prerequisites

- Git installed on your system
- GitHub account
- GitHub repository created (if not, the script will help you set it up)

## Usage

1. Make the script executable:
   ```bash
   chmod +x push_to_github.sh
   ```

2. Run the script:
   ```bash
   ./push_to_github.sh
   ```

3. Follow the prompts:
   - Enter a commit message when prompted
   - If it's your first time using the script, enter your GitHub repository URL

## What the Script Does

1. Checks if Git is installed
2. Initializes Git repository if not already initialized
3. Adds all files to staging
4. Prompts for commit message
5. Commits the changes
6. Sets up remote origin if not already configured
7. Pushes the code to GitHub

## Troubleshooting

If you encounter any issues:

1. Make sure Git is installed and configured with your GitHub credentials
2. Verify your GitHub repository URL is correct
3. Check your internet connection
4. Ensure you have write access to the repository

## Security Note

This script will push all files in the current directory to GitHub. Make sure you don't have any sensitive information (like API keys or passwords) in your files before pushing. 