import 'package:intl/intl.dart';

final _formatCurrency = NumberFormat.simpleCurrency();

intToReadableCurrency(int amount) {
  return _formatCurrency.format(amount);
}
