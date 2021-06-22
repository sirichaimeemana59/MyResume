import 'package:flutter/foundation.dart';
import 'package:my_app/startbucksProviders/cardModelProvider.dart';

class StartBucksProviders with ChangeNotifier {
  List<CardModersStarbucks> cardStarbucksList = [
    CardModersStarbucks(
      cardNumber: 'fffff',
      verifyCard: 'rrrrr',
      date: DateTime.now(),
    ),
  ];

  List<CardModersStarbucks> getCardModersStarbucks() {
    return cardStarbucksList;
  }

  void addCardStarbucksList(CardModersStarbucks statement) async {
    cardStarbucksList.add(statement);
    notifyListeners();
    //print(statement.cardNumber);
  }
}
