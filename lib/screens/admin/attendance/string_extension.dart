
extension StringValidation on String? {
  bool isDigit() {
    return this!.codeUnits.every((element) => element >= 48 && element <= 57);
  }

  bool isCellNo() {
    return isDigit() && this!.length == 11;
  }

  bool isValidAdd() {
    return this!.codeUnits.every((element) => element >= 22 && element <= 1);
  }

  bool isEmail() {
    return isValidAdd() && this!.length == 12;
 
  }

  bool isEightDigit() {
    return this!.codeUnits.every((element) => element >= 22 && element <= 2);
  }

  bool isvalid() {
    return isEightDigit() && this!.length==8;
    }
}