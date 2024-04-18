import 'package:fitness_app/pages/customize.dart';
import 'package:fitness_app/pages/today.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _date = TextEditingController();
  void _showdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      _date.text = value.toString().substring(0);

      setState(() {});
    });
  }

  List<String> image = [
    'asset/image/fried-egg.png',
    'asset/image/salad.png',
    'asset/image/watermelon.png'
  ];
  List<Color> color = [
    const Color.fromARGB(255, 248, 105, 153),
    Colors.blue,
    const Color.fromARGB(255, 209, 99, 91),
  ];
  final List<FoodModel> food = [
    FoodModel(
        name: 'Breakfast', desc: 'Bread, \nPeanut butter,\nApple', kcal: '525'),
    FoodModel(
        name: 'Lunch',
        desc: 'Solmon , \nMixed veggies , \nAvocado',
        kcal: '602'),
    FoodModel(name: 'Snack', desc: 'Recommend:', kcal: '800'),
  ];

  @override
  Widget build(BuildContext context) {
    final dim = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'My Diary',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: dim.width * 0.23,
                    ),
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: _date,
                        onTap: () {
                          _showdatepicker();
                        },
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              size: 18,
                            ),
                            hintText: 'Set Date',
                            border: InputBorder.none),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: dim.height * 0.070,
                ),
                Row(
                  children: [
                    const Text(
                      'Mediterranean diet',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      width: dim.width * 0.25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Details()),
                        );
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Details',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          SizedBox(
                            width: dim.width * 0.010,
                          ),
                          const Icon(Icons.arrow_forward_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dim.height * 0.020,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Container(
                        height: dim.height * 0.3,
                        width: dim.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.outer, blurRadius: 1),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 15,
                                        backgroundColor: Colors.blue,
                                        color: Colors.red.shade100,
                                        value: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 205,
                                  top: 50,
                                  child: Text(
                                    '1503',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 25),
                                  ),
                                ),
                                const Positioned(
                                  left: 210,
                                  top: 75,
                                  child: Text(
                                    'Kcal left',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Carbs',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.blue.shade100,
                                        color: Colors.blue,
                                        value: 0.7,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '12g left',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Proteins',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.red.shade100,
                                        color: Colors.red,
                                        value: 0.2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '30g left',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Fats',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.orange.shade100,
                                        color: Colors.orange,
                                        value: 0.4,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '10g left',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Meals today',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      width: dim.width * 0.33,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Customize()),
                        );
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Customize',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          SizedBox(
                            width: dim.width * 0.010,
                          ),
                          const Icon(Icons.arrow_forward_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dim.height * 0.30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: food.length,
                    itemBuilder: (context, index) {
                      final foodItems = food[index];
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 160,
                            decoration: BoxDecoration(
                                color: color[index],
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(60),
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      blurStyle: BlurStyle.outer,
                                      blurRadius: 1),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  foodItems.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  foodItems.desc,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      foodItems.kcal,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'kcal',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              left: -4,
                              top: -3,
                              child: Image.asset(
                                image[index],
                                scale: 8,
                              )),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Body measurement',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: dim.width * 0.25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Today()),
                        );
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          SizedBox(
                            width: dim.width * 0.010,
                          ),
                          const Icon(Icons.arrow_forward_rounded)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodModel {
  String name;
  String desc;
  String kcal;
  FoodModel({
    required this.name,
    required this.desc,
    required this.kcal,
  });
}
