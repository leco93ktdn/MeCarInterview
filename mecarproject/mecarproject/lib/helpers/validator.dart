final RegExp phoneNumberRegExp = RegExp(
  '(84|0[3|5|7|8|9])+([0-9]{8})\\b',
);

String validatePhoneNumber(String value) {
  if (value == null || value.isEmpty) {
    return 'Hãy nhập số điện thoại';
  }

  if (!phoneNumberRegExp.hasMatch(value)) {
    return 'Số điện thoại chưa đúng định dạng';
  }

  return null;
}
