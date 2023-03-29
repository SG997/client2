extension StringX on String {
  bool get isEmailValid {
    return RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""").hasMatch(this);
  }
}
