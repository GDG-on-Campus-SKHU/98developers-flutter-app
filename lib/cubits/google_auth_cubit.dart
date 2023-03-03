import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  //Google account Sign in
  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());

    try {
      final GoogleSignInAccount? _googleAccount = await _googleSignIn.signIn();
      if (_googleAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await _googleAccount.authentication;

        final AuthCredential _credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _fireBaseAuth.signInWithCredential(_credential);
        final User? _user = userCredential.user;

        if (_user != null) {
          emit(GoogleAuthSuccess(user: _user));
        } else {
          emit(GoogleAuthFailed(errorMessage: "Sign in failed."));
        }
      } else {
        emit(GoogleAuthFailed(errorMessage: "Cancelled Google Sign in."));
      }
    } catch (error) {
      emit(GoogleAuthFailed(errorMessage: error.toString()));
    }
  }

  //Google account sign out
  Future<void> signOutWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _fireBaseAuth.signOut();
      emit(GoogleAuthInitial());
    } catch (error) {
      emit(GoogleAuthFailed(errorMessage: error.toString()));
    }
  }
}
