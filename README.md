# 🏥 Doctora - Doctor Appointment Booking System

A full-stack web application for booking doctor appointments with real-time availability management.

## 🌟 Features

### For Patients
- 🔍 Browse doctors by specialty
- 📅 View doctor availability in real-time
- 🎯 Smart doctor selection based on schedule
- 📝 Book appointments with patient information
- 📜 View appointment history
- 👤 Manage profile

### For Doctors
- 📊 Dashboard with appointment overview
- 📅 Manage availability schedule
- ✅ Approve/reject appointments
- 📋 View patient booking information
- 🔔 Queue management

### For Admins
- 👥 Manage doctors and specialties
- 📊 View system statistics
- 🏥 Add/edit/remove doctors
- 📈 Monitor bookings

## 🛠️ Tech Stack

### Backend
- **Framework:** Spring Boot 3.5.5
- **Language:** Java 21
- **Database:** PostgreSQL 15
- **Security:** JWT Authentication
- **Migration:** Flyway
- **Build:** Maven

### Frontend
- **Framework:** Next.js 15
- **Language:** TypeScript
- **Styling:** Tailwind CSS 4
- **UI Components:** Radix UI, Lucide Icons
- **PDF Generation:** jsPDF

### DevOps
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Deployment:** Railway / AWS / Vercel

## 🚀 Quick Start

### Prerequisites
- Java 21+
- Node.js 20+
- PostgreSQL 15+
- Docker (optional)

### Local Development

#### 1. Clone Repository
```bash
git clone https://github.com/YOUR_USERNAME/FullStack-Doctora.git
cd FullStack-Doctora
```

#### 2. Setup Database

**Option A: Using Docker**
```bash
docker-compose -f doctora-spring-boot/docker-compose.yml up -d
```

**Option B: Local PostgreSQL**
```bash
# Create database
createdb doctorbook

# Or using psql
psql -U postgres
CREATE DATABASE doctorbook;
```

#### 3. Configure Backend

```bash
cd doctora-spring-boot

# Copy environment file
cp .env.example .env

# Edit .env with your database credentials
nano .env
```

Required variables in `.env`:
```env
DB_HOST=localhost
DB_PORT=5435
DB_NAME=doctorbook
DB_USERNAME=admin
DB_PASSWORD=password
JWT_SECRET=your-secret-key
```

#### 4. Run Backend

```bash
# Using Maven
./mvnw spring-boot:run

# Or with installed Maven
mvn spring-boot:run

# Backend runs on: http://localhost:8082
```

#### 5. Configure Frontend

```bash
cd ../FrontendDoctora

# Copy environment file
cp .env.example .env.local

# Edit .env.local
nano .env.local
```

Required variables in `.env.local`:
```env
NEXT_PUBLIC_API_BASE_URL=http://localhost:8082
```

#### 6. Run Frontend

```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Frontend runs on: http://localhost:3000
```

#### 7. Access Application

- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8082/api
- **Health Check:** http://localhost:8082/api/health

### Test Accounts

After initial setup, you can create accounts or use:

**Admin Account:** (if seeded)
- Email: admin@doctora.com
- Password: admin123

**Doctor Account:** (created via admin panel)
- Check database after seeding

## 🐳 Docker Deployment

### Development
```bash
docker-compose -f docker-compose.dev.yml up -d
```

### Production
```bash
# Copy environment template
cp .env.docker .env

# Edit .env with production values
nano .env

# Build and run
docker-compose -f docker-compose.production.yml up -d --build
```

## 📚 Documentation

- **[Deployment Guide](DEPLOYMENT_GUIDE.md)** - Comprehensive deployment instructions
- **[Railway Deployment](RAILWAY_DEPLOYMENT.md)** - Step-by-step Railway deployment
- **[Docker Guide](DOCKER_GUIDE.md)** - Docker usage and troubleshooting

## 🏗️ Project Structure

