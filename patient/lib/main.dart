import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:patient/core/core.dart';
import 'package:patient/core/theme/theme.dart';
import 'package:patient/presentation/splash_screen.dart';
import 'package:patient/presentation/widgets/snackbar_service.dart';
import 'package:patient/provider/appointments_provider.dart';
import 'package:patient/provider/assessment_provider.dart';
import 'package:patient/provider/auth_provider.dart';
import 'package:patient/repository/supabase_auth_repository.dart';

import 'package:patient/provider/reports_provider.dart';
import 'package:patient/repository/supabase_patient_repository.dart';

import 'package:provider/provider.dart';


import 'provider/task_provider.dart';
import 'provider/therapy_goals_provider.dart';



import 'package:patient/core/gundb/gun_sync_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PatientGunSyncService().init();
  await dotenv.load(fileName: ".env");
  
   // Add your Gemini API key here
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
        ChangeNotifierProvider(create: (_) => AssessmentProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            authRepository: SupabaseAuthRepository(
              supabaseClient: null,
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => ReportsProvider(
          patientRepository: SupabasePatientRepository(supabaseClient: null),
        )),
        ChangeNotifierProvider(create: (_) => TaskProvider(
          patientRepository: SupabasePatientRepository(supabaseClient: null),
        )),
        ChangeNotifierProvider(create: (_) => TherapyGoalsProvider(
          patientRepository: SupabasePatientRepository(supabaseClient: null),
        )),
        ChangeNotifierProvider(create: (_) => AppointmentsProvider(
          authRepository: SupabaseAuthRepository(supabaseClient: null),
          patientRepository: SupabasePatientRepository(supabaseClient: null)
        ))
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
        scaffoldMessengerKey: SnackbarService.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Patient App',
        theme: AppTheme.lightTheme(),
        home: const SplashScreen());
  }
}
