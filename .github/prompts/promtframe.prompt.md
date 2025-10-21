---
mode: edit
---

# Mobile App UI Prompt for Fisheries Management

This prompt describes main screens and flows required for the mobile application, targeting fishermen and fleet managers. Use Flutter + Dart best practices.

## Authentication & Onboarding

- Login screen (enter vessel code & password, remember session, forgot password)
- Welcome tutorial for first-time users (usage instructions)
- User profile (account information, vessel link, change password)

## Dashboard & Navigation

- Main dashboard (current vessel status, latest VMS info, real-time alerts)
- Bottom navigation: Home, Maps, Logbook, Alerts, Profile
- Drawer menu: Settings, Help, About, Logout

## Maps & GPS Tracking

- Map display (vessel location, boundaries, legal fishing zones, real-time tracking)
- Waypoint detail (coordinates, timestamp, distance from shore)
- Route history (view previous trip routes, review movement logs)

## Fishing Logbook Management

- Logbook list (entries by day, sync status)
- Create/Edit logbook entry (catch type, weight, GPS, photo evidence, time)
- Logbook details (edit/delete entry)
- Camera integration (photo capture for logbook evidence)

## Crew & Document Management

- Crew list for each trip (display all crew, add/edit member info)
- Add crew form (input ID, photo)
- Document upload (permits, licenses, contracts)
- Approval status panel (see document acceptance by authority)

## Alerts & Notifications

- Alert list (weather, zone violations, offline events)
- Alert detail (description, required action)
- Push notification settings (enable/disable types)

## Weather & Safety

- Weather forecast (3–7 days, current sea region)
- Storm alert (real-time storm tracking, safe harbor suggestion)
- SOS button (send emergency coordinates, contact rescue service)

## Offline Sync

- Sync status screen (unsynced data, connection indicator)
- Settings: manual/auto sync, last successful sync timestamp

> All screens must fully support Vietnamese & English UI.
> All business logic strictly follows provided backend APIs and domain rules.
