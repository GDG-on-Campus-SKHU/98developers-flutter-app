import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit(this._secureStorage) : super(GoogleAuthInitial()) {
    _secureStorage;
    _googleSignIn;
    _fireBaseAuth;
  }

  final FlutterSecureStorage _secureStorage;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard(scopes: ["email"]);
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  //Sign in Google account
  Future<void> signInWithGoogle() async {
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

        //Save encrypt user data
        await _secureStorage.write(key: "user_id", value: _user?.uid);
        await _secureStorage.write(key: "user_email", value: _user?.email);
        await _secureStorage.write(key: "user_name", value: _user?.displayName);
        await _secureStorage.write(key: "user_avatar", value: _user?.photoURL);

        if (_user != null) {
          emit(GoogleAuthSuccess(user: _user));
        } else {
          emit(GoogleAuthFailed(errorMessage: "Sign in failed."));
          emit(GoogleAuthLoading());
        }
      } else {
        emit(GoogleAuthFailed(errorMessage: "Canceled Google Sign in."));
      }
    } catch (error) {
      emit(GoogleAuthFailed(errorMessage: error.toString()));
    }
  }

  //Sign out Google account
  Future<void> signOutWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _fireBaseAuth.signOut();
      await _secureStorage.deleteAll();
      emit(GoogleAuthInitial());
    } catch (error) {
      emit(GoogleSignOutFailed(errorMessage: error.toString()));
    }
  }
}
