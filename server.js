const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const dotenv = require('dotenv');
const socketio = require('socket.io');
const path = require('path');

// Load environment variables
dotenv.config();

// Import routes
const userRoutes = require('./server/routes/userRoutes');
const courseRoutes = require('./server/routes/courseRoutes');

// Initialize Express app
const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Database connection
mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('MongoDB connection error:', err));

// Routes
app.use('/api/users', userRoutes);
app.use('/api/courses', courseRoutes);

// Basic route
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to E-Learning Platform API' });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!' });
});

// Start server
const PORT = process.env.PORT || 5000;
const server = app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

// Socket.io setup
const io = socketio(server, {
  cors: {
    origin: "http://localhost:3000",
    methods: ["GET", "POST"]
  }
});

// Socket.io event handlers
io.on('connection', (socket) => {
  console.log('New client connected');
  
  // Join course room
  socket.on('join-course', (courseId) => {
    socket.join(courseId);
    console.log(`User joined course: ${courseId}`);
  });

  // Leave course room
  socket.on('leave-course', (courseId) => {
    socket.leave(courseId);
    console.log(`User left course: ${courseId}`);
  });

  // Handle chat messages
  socket.on('chat-message', (data) => {
    io.to(data.courseId).emit('new-message', {
      user: data.user,
      message: data.message,
      timestamp: new Date()
    });
  });

  socket.on('disconnect', () => {
    console.log('Client disconnected');
  });
}); 