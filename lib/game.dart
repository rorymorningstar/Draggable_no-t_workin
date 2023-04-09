import 'package:flame/components.dart';
//import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
//import 'package:flame/particles.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart' hide Draggable;
//import 'package:flutter/physics.dart';
//import 'managers/managers.dart';
import 'main.dart';
import 'endpage.dart';

//final MyGame game = MyGame();
//GameManager gameManager = GameManager();

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
          backgroundColor: LernApp.GreenColor,
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('game'),
              Expanded(child: GameWidget(game: MyGame())),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Endpage(
                              score: 6,
                              name: 'Max',
                            )),
                  );
                },
                child: const Text('Endpage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyGame extends FlameGame with HasDraggables, HasCollisionDetection {
  // SpriteAnimation

  Trash banana = Trash(positon: Vector2.random());
  int textposition = 0;
  int textposition2 = 0;
  double mainTextsize = 0;
  double counterTextsize = 0;
  SpriteComponent trashy = SpriteComponent();
  SpriteComponent trashy1 = SpriteComponent();
  SpriteComponent trashy2 = SpriteComponent();
  SpriteComponent trashy3 = SpriteComponent();
  SpriteComponent trashy4 = SpriteComponent();
  int counter = 0;
  //SpriteComponent banana = SpriteComponent();
  //@override
  Color backgroundColor() => const Color.fromARGB(255, 255, 255, 255);
  late SpriteAnimationComponent girlWalking;
  TextPaint dialogTextPaint = TextPaint(
      style: const TextStyle(
          fontSize: 26,
          fontFamily: 'Fredoka-SemiBold',
          color: Color.fromARGB(255, 0, 0, 0)));
  TextPaint dialogTextPaint2 = TextPaint(
      style: const TextStyle(
          fontSize: 26,
          fontFamily: 'Fredoka-SemiBold',
          color: Color.fromARGB(255, 236, 7, 7)));
  @override
  Future<void> onLoad() async {
    /*await*/ super.onLoad();

    double charactersize = 0;
    double trashSize = 0;
    int multipyer = 0;
    int multipyer1 = 0;

    final screenWidth = size[0];
    final screenHeight = size[1];
    /*print('Height');
    print(screenHeight);
    print('Witdh');
    print(screenWidth);*/
    if (screenHeight <= 896 && screenWidth <= 414) {
      charactersize = 70;
      trashSize = 100;
      multipyer = 22;
      multipyer1 = 22;
      textposition = 550;
      textposition2 = 400;
      //this.textposition = 550;
      //this.textposition2 = 400;
      //mainTextsize = 16;
      //counterTextsize = 14;
    }
    if (screenHeight >= 897 &&
        screenHeight <= 1190 &&
        screenWidth <= 900 &&
        screenWidth >= 414) {
      charactersize = 120;
      trashSize = 200;
      multipyer = 100;
      multipyer1 = 50;
      textposition = 1000;
      textposition2 = 700;
      //this.textposition = 1000;
      //this.textposition2 = 700;
      //mainTextsize = 36;
      //counterTextsize = 26;
    }
    if (screenHeight >= 1191 && screenWidth >= 901) {
      charactersize = 160;
      trashSize = 240;
      multipyer = 42;
    }
    //print('laoding Assets');
    final girly = await fromJSONAtlas('girl.png', 'girl.json');
    SpriteAnimation walk = SpriteAnimation.spriteList(girly, stepTime: 0.1);
    girlWalking = SpriteAnimationComponent()
      ..animation = walk
      ..y = (screenHeight / 2)
      ..x = (screenWidth / 2) + ((50) - (screenWidth / 2))
      ..anchor = Anchor.centerLeft
      ..size = Vector2(charactersize, charactersize);
    add(girlWalking);
    banana.sprite = await loadSprite('banana.png');

    add(banana);
    trashy
      ..sprite = await loadSprite(
          'vecteezy_cute-trash-can-cartoon-wearing-a-mask_.png')
      ..size = Vector2(trashSize, trashSize)
      ..y = (screenHeight / 2) + 250
      ..x = (screenWidth / 2)
      ..anchor = Anchor.topCenter;
    add(trashy);
    trashy1
      ..sprite = await loadSprite(
          'vecteezy_cute-trash-can-cartoon-wearing-a-mask_.png')
      ..size = Vector2(trashSize, trashSize)
      ..y = (screenHeight / 2) + 230
      ..x = (screenWidth / 2) +
          (charactersize + (charactersize / 100 * multipyer1))
      ..anchor = Anchor.topCenter;
    add(trashy1);
    trashy2
      ..sprite = await loadSprite(
          'vecteezy_cute-trash-can-cartoon-wearing-a-mask_.png')
      ..size = Vector2(trashSize, trashSize)
      ..y = (screenHeight / 2) + 230
      ..x = (screenWidth / 2) -
          (charactersize + (charactersize / 100 * multipyer1))
      ..anchor = Anchor.topCenter;
    add(trashy2);
    trashy3
      ..sprite = await loadSprite(
          'vecteezy_cute-trash-can-cartoon-wearing-a-mask_.png')
      ..size = Vector2(trashSize, trashSize)
      ..y = (screenHeight / 2) + 180
      ..x = (screenWidth / 2) +
          ((charactersize + charactersize) + (charactersize / 100 * multipyer))
      ..anchor = Anchor.topCenter;
    add(trashy3);
    trashy4
      ..sprite = await loadSprite(
          'vecteezy_cute-trash-can-cartoon-wearing-a-mask_.png')
      ..size = Vector2(trashSize, trashSize)
      ..y = (screenHeight / 2) + 180
      ..x = (screenWidth / 2) -
          ((charactersize + charactersize) + (charactersize / 100 * multipyer))
      ..anchor = Anchor.topCenter;
    add(trashy4);
  }

/*
  void startGame() {
    gameManager.state = GameState.playing;
  }
  */
}

class Trash extends SpriteComponent with Draggable {
  Vector2? dragDeltaPosition;

  Trash({required Vector2 positon})
      : super(position: positon, size: Vector2.all(80));

  @override
  void update(double dt) {
    super.update(dt);
    debugColor =
        isDragged && parent is Game ? Colors.greenAccent : Colors.purple;
  }

  @override
  bool onDragStart(DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (parent is! Game) {
      return true;
    }
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    position.setFrom(info.eventPosition.game - dragDeltaPosition);
    return false;
  }

  @override
  bool onDragEnd(_) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    return false;
  }
}