```
FullStack-Doctora/
├── doctora-spring-boot/          # Backend (Spring Boot)
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/.../
│   │   │   │   ├── controller/   # REST Controllers
│   │   │   │   ├── service/      # Business Logic
│   │   │   │   ├── repository/   # Data Access
│   │   │   │   ├── model/        # Entities
│   │   │   │   ├── dto/          # Data Transfer Objects
│   │   │   │   └── config/       # Configuration
│   │   │   └── resources/
│   │   │       ├── db/migration/ # Flyway Migrations
│   │   │       └── application.properties
│   │   └── test/
│   ├── Dockerfile
│   ├── pom.xml
│   └── .env.example
│
├── FrontendDoctora/               # Frontend (Next.js)
│   ├── app/                       # Pages
│   │   ├── (auth)/                # Auth pages
│   │   ├── admin/                 # Admin dashboard
│   │   ├── doctor-*/              # Doctor pages
│   │   └── patient-*/             # Patient pages
│   ├── components/                # Reusable components
│   ├── lib/                       # Utilities & Services
│   ├── context/                   # React Context
│   ├── types/                     # TypeScript types
│   ├── Dockerfile
│   ├── package.json
│   └── .env.example
│
├── .github/
│   └── workflows/                 # CI/CD Pipelines
├── docker-compose.production.yml
├── docker-compose.dev.yml
└── README.md
```

## 🔑 Key Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login
- `GET /api/users/me` - Get current user

### Public
- `GET /api/specialties` - List specialties
- `GET /api/doctors` - List doctors
- `GET /api/doctors/{id}` - Get doctor details
- `GET /api/availability/doctor/{id}` - Get doctor availability

### Protected (Requires Auth)
- `POST /api/appointments` - Create appointment
- `GET /api/appointments/user` - Get user appointments
- `PUT /api/appointments/{id}/approve` - Approve appointment (Doctor)
- `PUT /api/appointments/{id}/reject` - Reject appointment (Doctor)

### Admin Only
- `POST /api/admin/doctors` - Create doctor
- `PUT /api/admin/doctors/{id}` - Update doctor
- `DELETE /api/admin/doctors/{id}` - Delete doctor

### Health Check
- `GET /api/health` - Service health status
- `GET /api/health/ping` - Simple ping
- `GET /api/health/ready` - Readiness check
- `GET /api/health/live` - Liveness check

## 🧪 Testing

### Backend Tests
```bash
cd doctora-spring-boot
mvn test
```

### Frontend Linting
```bash
cd FrontendDoctora
npm run lint
```

## 🔒 Security

- JWT-based authentication
- Password hashing (BCrypt)
- CORS configuration
- SQL injection prevention (JPA)
- Input validation
- Role-based access control (RBAC)

## 🚀 Deployment

### Railway (Recommended)
See [RAILWAY_DEPLOYMENT.md](RAILWAY_DEPLOYMENT.md) for detailed instructions.

**Quick Deploy:**
1. Push to GitHub
2. Connect Railway to repo
3. Add PostgreSQL database
4. Configure environment variables
5. Deploy!

### AWS / GCP / Azure
See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

### Vercel + Render
- Frontend: Deploy to Vercel
- Backend: Deploy to Render

## 📊 Database Schema

Key tables:
- `users` - User accounts (patients, doctors, admins)
- `doctors` - Doctor profiles
- `specialties` - Medical specialties
- `appointments` - Appointment bookings
- `patient_booking_info` - Patient information at booking
- `availabilities` - Doctor availability schedules
- `reviews` - Doctor reviews (future)

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📝 License

This project is licensed under the MIT License.

## 👥 Authors

- **Your Name** - Initial work

## 🙏 Acknowledgments

- Spring Boot Team
- Next.js Team
- All open source contributors

## 📞 Support

- Create an issue for bug reports
- Email: your-email@example.com
- Documentation: See `/docs` folder

## 🗺️ Roadmap

- [ ] Email notifications
- [ ] SMS reminders
- [ ] Payment integration
- [ ] Video consultation
- [ ] Mobile app (React Native)
- [ ] Advanced search filters
- [ ] Doctor ratings & reviews
- [ ] Multi-language support
- [ ] Calendar sync (Google Calendar)
- [ ] Medical records storage

## 📈 Status

- ✅ Core features complete
- ✅ Ready for deployment
- 🚧 Testing in progress
- 📋 Documentation complete

---

**Made with ❤️ for better healthcare access**

---

## 📸 Screenshots

### Homepage
![Homepage](docs/screenshots/homepage.png)

### Doctor Booking
![Booking](docs/screenshots/booking.png)

### Doctor Dashboard
![Dashboard](docs/screenshots/dashboard.png)

*Screenshots coming soon...*

---

**Star ⭐ this repo if you find it helpful!**
