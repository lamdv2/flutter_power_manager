import 'dart:convert';

import 'package:flutter_getx_base/models/questions/quiz_history_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageController extends GetxController {
  final historyList = Rxn<List<QuizHistory>>([]);

  @override
  void onInit() {
    getHistoryFromSharedPreferences();
    super.onInit();
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yy HH:mm').format(dateTime);
  }

  Future<void> getHistoryFromSharedPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> historyStrings = prefs.getStringList('quizHistory') ?? [];

      historyList.value!.clear();

      historyStrings.forEach((historyString) {
        final Map<String, dynamic> historyJson = json.decode(historyString);
        final QuizHistory history = QuizHistory.fromJson(historyJson);
        historyList.value!.add(history);
      });
      historyList.value = historyList.value!.reversed.toList();
    } catch (e) {
      print('Error getting history: $e');
    }
  }
}
