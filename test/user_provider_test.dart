import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/providers/user_provider.dart';

void main() async {
  User _userModel;
  UserProvider auth;

  group('Provider and user model tests', () {
    //
    test('Check individual values of UserModel', () {
      _userModel = User(
          fullName: 'Dhruv Roy',
          email: 'dhruv@gmail.com',
          phoneNumber: '1234567890');

      // BEGIN TESTS....
      expect(_userModel.fullName, matches('Dhruv Roy'));
      expect(_userModel.fullName.runtimeType, equals(String));
      expect(_userModel.phoneNumber, matches('1234567890'));
      expect(_userModel.phoneNumber.runtimeType, equals(String));
      expect(_userModel.email, matches('dhruv@gmail.com'));
      expect(_userModel.email.runtimeType, equals(String));
    });

    test('Check values from user provider', () {
      auth = UserProvider(null);

      // check setUserFromUserPassword method
      auth.setUserFromUserPassword(
          "test@email.com", "test_name", "1234567890", 0, 0);

      expect(auth.isUserLoggedIn, true);
      expect(auth.loggedInUser, isNotNull);
      expect(auth.loggedInUser?.fullName!.isNotEmpty, true);
      expect(auth.loggedInUser?.fullName!, matches("test_name"));
      expect(auth.loggedInUser?.email!.isNotEmpty, true);
      expect(auth.loggedInUser?.email!, matches("test@email.com"));
      expect(auth.loggedInUser?.phoneNumber!.isNotEmpty, true);
      expect(auth.loggedInUser?.phoneNumber, matches("1234567890"));

      _userModel = User(
          fullName: 'Dhruv Roy',
          email: 'dhruv@gmail.com',
          phoneNumber: '1234567890');

      // check setUserFromUserObject method
      auth.setUserFromUserObject(_userModel);

      expect(auth.isUserLoggedIn, true);
      expect(auth.loggedInUser, isNotNull);
      expect(auth.loggedInUser?.fullName!.isNotEmpty, true);
      expect(auth.loggedInUser?.fullName, matches("Dhruv Roy"));
      expect(auth.loggedInUser?.email!.isNotEmpty, true);
      expect(auth.loggedInUser?.email, matches("dhruv@gmail.com"));
      expect(auth.loggedInUser?.phoneNumber!.isNotEmpty, true);
      expect(auth.loggedInUser?.phoneNumber, matches("1234567890"));

      // check resetUser method
      auth.resetUser();
      expect(auth.isUserLoggedIn, false);
      expect(auth.loggedInUser, isNull);
    });
  });
}
