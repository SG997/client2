import 'package:flutter_test/flutter_test.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/presentation/ui/otp/cubit/otp_view_model.dart';

void main() {
  Injector.register();

  group("Otp Cubit Test", () {
    late OtpViewModel otpCubit;

    setUp(() {
      otpCubit = locator.get<OtpViewModel>();
    });

    // test("Test state to be initial", () {
    //   expect(otpCubit.state, Initial());
    // });
    //
    // test("Test stream initialized", () {
    //   expect(otpCubit.nextButtonActivationStream, isInstanceOf<Stream<bool>>());
    // });
    //
    // test("Test to set pin", () {
    //   const String pin = "1234";
    //   otpCubit.setPin(pin);
    //   expect(otpCubit.nextButtonActivationStream, emitsInOrder([true]));
    // });
    //
    // test("Test to set pin with empty string", () {
    //   const String pin = "";
    //   otpCubit.setPin(pin);
    //   expect(otpCubit.nextButtonActivationStream, emitsInOrder([false]));
    // });
    //
    // test("Test to set pin with null", () {
    //   const String? pin = null;
    //   otpCubit.setPin(pin);
    //   expect(otpCubit.nextButtonActivationStream, emitsInOrder([false]));
    // });
    //
    // test("Test to confirm", () async {
    //   const testPin = "1234";
    //   otpCubit.setPin(testPin);
    //   await otpCubit.confirm();
    //   expect(otpCubit.state, Success());
    // });
  });
}
