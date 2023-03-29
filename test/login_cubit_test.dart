import 'package:flutter_test/flutter_test.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/presentation/ui/login/view-model/login_view_model.dart';

void main() {
  Injector.register();

  group("Test Login Cubit", () {
    late LoginViewModel loginCubit;

    setUp(() {
      loginCubit = locator.get<LoginViewModel>();
    });

    test("Test set phone number", () async {
      const testPhoneNumber = "994507825544";

      loginCubit.setPhoneNumber(testPhoneNumber);

      expect(loginCubit.phoneNumber, testPhoneNumber);
    });

    test("Test login with no phone number", () {
      const emptyNumber = "";

      loginCubit.setPhoneNumber(emptyNumber);

      loginCubit.login();

      expect(loginCubit.phoneNumber, isEmpty);
    });

    test("Test login with phone number", () async {
      const testPhoneNumber = "994507825544";

      loginCubit.setPhoneNumber(testPhoneNumber);

      await loginCubit.login();

      // expect(loginCubit.state, Success());
    });
  });
}
