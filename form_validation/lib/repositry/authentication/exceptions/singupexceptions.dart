import 'dart:convert';

class SignUpError {
  final String errorMsg;

  const SignUpError([this.errorMsg = "An Error Occured"]);

  factory SignUpError.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpError("Please Enter a Stronger Password.");
      case 'invalid-email':
        return const SignUpError("Email is not valid or badly formatted.");
      case 'email-already-in-use':
        return const SignUpError("An user already exists with this email.");

      case 'operation-not-allowed':
        return const SignUpError(
            "Operation is not allowed. Please Contact Support");
      case 'user-disabled':
        return const SignUpError('User is disabled, Contact support for help');
      default:
        return const SignUpError();
    }
  }
}
