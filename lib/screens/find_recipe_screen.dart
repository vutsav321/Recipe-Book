import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/screens/preparing_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];
  final Map<String, String> _answers = {};
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'questionType': 'cuisineType',
      'question': 'What is your favorite cuisine?',
      'options': [
        'American',
        'Asian',
        'British',
        'Caribbean',
        'Central Europe',
        'Chinese',
        'Eastern' 'Europe',
        'French',
        'Indian',
        'Italian',
        'Japanese',
        'Kosher',
        'Mediterranean',
        'Mexican',
        'Middle Eastern',
        'Nordic',
        'South American',
        'South East Asian'
      ],
    },
    {
      'questionType': 'mealType',
      'question': 'What type of meal do you prefer?',
      'options': ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Teatime'],
    },
    {
      'questionType': 'dishType',
      'question': 'What is your favorite dish?',
      'options': [
        'Biscuits and cookies',
        'Bread',
        'Cereals',
        'Condiments and sauces',
        'Desserts',
        'Drinks',
        'Main course',
        'Pancake',
        'Preps',
        'Preserve',
        'Salad',
        'Sandwiches',
        'Side dish',
        'Soup',
        'Starter',
        'Sweets'
      ]
    },
    {
      'questionType': 'diet',
      'question': 'What is your prefered diet?',
      'options': [
        'balanced',
        'high-fiber',
        'high-protein',
        'low-carb',
        'low-fat',
        'low-sodium'
      ]
    }
  ];

  void _handleOptionSelected(String option, String questionType) {
    _answers[questionType] = option;
    setState(() {
      _messages.add({
        'type': 'question',
        'text': _questions[_currentQuestionIndex]['question'],
      });
      _messages.add({
        'type': 'response',
        'text': option,
      });
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Find Your Meal',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['type'] == 'question'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: message['type'] == 'question'
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))
                            : const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                        color: message['type'] == 'question'
                            ? Colors.blue
                            : Colors.orange.shade200,
                      ),
                      child: Text(
                        message['text'],
                        style: TextStyle(
                            fontSize: 16,
                            color: message['type'] == 'question'
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            _currentQuestionIndex < _questions.length
                ? Column(
                    children: [
                      Text(
                        _questions[_currentQuestionIndex]['question'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: _questions[_currentQuestionIndex]['options']
                            .map<Widget>((option) => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        _questions[_currentQuestionIndex]
                                                            ['options']
                                                        .indexOf(option) %
                                                    2 ==
                                                0
                                            ? Colors.orange
                                            : Colors.blue,
                                  ),
                                  onPressed: () => _handleOptionSelected(
                                      option,
                                      _questions[_currentQuestionIndex]
                                          ['questionType']),
                                  child: Text(
                                    option,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                : ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      Get.off(() => PreparingScreen(
                          cusineType: _answers['cuisineType'],
                          mealType: _answers['mealType'],
                          dishType: _answers['dishType'],
                          diet: _answers['diet']));
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    )),
          ],
        ),
      ),
    );
  }
}
