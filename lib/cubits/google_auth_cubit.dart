import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zikiza/utilities/constants.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  GoogleAuthCubit() : super(GoogleAuthInitial());

  
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

        if (_user != null) {
          
          final _currentIdToken = await _fireBaseAuth.currentUser!.getIdToken();
          String _idToken = _currentIdToken;
          
          
          await _secureStorage.write(key: "id_token", value: _idToken);
          await _secureStorage.write(key: "user_identifier", value: _user.uid);
          
          
          final verifiedIdToken = await _secureStorage.read(key: "id_token");
          
          emit(GoogleAuthSuccess(user: _user));
          getUserData(verifiedIdToken!);
        } else {
          emit(GoogleAuthFailed(
              message: "Sign in failed. Re-try Sign-in flow."));
          emit(GoogleAuthInitial());
        }
      } else {
        emit(GoogleAuthFailed(message: "Google Sign in canceled."));
      }
    } catch (error) {
      if (error is PlatformException && error.code == "sign_in_canceled") {
        print("${error}");
        emit(GoogleAuthInitial());
      } else {
        log("${error}");
      }
    }
  }

  Future<void> getUserData(String idToken) async {

    try {
      var response = await http.get(
        Uri.parse(Constants.host + Constants.users),
        headers: {"Authorization": "Bearer " + idToken.toString()},
      );

      if (response.statusCode == 200) {
        final response_data = response.body;
        log("getUserData(): [200]Http get user data successfully.\n${response_data}");
      } else if (response.statusCode == 401) {
        final response_data = response.body;
        log("getUserData(): [401]Not valid access token.\n${response_data}");
      } else if (response.statusCode == 403) {
        final response_data = response.body;
        log("getUserData(): [403]Http get user data failed.\n${response_data}");
      }
    } catch (error) {
      return log("${error}");
    }
  }

  
  Future<void> signOutWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _fireBaseAuth.signOut();
      await _secureStorage.deleteAll();
      emit(GoogleAuthInitial());
    } catch (error) {
      emit(GoogleSignOutFailed(message: error.toString()));
    }
  }
}
