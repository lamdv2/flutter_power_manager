import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/questions/questions_model.dart';
import 'package:flutter_getx_base/models/questions/quiz_history_model.dart';
import 'package:flutter_getx_base/modules/main/home_controller.dart';
import 'package:flutter_getx_base/modules/message/message.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchHomeController = TextEditingController();
  final HomeController homeController = Get.find();
  final MessageController messageController = Get.put(MessageController());

  final listQuestions = Rxn<List<Question>>();
  final numbQuestion = RxInt(0);
  final numbCorrectAnswer = RxInt(0);
  final isCheckFinish = RxBool(false);
  final isCheckChoose = RxBool(false);
  final isCheckLoading = RxBool(false);
  final isCheckCorrect = RxInt(0);
  final listAnswers = Rxn<List<String>>();
  final listBestAnswers = Rxn<List<String>>([]);
  final bestAnswer = Rxn<String>('');

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://opentdb.com/api.php?amount=10');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        final List<Question> questions =
            results.map((data) => Question.fromJson(data)).toList();
        listQuestions.value = questions;
        List<String> answers = [
          listQuestions.value?[numbQuestion.value].correctAnswer ?? '',
          listQuestions.value?[numbQuestion.value].incorrectAnswers?[0] ?? '',
          listQuestions.value?[numbQuestion.value].incorrectAnswers?[1] ?? '',
          listQuestions.value?[numbQuestion.value].incorrectAnswers?[2] ?? '',
        ];

        answers.shuffle();

        listAnswers.value = answers;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataTrueFalseQuestion() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://opentdb.com/api.php?amount=10&type=boolean');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        final List<Question> questions =
            results.map((data) => Question.fromJson(data)).toList();
        final List<Question> trueFalseQuestions =
            questions.where((question) => question.type == 'boolean').toList();

        listQuestions.value = trueFalseQuestions;

        if (listQuestions.value != null && listQuestions.value!.isNotEmpty) {
          List<String> answers = [
            listQuestions.value![numbQuestion.value].correctAnswer ?? '',
            listQuestions.value![numbQuestion.value].incorrectAnswers?[0] ?? '',
          ];
          answers.shuffle();
          listAnswers.value = answers;
        }
        setNewGame();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataChooseQuestion() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://opentdb.com/api.php?amount=10&type=multiple');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        final List<Question> questions =
            results.map((data) => Question.fromJson(data)).toList();
        final List<Question> chooseQuestions =
            questions.where((question) => question.type == 'multiple').toList();

        listQuestions.value = chooseQuestions;

        if (listQuestions.value != null && listQuestions.value!.isNotEmpty) {
          List<String> answers = [
            listQuestions.value![numbQuestion.value].correctAnswer ?? '',
            listQuestions.value![numbQuestion.value].incorrectAnswers?[0] ?? '',
            listQuestions.value![numbQuestion.value].incorrectAnswers?[1] ?? '',
            listQuestions.value![numbQuestion.value].incorrectAnswers?[2] ?? '',
          ];
          answers.shuffle();
          listAnswers.value = answers;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void finishQuestion() {
    isCheckFinish.value = true;
    saveHistoryGame();
    messageController.getHistoryFromSharedPreferences();
    getBestAnswerFromSharedPreferences();
  }

  Future<void> saveHistoryGame() async {
    try {
      DateTime currentTime = DateTime.now();

      QuizHistory history = QuizHistory(numbCorrectAnswer.value, currentTime);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> historyStrings = prefs.getStringList('quizHistory') ?? [];
      historyStrings.add(json.encode(history.toJson()));
      await prefs.setStringList('quizHistory', historyStrings);
    } catch (e) {
      print('Error saving history: $e');
    }
  }

  void newQuizGame() async {
    isCheckLoading.value = true;
    await fetchData();
    setNewGame();
    isCheckLoading.value = false;
  }

  void setNewGame() {
    numbQuestion.value = 0;
    numbCorrectAnswer.value = 0;
    isCheckFinish.value = false;
    isCheckChoose.value = false;
    isCheckCorrect.value = 0;
  }

  void viewHistory() {
    homeController.bottomNavIndex.value = 2;
  }

  void nextQuestion() {
    numbQuestion.value += 1;
    isCheckCorrect.value = 0;
    isCheckChoose.value = false;

    if (listQuestions.value != null &&
        listQuestions.value!.isNotEmpty &&
        listQuestions.value!.length > numbQuestion.value) {
      if (listQuestions.value![numbQuestion.value].type == "multiple") {
        List<String> answers = [
          listQuestions.value![numbQuestion.value].correctAnswer ?? '',
          listQuestions.value![numbQuestion.value].incorrectAnswers?[0] ?? '',
          listQuestions.value![numbQuestion.value].incorrectAnswers?[1] ?? '',
          listQuestions.value![numbQuestion.value].incorrectAnswers?[2] ?? '',
        ];

        answers.shuffle();
        listAnswers.value = answers;
      } else {
        List<String> answers = [
          listQuestions.value![numbQuestion.value].correctAnswer ?? '',
          listQuestions.value![numbQuestion.value].incorrectAnswers?[0] ?? '',
        ];

        answers.shuffle();
        listAnswers.value = answers;
      }
    } else {
      fetchData();
    }
  }

  void isCheckCorrectAnswer(String answer) {
    isCheckChoose.value = true;
    if (answer == listQuestions.value?[numbQuestion.value].correctAnswer) {
      isCheckCorrect.value = 1;
      numbCorrectAnswer.value += 1;
    } else {
      isCheckCorrect.value = 2;
    }
  }

  bool isCheckValueAnswer(String answer) {
    if (answer == listQuestions.value?[numbQuestion.value].correctAnswer) {
      return true;
    }
    return false;
  }

  Future<void> getBestAnswerFromSharedPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> historyStrings = prefs.getStringList('quizHistory') ?? [];

      bestAnswer.value = '';

      historyStrings.forEach((historyString) {
        final Map<String, dynamic> historyJson = json.decode(historyString);
        final QuizHistory history = QuizHistory.fromJson(historyJson);
        listBestAnswers.value!.add(history.numbCorrectAnswer.toString());
      });
      listBestAnswers.value!.sort((a, b) => b.compareTo(a));
      bestAnswer.value = listBestAnswers.value![0];
    } catch (e) {
      print('Error getting history: $e');
    }
  }

  String bestResult() {
    getBestAnswerFromSharedPreferences();
    return bestAnswer.value ?? '';
  }
}
