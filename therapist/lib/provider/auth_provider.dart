import 'package:flutter/material.dart';
import 'package:therapist/core/entities/auth_entities/therapist_personal_info_entity.dart';
import 'package:therapist/core/repository/auth/auth_repository.dart';
import 'package:therapist/core/result/result.dart';
import 'package:therapist/presentation/auth/personal_details_screen.dart';
import 'package:therapist/presentation/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthProvider({
    required AuthRepository authRepository,
    dynamic supabaseClient,
  }) : _authRepository = authRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  String? _userId;
  String? get userId => _userId;

  String? _userEmail;
  String? get userEmail => _userEmail;

  late String _userName = 'Mock Therapist';
  String get userName => _userName;

  bool _isNewUser = true;
  bool get isNewUser => _isNewUser;

  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final result = await _authRepository.signInWithGoogle();

      if (result is ActionResultSuccess) {
        _isAuthenticated = true;
        _userId = "mockuserid";
        _userEmail = "mock@example.com";
        _userName = "Mock Name";
        _isNewUser = false; // Store if user is new
        _errorMessage = '';
      } else if (result is ActionResultFailure) {
        _errorMessage = result.errorMessage!;
        _isAuthenticated = false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isAuthenticated = false;
    }

    _isLoading = false;
    notifyListeners();
    return _isAuthenticated;
  }

  Future<bool> storePersonalInfo(dynamic personalInfoEntity) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    bool success = true;

    _isLoading = false;
    notifyListeners();
    return success;
  }

  Future<void> checkAuthentication() async {
    _userId = "mockuserid";
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<bool> checkIfUserIsNew() async {
    _isNewUser = false;
    notifyListeners();
    return _isNewUser;
  }

  Map<String, dynamic>? getUserMetadata() {
    return {"full_name": "Mock Therapist"};
  }

  void navigateBasedOnUserStatus(BuildContext context) {
    if (_isNewUser) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PersonalDetailsScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }
}
