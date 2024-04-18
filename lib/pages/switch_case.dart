import 'package:flutter/material.dart';

class SwitchCasePractice extends StatefulWidget {
  const SwitchCasePractice({super.key});

  @override
  State<SwitchCasePractice> createState() => _SwitchCasePracticeState();
}

class _SwitchCasePracticeState extends State<SwitchCasePractice> {
  List<bool> isTappedList = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Case'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  Color color;
                  switch (index % 5) {
                    case 0:
                      color = isTappedList[index] ? Colors.black45 : Colors.red;
                      break;
                    case 1:
                      color =
                          isTappedList[index] ? Colors.black45 : Colors.blue;
                      break;
                    case 2:
                      color =
                          isTappedList[index] ? Colors.black45 : Colors.orange;
                      break;
                    case 3:
                      color =
                          isTappedList[index] ? Colors.black45 : Colors.green;
                      break;
                    case 4:
                      color =
                          isTappedList[index] ? Colors.black45 : Colors.purple;
                      break;
                    default:
                      color =
                          isTappedList[index] ? Colors.black45 : Colors.yellow;
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isTappedList[index] = !isTappedList[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
