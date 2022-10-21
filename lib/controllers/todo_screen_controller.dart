import 'package:get/get.dart';

class TodoScreenController extends GetxController {
  var _title = RxString('');
  get title => _title;

  onChangeTitle(String title) {
    _title = RxString(title);
  }
}
