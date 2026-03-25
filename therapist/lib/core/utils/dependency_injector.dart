import 'package:get_it/get_it.dart';
import 'package:therapist/core/core.dart';
import 'package:therapist/repository/supabase_therapist_repository.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<TherapistRepository>(SupabaseTherapistRepository(supabaseClient: null));
}
