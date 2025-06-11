import 'package:go_router/go_router.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/create_session_page.dart';
import '../../presentation/screens/history_page.dart';
import '../../presentation/screens/timer_page.dart';
import '../../presentation/screens/settings_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final userName = state.extra as String? ?? 'Usuario';
        return HomeScreen(userName: userName);
      },
    ),
    GoRoute(
      path: '/create-session',
      builder: (context, state) => CreateSessionPage(),
    ),
    GoRoute(path: '/history', builder: (context, state) => HistoryPage()),
    GoRoute(path: '/timer', builder: (context, state) => TimerPage()),
    GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
  ],
);
