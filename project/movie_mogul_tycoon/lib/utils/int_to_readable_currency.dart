import 'package:intl/intl.dart';

final _formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

intToReadableCurrency(int amount) {
  return _formatCurrency.format(amount);
}
