import 'package:flutter/material.dart';
import 'package:tiny_minds/pages/itemModel.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<ItemModel> items = [];
  List<ItemModel> items2 = [];
  int score = 0;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(value: 'Lion', name: 'Lion', img: 'assets/animals/images_anim/lio.png'),
      ItemModel(value: 'Bat', name: 'Bat', img: 'assets/animals/images_anim/bat.png'),
      ItemModel(value: 'Dolphin', name: 'Dolphin', img: 'assets/animals/images_anim/dolphin.png'),
      ItemModel(value: 'Star', name: 'Star', img: 'assets/shapes/images_shapes/star.png'),
      ItemModel(value: 'Crab', name: 'Crab', img: 'assets/animals/images_anim/crab.png'),
      ItemModel(value: 'Butterfly', name: 'Butterfly', img: 'assets/animals/images_anim/butt.png'),
      ItemModel(value: 'Triangle', name: 'Triangle', img: 'assets/shapes/images_shapes/triangle.png'),
      ItemModel(value: 'Heart', name: 'Heart', img: 'assets/shapes/images_shapes/heart.png'),
      ItemModel(value: 'Horse', name: 'Horse', img: 'assets/animals/images_anim/ho.png'),
      ItemModel(value: '1', name: '1', img: 'assets/numbers/images_num/1.png'),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Score: ',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      TextSpan(
                        text: '$score',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Color.fromARGB(255, 52, 113, 205)),
                      ),
                    ],
                  ),
                ),
              ),
              if (!gameOver)
                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: items.map((item) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 70, 
                            ),
                            feedback: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 70, 
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 40,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Spacer(flex: 2),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                                score += 10;
                                item.accepting = false;
                              });
                            } else {
                              setState(() {
                                score -= 5;
                                item.accepting = false;
                              });
                            }
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, acceptedItems, rejectedItems) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: item.accepting ? Colors.grey[400] : Colors.grey[200],
                            ),
                            height: MediaQuery.of(context).size.width / 6.5,
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              item.name,
                              textAlign: TextAlign.center, 
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Spacer(),
                  ],
                ),
              if (gameOver)
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          result(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 52, 113, 205),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              initGame();
                            });
                          },
                          child: Text(
                            'New Game',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Image.asset(
                        'assets/images/game.png',
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String result() {
    if (score >= 50) {
      return 'Awesome , Good job!!';
    } else {
      return 'You can get better';
    }
  }
}
                            


