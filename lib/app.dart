import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/mis_creditos_screen.dart';
import 'screens/mis_tarjetas_screen.dart';
import 'screens/operaciones_screen.dart';
import 'screens/perfil_screen.dart';

const Color primaryColor = Color(0xFF1B3670);
const Color secondaryColor = Color(0xFFFFCC00);
const Color accentColor = Color(0xFFE52421);
const Color background = Color(0xFFF6F4F5);

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/dashboard', builder: (_, __) => const DashboardScreen()),
      GoRoute(path: '/creditos', builder: (_, __) => const MisCreditosScreen()),
      GoRoute(path: '/tarjetas', builder: (_, __) => const MisTarjetasScreen()),
      GoRoute(path: '/operaciones', builder: (_, __) => const OperacionesScreen()),
      GoRoute(path: '/perfil', builder: (_, __) => const PerfilScreen()),
    ],
  );
});

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Prymera — App Cliente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, primary: primaryColor, secondary: secondaryColor),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(backgroundColor: primaryColor, foregroundColor: Colors.white, elevation: 0),
      ),
      routerConfig: router,
    );
  }
}
