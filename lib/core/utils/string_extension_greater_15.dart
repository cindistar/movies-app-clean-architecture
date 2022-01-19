// ignore_for_file: unnecessary_this

extension StringExtension15 on String {
  String wordTrim15(){
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }
}

