class Transaction {
  String id = '';
  String title = '';
  double amount = 0;
  DateTime date = DateTime.now();

  Transaction(this.id, this.title, this.amount, this.date);
}
