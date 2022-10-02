import 'package:intl/intl.dart';

class PriceUtil {
  static final oCcy = NumberFormat("#,###", "ko_KR");
  static String calcStringToWon(String priceString) {
    // 한국 돈 컴마 처리
    return oCcy.format(int.parse(priceString));
  }
}
