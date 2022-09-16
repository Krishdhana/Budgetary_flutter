import 'transaction_item.dart';

class selectedTransaction {
  TransItem txItem;
  int index;
  int mainIdx;

  selectedTransaction(
      {required this.txItem, required this.index, this.mainIdx = 0});
}
