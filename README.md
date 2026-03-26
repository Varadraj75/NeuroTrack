# NeuroTrack

> An offline-first Flutter monorepo for automated neurodevelopmental screening and therapy management.

[Figma Design](https://www.figma.com/design/bqKZn8UnfkyLbxaaWzSKtp/neurotrack?node-id=0-1&t=ipx4aQhq1BGIXsTb-1)

## Core Purpose

NeuroTrack aims to:

- Automate preliminary screening assessments for neurodevelopmental conditions (ASD, ADHD)
- Connect individuals with qualified therapists based on assessment results
- Facilitate personalized education and therapy plans
- Track therapy progress using data-driven approaches
- Enable real-time session synchronization between Patient and Therapist apps
- Empower patients/caregivers to actively participate in the therapy process

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | Flutter (Patient App + Therapist App) |
| **Local Database** | Drift (SQLite) — offline-first persistence |
| **Real-Time Sync** | WebSocket broadcast server (Node.js) |
| **State Management** | Provider + ChangeNotifier |
| **Styling** | Google Fonts (Poppins) + custom AppTheme |

## Project Structure

```
NeuroTrack/
├── patient/                  # Patient Flutter application
│   └── lib/
│       ├── core/
│       │   ├── gundb/        # WebSocket sync service
│       │   ├── local_db/     # Drift database (patients, therapists, consultations, activities)
│       │   └── theme/        # AppTheme with primary purple/indigo palette
│       ├── presentation/
│       │   ├── assessment/   # Assessment results screen
│       │   ├── home/         # Home screen with therapy goals + GunDB test button
│       │   ├── profile/      # Profile screen + Data Sync screen
│       │   ├── therapist/    # Find a Therapist screen
│       │   ├── chatbot/      # AI chatbot screen
│       │   ├── games/        # Therapeutic games
│       │   └── ...
│       ├── provider/         # State management (auth, sessions, tasks, reports)
│       ├── repository/       # Data access layer
│       └── model/            # Data models
├── therapist/                # Therapist Flutter application
│   └── lib/
│       ├── core/
│       │   ├── gundb/        # WebSocket sync listener service
│       │   └── local_db/     # Drift database (sessions, patients, therapists)
│       ├── presentation/
│       │   ├── session/      # Schedule screen with session cards
│       │   └── ...
│       ├── provider/         # SessionProvider with real-time sync callback
│       └── repository/       # Data access layer
├── gun-relay/                # WebSocket broadcast relay server
│   ├── broadcast-server.js   # Plain WebSocket broadcaster
│   ├── server.js             # Legacy GunDB relay (deprecated)
│   └── package.json
└── shared/                   # Shared utilities
```

## Architecture

### Offline-First with Drift

Both apps use [Drift](https://drift.simonbinder.eu/) (SQLite) as the local database. All reads and writes go through Drift first, so both apps work fully offline.

**Patient DB Tables:** `Patients`, `Therapists`, `ConsultationRequests`, `DailyActivities`

**Therapist DB Tables:** `Sessions`, `Patients`, `Therapists`

### Real-Time Sync via WebSocket

A lightweight Node.js WebSocket broadcast server relays messages between the two apps:

```
Patient App ──→ WebSocket ──→ Broadcast Server ──→ WebSocket ──→ Therapist App
                                    │
                          (broadcasts to all
                           connected clients
                           except sender)
```

- **Patient** opens a persistent WebSocket connection on app boot
- **Therapist** listens on a persistent WebSocket connection for `NEW_BOOKING` messages
- Incoming bookings are parsed from JSON, inserted into Drift, and the UI refreshes via `notifyListeners()`
- The Therapist app clears stale sessions from the local DB on every fresh start

---

## Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Node.js v18+
- Android Emulator(s) or physical device(s)

### 1. Clone the Repository

```bash
git clone https://github.com/Varadraj75/NeuroTrack.git
cd NeuroTrack
```

### 2. Start the WebSocket Broadcast Server

```bash
cd gun-relay
npm install
node broadcast-server.js
```

You should see:
```
Broadcast server running on ws://localhost:8765
```

> Keep this terminal open — both apps connect to this server.

### 3. Patient App Setup

```bash
cd patient
```

Install dependencies and run:
```bash
flutter pub get
flutter run
```

### 4. Therapist App Setup

```bash
cd therapist
```

Install dependencies and run:
```bash
flutter pub get
flutter run
```

> **Tip:** If running two emulators simultaneously, specify the device:
> ```bash
> flutter run -d emulator-5554  # Patient
> flutter run -d emulator-5556  # Therapist
> ```

---

## Key Features Implemented

### Patient App

| Feature | Screen | Description |
|---------|--------|-------------|
| **Assessment Results** | `assessment_results_screen.dart` | Displays AQ score (e.g. 7/10) with Low/Moderate/High pill selector, description card, and disclaimer |
| **Find a Therapist** | `find_therapist_screen.dart` | Filterable therapist list with specialization chips (ASD/ADHD) and request button |
| **Profile** | `profile_screen.dart` | User info card, subscription plan with circular progress, menu with Export/Import/Logout |
| **Data Sync** | `data_sync_screen.dart` | Sync status, storage info, cache clearing with Drift integration |
| **Home Dashboard** | `home_screen.dart` | Welcome screen with therapy goals, daily activities, games, and GunDB test button |
| **Session Booking Sync** | `PatientGunSyncService` | Persistent WebSocket connection that broadcasts `NEW_BOOKING` JSON to relay server |

### Therapist App

| Feature | Screen | Description |
|---------|--------|-------------|
| **Schedule** | `session_screen.dart` | Day selector, filter tabs (All/Pending/Cancelled/Completed), session cards |
| **Real-Time Sync** | `TherapistGunSyncService` | WebSocket listener that parses `NEW_BOOKING` events, inserts into Drift, triggers UI refresh |
| **Session Management** | `SessionProvider` | Provider with `clearAllSessions()`, `fetchTherapistSessions()`, and real-time callback from sync service |

### WebSocket Broadcast Server

- Plain WebSocket server on port `8765`
- Receives any message from a client and broadcasts it to **all other connected clients**
- Logs all connections, disconnections, and broadcasted messages
- Zero dependencies beyond the `ws` npm package

---

## Real-Time Sync Flow (POC)

1. **Therapist app boots** → clears local DB → connects to `ws://10.0.2.2:8765` → starts listening
2. **Patient presses "TEST GunDB BOOKING"** → sends JSON payload through persistent WebSocket:
   ```json
   {
     "type": "NEW_BOOKING",
     "patientId": "test_patient_001",
     "sessionTime": "2026-03-27T01:00:00.000",
     "status": "booked",
     "message": "GunDB sync working",
     "timestamp": 1743020400000
   }
   ```
3. **Broadcast server** relays the message to all other connected clients
4. **Therapist app** receives → parses JSON → checks `type == NEW_BOOKING` → inserts into Drift `sessions` table → calls `onSessionsUpdated` → `SessionProvider.fetchTherapistSessions()` → UI rebuilds with new card

---

## Patient Application Flow

### Authentication & Onboarding
- Sign up/sign in via Google/Apple authentication
- Profile setup for self (18+) or as a caregiver for a child
- Basic demographic information and existing diagnoses

### Assessment Process
- Evidence-based assessments for ASD, ADHD, and other conditions
- Interactive questionnaires analyzed against clinical baselines
- Results with likelihood indicators, severity assessment, and professional consultation recommendations

### Consultation Connection
- View therapist profiles with relevant specializations
- Filter by specialty (ASD, ADHD)
- Request consultation appointments

### Therapy Management
- View personalized therapy plans
- Access scheduled sessions (in-person or telehealth)
- Review session outcomes and progress reports

### Daily Activities Dashboard
- Access daily prescribed activities assigned by therapist
- Mark activities as completed
- View progress charts and achievement tracking

---

## Therapist Application Flow

### Authentication & Verification
- Professional sign up with credential verification
- Admin approval process before full platform access

### Patient Management
- Dashboard with assessment results, consultation requests, and appointments
- Current patient roster and session management

### Therapy Session Management
- Schedule and manage therapy sessions
- Record detailed session outcomes
- Assign and monitor daily activities

### Progress Reporting
- Generate detailed progress reports
- Track long-term development across key domains
- Visualize improvement trends

---

## Development Notes

### WebSocket URL Convention
Both Flutter apps connect to `ws://10.0.2.2:8765` — this is Android emulator's alias for `localhost` on the host machine.

### Database Reset
The Therapist app automatically clears its `sessions` table on every fresh start to prevent stale data from previous test runs.

### Color Palette
| Token | Value | Usage |
|-------|-------|-------|
| Primary | `#6366F1` | Buttons, active states, nav highlights |
| Secondary | `#7A86F8` | Accents |
| Background | `#FFFFFF` | Scaffold background |
| Text | `#1F2937` | Primary text |
| Subtitle | `#6B7280` | Secondary text, labels |

---

## License

See [COPYRIGHT.md](COPYRIGHT.md) for details.
