---
applyTo: "**"
---

# Copilot Custom Instructions for Flutter Fisheries Management App

## General

- Only use Flutter with the Dart language.
- All app code must follow clean architecture. Separate business logic, presentation, and data layers (see Official Flutter Clean Architecture).
- Code must be readable: descriptive variable/function/class names (English, camelCase for variables, PascalCase for classes, snake_case for files).
- All user-facing text (labels, errors, help) must retrieve from internationalization (i18n) resources, defaulting to Vietnamese if available.
- All networking and backend communication use provided REST API endpoints. Handle all HTTP/network errors gracefully.

## UI/UX & State Management

- UI must be accessible, mobile friendly, and responsive.
- Use provider or riverpod for state management. Bloc is allowed only with justification.
- All screens/components are stateless where possible. Use stateful widgets only when necessary.
- Design follows Material Design 3 guidelines, but allow customization for domain branding as required.

## Security, Compliance, and Data Handling

- Persist only strictly required auth/session data on device using Flutter Secure Storage.
- Location, photo, and personal data access require explicit user consent.
- All sensitive data in-app must be encrypted at rest and over network (prefer HTTPS only).
- Support offline-first use case with automatic sync & local caching (use SQLite/local persistence; resolve conflicts upon re-sync).

## Testing, Documentation, CI

- Write unit and widget tests covering core flows (min. coverage: 70%).
- Add code comments for functions/classes, especially for domain/business logic.
- All API models and data DTOs must have documentation and type safety.
- Follow best practices for async code and error handling (prefer async/await, avoid callback hell).
- All code changes should pass lint, formatting rules, and CI checks before merging.

> If facing an ambiguity in requirements, prefer security, scalability, and maintainability. Always document assumptions and edge cases.

## Context

Project Context: Fisheries Management System (Mobile App)
This mobile application is part of a large-scale national project to monitor, manage, and report real-time activity of fishing vessels in Vietnam. The app is designed to empower government agencies and large seafood businesses to track fishing trips, vessel movements, IUU compliance, crew, and real-time documentation.

Primary users: vessel owners/captains, crew, port authorities, and government agencies.
Business goals: increase sustainability, transparency, data traceability; comply with IUU, EU and local legal regulations; support proof of fishing activities for legal trade/export; improve safety and reduce paperwork.

App features support:
Real-time vessel tracking (VMS data, GPS, zone entry/exit detection)
Digital catch logbook, route history, waypoints, geofencing alerts
Crew and voyage management (crew docs, ID, shift logs, permissions)
Document approval and compliance workflow (permit request/approval, rejection status)
Weather alert, SOS, offline operation and reliable sync
Secure, role-based login per vessel with unique IDs
Data persistence when offline, local sync queue, business logic validation before syncing
Multi-language: Vietnamese/English support for all screens
Reports and summaries for port inspectors, compliance, and auditing
