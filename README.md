# TECH_NOTES.md

## Project Architecture

This project follows a **Clean Architecture** approach, separating concerns into distinct layers:

1. **Domain Layer**
   - Entities (`Business`) and repository interfaces (`BusinessRepository`).
   - Defines contracts without knowing implementation details.
   - Includes DTOs (`BusinessDto1`) for mapping from external data.

2. **Data Layer**
   - **LocalDataSource**: Loads JSON from assets; offline-ready.
   - **RemoteDataSource**: Uses Dio for networking, even if data is local/fake.
   - **Repository** (`BusinessRepositoryImpl`) merges local + remote data.
   - **Mappers** normalize messy JSON keys into clean domain models.

3. **Presentation Layer**
   - Uses **Provider** for state management (`BusinessProvider`).
   - Handles loading, error, empty, and data states.
   - UI (`BusinessListScreen`, `BusinessCard`) reacts to provider state.
   - Supports pull-to-refresh and retry mechanisms.

4. **App Initialization**
   - `AppInitializer` and `runApplication()` centralize DI and provider setup.
   - Separates initialization from `main()` and improves testability.

---

## Key Trade-offs

| Decision | Trade-off / Reasoning |
|----------|---------------------|
| **Provider over Riverpod** | Simpler, less boilerplate, but less flexible for advanced DI. |
| **Either for errors** | Explicit and type-safe error handling; adds verbosity. |
| **Local + Remote DataSources** | Guarantees offline support; increases repository complexity. |
| **DTO + Mapper** | Cleans messy JSON and validates data; adds extra boilerplate. |
| **Pull-to-refresh** | Improves UX; duplicates some provider loading logic. |
| **AppInitializer abstraction** | Improves testability and modularity; adds extra layer over `main()`. |

---

## Current Features

- Separation of concerns via **domain, data, and presentation layers**.
- **State management with Provider**.
- **Explicit error handling** with `Failure` and `Either`.
- **Offline support** using local JSON cache.
- **Pull-to-refresh** and retry mechanism.
- **Normalized domain model** from messy JSON keys.
- **Reusable `BusinessCard` widget** supporting generics.
- **Microtask-based initial data loading** to avoid `BuildContext` issues.
- **Search with relevance ranking**: Users can search businesses by any field (name, location, phone number), and results are sorted by how closely they match the query.


---

## Known Limitations / Areas for Improvement

- **Caching**: Only in-memory via provider; persistent storage (Hive, SharedPreferences) could improve offline behavior.
- **Repository Enhancements**: Remote calls are simulated; real backend integration needed.
- **DTO Mappers**: Some manual adjustments remain; mapper code could be reduced with full codegen.
- **Testing**: Limited unit/widget tests; coverage should be extended.
- **UI**: Minimal `BusinessCard` design; could leverage Material 3 features, elevation, animations.
- **Search & Sorting**: Basic search only; multi-field and fuzzy search not implemented.
- **Scalability**: Provider is simple; larger apps may require Riverpod or other state management.

---

## Future Improvements with More Time

- Implement **persistent caching** for offline-first functionality.
- Integrate **real REST API** or GraphQL backend.
- Add **unit tests** and **widget tests** for repository, provider, and UI.
- Enhance **BusinessCard UI** with richer Material 3 theming and animations.
- Refactor **SearchCriteria** for flexible multi-field search.
- Consider **Riverpod** for more scalable DI and state management.
- Add **pagination** and **infinite scrolling** for large datasets.
- Improve **error handling and logging** (e.g., Sentry, Crashlytics).
