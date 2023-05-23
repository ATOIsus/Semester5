import "package:flutter/material.dart";

class ScreenView extends StatefulWidget {
  const ScreenView({super.key});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  final _firstController = TextEditingController();
  int first = 0;
  int second = 0;
  String operator = "";

  List<String> lstNumbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> lstAllCharacters = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "^",
    "%",
    "0",
    ".",
    "="
  ];

  bool _checkIsNumber(String value) {
    bool status = false;
    for (var i = 0; i < lstNumbers.length; i++) {
      if (value == lstNumbers[i]) {
        status = true;
      }
    }
    return status;
  }

  bool checkOperator(String value) {
    List<String> lstOperators = ["+", "-", "*", "/"];
    bool status = false;
    for (var i = 0; i < lstOperators.length; i++) {
      if (value == lstOperators[i]) {
        status = true;
      }
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _firstController,
            textAlign: TextAlign.end,
            decoration: const InputDecoration(hintText: "0"),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: lstAllCharacters.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_checkIsNumber(lstAllCharacters[index])) {
                            if (operator == "") {
                              _firstController.text =
                                  "${_firstController.text}${lstAllCharacters[index]}";
                              first = int.parse(_firstController.text);
                            } else {
                              if (second == 0) {
                                _firstController.text = "";
                              }

                              _firstController.text =
                                  "${_firstController.text}${lstAllCharacters[index]}";
                              second = int.parse(_firstController.text);
                            }
                          } else {
                            if (lstAllCharacters[index] == "=") {
                              doOperation(operator);
                              first = 0;
                              second = 0;
                              operator = '';
                            } else if (checkOperator(lstAllCharacters[index])) {
                              operator = lstAllCharacters[index];
                            } else {
                              if (lstAllCharacters[index] == "C") {
                                _firstController.text = "";
                                first = 0;
                                second = 0;
                                operator = '';
                              } else if (lstAllCharacters[index] == "<-") {
                                _firstController.text = _firstController.text
                                    .substring(
                                        0, _firstController.text.length - 1);
                              }
                            }
                          }
                        },
                        child: Text(lstAllCharacters[index],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void doOperation(String value) {
    switch (value) {
      case "+":
        {
          _firstController.text = "${first + second}";
        }
        break;
      case "-":
        {
          _firstController.text = "${first - second}";
        }
        break;
      case "*":
        {
          _firstController.text = "${first * second}";
        }
        break;
      case "/":
        {
          _firstController.text = "${first / second}";
        }
        break;
    }
  }
}
