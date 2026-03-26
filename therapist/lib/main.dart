import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:therapist/core/repository/auth/auth_repository.dart';
import 'package:therapist/core/repository/therapist/therapist_repository.dart';
import 'package:therapist/presentation/widgets/snackbar_service.dart';
import 'package:therapist/provider/consultation_provider.dart';
import 'package:therapist/provider/session_provider.dart'; 
import 'package:therapist/repository/supabase_auth_repository.dart';
import 'package:therapist/repository/supabase_consultation_repository.dart';
import 'package:therapist/repository/supabase_therapist_repository.dart';

import 'package:therapist/provider/therapy_provider.dart';
import 'package:therapist/repository/supabase_therapy_repository.dart';

import 'core/utils/dependency_injector.dart';
import 'presentation/splash_screen.dart';
import 'provider/auth_provider.dart';
import 'provider/daily_activities_provider.dart';
import 'provider/home_provider.dart';
import 'provider/therapist_provider.dart';

import 'package:therapist/core/gundb/gun_sync_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await TherapistGunSyncService().init();
    TherapistGunSyncService().listenForNewSessions('user123'); // Example mock initialization
  } catch (e) {
    print("FATAL GunDB Init Error: $e");
  }
  await dotenv.load(fileName: ".env");

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  setupDependencyInjection();

  runApp(
    MultiProvider(
      providers: [
        // Auth Repository and Provider
        Provider<AuthRepository>(
          create: (context) => SupabaseAuthRepository(
            supabaseClient: null,
          ),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            authRepository: context.read<AuthRepository>(),
            supabaseClient: null,
          ),
        ),
        // Therapist Repository and Provider
        Provider<TherapistRepository>(
          create: (context) => SupabaseTherapistRepository(
            supabaseClient: null,
          ),
        ),
        ChangeNotifierProvider<TherapistDataProvider>(
          create: (context) => TherapistDataProvider(
            therapistRepository: context.read<TherapistRepository>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ConsultationProvider(SupabaseConsultationRepository())),
        ChangeNotifierProvider(create: (context) => SessionProvider(
          therapistRepository: context.read<TherapistRepository>(),
        )),
        ChangeNotifierProvider(create: (context) => TherapyProvider(therapyRepository: SupabaseTherapyRepository())),
        ChangeNotifierProvider(create: (context) => DailyActivitiesProvider(therapyRepository: SupabaseTherapyRepository())),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       scaffoldMessengerKey: SnackbarService.scaffoldMessengerKey,
      title: 'Therapist App',
      theme: ThemeData.light(),
      home: const SplashScreen(),
    );
  }
}
