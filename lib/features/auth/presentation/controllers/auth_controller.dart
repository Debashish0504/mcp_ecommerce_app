import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcp_ecommerce_app/features/auth/domain/entities/user.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  bool get isAuthenticated => user != null;
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // Simulate login API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock successful login
      final user = User(
        id: '1',
        email: email,
        name: 'John Doe',
        avatar: null,
        createdAt: DateTime.now(),
      );
      
      state = state.copyWith(
        user: user,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // Simulate signup API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock successful signup
      final user = User(
        id: '1',
        email: email,
        name: name,
        avatar: null,
        createdAt: DateTime.now(),
      );
      
      state = state.copyWith(
        user: user,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    state = const AuthState();
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(),
);
