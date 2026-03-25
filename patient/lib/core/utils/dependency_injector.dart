import 'package:get_it/get_it.dart';
import 'package:patient/core/core.dart';
import 'package:patient/repository/supabase_patient_repository.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<PatientRepository>(SupabasePatientRepository(supabaseClient: null));
}
