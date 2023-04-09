import 'package:flutter/material.dart';
import 'main.dart';
import 'startpage.dart';

class Endpage extends StatelessWidget {
  int score;
  String name;

  Endpage({required this.score, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Endpage'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return constraints.maxWidth > constraints.maxHeight
              ? LandscapeLayout(context, constraints)
              : PortraitLayout(context, constraints);
        },
      ),
    );
  }

  @override
  Widget LandscapeLayout(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gratulation $name!',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: constraints.maxWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  'Du hast $score von 10 Punkten erreicht.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: constraints.maxWidth * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        ButtonContainer(),
        const SizedBox(height: 5),
        Expanded(
          child: Container(
            child: Image.asset(
              'assets/images/super_wiegons.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 0),
        Footer(),
      ],
    );
  }

  @override
  Widget PortraitLayout(BuildContext context, BoxConstraints constraints) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleContainer(context, constraints: constraints, score: score, name: name),
          const SizedBox(height: 10),
          ButtonContainer(),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: constraints.maxWidth * 0.45,
              height: constraints.maxHeight * 0.45,
              child: Image.asset(
                'assets/images/super_wiegons.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 0),
          Footer(),
        ],
      ),
    );
  }

  @override
  Widget CircleContainer(BuildContext context, {required BoxConstraints constraints, required int score, required String name}) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gratulation $name!',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: screenSize.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenSize.width * 0.03),
                  Text(
                    'Du hast $score von 10 Punkten erreicht.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.width * 0.030,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget ButtonContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.restart_alt_sharp,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Level neu starten',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Nächstes Level',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget PopUp(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ergebnis für $name'),
              content: Text('Dein Score ist: $score'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
      child: Text('Ergebnis anzeigen'),
    );
  }


  @override
  Widget Footer() {
    return Container(
      height: 70,
      color: Colors.green,
      child: Center(
        child: Text(
          '© 2023 Verein Umweltwerkstatt',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}