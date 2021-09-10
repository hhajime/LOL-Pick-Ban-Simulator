import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/data/list.dart';
import 'package:flutter_application_1/src/data/database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  final upController = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;
    displayRatio = displayHeight / displayWidth;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          FocusManager.instance.primaryFocus?.unfocus();
          new TextEditingController().clear();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor, onPrimary: subColor),
                    child: Icon(Icons.info),
                    onPressed: () => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 16,
                              child: SingleChildScrollView(
                                  child: Container(
                                      decoration: myBoxDecoration(),
                                      width: displayWidth * 0.8,
                                      height: displayHeight * 0.8,
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Container(
                                                width: displayWidth * 0.427,
                                                height: displayHeight * 0.05,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: mainColor),
                                                child: Text(
                                                  'Blue Team',
                                                  style: teamColor(Colors.blue),
                                                )),
                                          ),
                                          Row(
                                            children: [
                                              blueTeamExpanded(0),
                                              blueTeamExpanded(1),
                                              blueTeamExpanded(2),
                                              blueTeamExpanded(3),
                                              blueTeamExpanded(4),
                                            ],
                                          ),
                                          Container(
                                              height: displayHeight * 0.1,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                bottom:
                                                    BorderSide(color: subColor),
                                              )),
                                              child: Row(
                                                children: [
                                                  blueChampInfo(0),
                                                  blueChampInfo(1),
                                                  blueChampInfo(2),
                                                  blueChampInfo(3),
                                                  blueChampInfo(4)
                                                ],
                                              )),
                                          Container(
                                            child: Container(
                                                width: displayWidth * 0.427,
                                                height: displayHeight * 0.05,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: mainColor),
                                                child: Text(
                                                  'Red Team',
                                                  style: teamColor(Colors.red),
                                                )),
                                          ),
                                          Row(
                                            children: [
                                              redTeamExpanded(0),
                                              redTeamExpanded(1),
                                              redTeamExpanded(2),
                                              redTeamExpanded(3),
                                              redTeamExpanded(4),
                                            ],
                                          ),
                                          Container(
                                              height: displayHeight * 0.1,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                bottom:
                                                    BorderSide(color: subColor),
                                              )),
                                              child: Row(
                                                children: [
                                                  redChampInfo(0),
                                                  redChampInfo(1),
                                                  redChampInfo(2),
                                                  redChampInfo(3),
                                                  redChampInfo(4)
                                                ],
                                              )),
                                        ],
                                      ))));
                        })),
              ],
              iconTheme: IconThemeData(color: subColor),
              toolbarHeight: displayHeight * 0.05,
              title: Row(children: [
                Text(
                  "LOL: Pick Ban Simulator",
                  style: TextStyle(color: subColor, fontSize: displayRatio * 8),
                ),
              ]),
              brightness: Brightness.dark,
              backgroundColor: mainColor),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(color: mainColor)),
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {},
                ),
                /*ListTile(
                  leading: Icon(
                    Icons.edit,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),
                  title: Text(
                    'Player Name Edit',
                    style: teamColor(mainColor),
                  ),
                  dense: true,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 16,
                              child: SingleChildScrollView(
                                child: Container(
                                  decoration: myBoxDecoration(),
                                  width: displayWidth * 0.8,
                                  height: displayHeight * 0.8,
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(
                                              top: displayHeight * 0.01),
                                          child: Text(
                                            'Blue Team Player',
                                            style: TextStyle(
                                                fontSize: displayHeight * 0.02,
                                                color: Colors.blueAccent),
                                          )),
                                      playerNameEditContainer(0, 'Player1'),
                                      playerNameEditContainer(1, 'Player2'),
                                      playerNameEditContainer(2, 'Player3'),
                                      playerNameEditContainer(3, 'Player4'),
                                      playerNameEditContainer(4, 'Player5'),
                                      Container(
                                          padding: EdgeInsets.only(
                                              top: displayHeight * 0.01),
                                          child: Text(
                                            'Red Team Player',
                                            style: TextStyle(
                                                fontSize: displayHeight * 0.02,
                                                color: Colors.redAccent),
                                          )),
                                      playerNameEditContainer(0, 'Player1'),
                                      playerNameEditContainer(1, 'Player2'),
                                      playerNameEditContainer(2, 'Player3'),
                                      playerNameEditContainer(3, 'Player4'),
                                      playerNameEditContainer(4, 'Player5'),
                                      Container(
                                        decoration: myBoxDecoration(),
                                        child: Text(
                                          'confirm',
                                          style: TextStyle(
                                              color: subColor,
                                              fontSize: displayHeight * 0.05),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        });
                  },
                ),*/
                ListTile(
                  leading: Icon(
                    Icons.save,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),
                  title: Text(
                    'Save',
                    style: teamColor(mainColor),
                  ),
                  dense: true,
                  onTap: () {},
                ),
                ExpansionTile(
                  title: Row(children: [
                    Icon(
                      Icons.download,
                      size: displayRatio * 20,
                      color: mainColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: displayWidth * 0.04),
                    ),
                    Text(
                      'Load',
                      style: teamColor(mainColor),
                    ),
                  ]),
                  children: <Widget>[
                    ListTile(
                      title: Text('recent data'),
                    ),
                    ExpansionTile(
                      leading: Icon(
                        Icons.subdirectory_arrow_right_outlined,
                        color: mainColor,
                      ),
                      title: Text(
                        'Saved data',
                        style: teamColor(mainColor),
                      ),
                      children: <Widget>[
                        ListTile(title: Text('data 1'), onTap: () {})
                      ],
                    ),
                  ],
                ),
                ListTile(
                    leading: Icon(
                      Icons.delete_forever_outlined,
                      size: displayRatio * 20,
                      color: mainColor,
                    ),
                    title: Text(
                      'Delete Current Simulation',
                      style: teamColor(mainColor),
                    ),
                    /*trailing: Icon(
                    Icons.drag_handle,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),*/
                    dense: true,
                    onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Alert Before Progress'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                        'Current data will be removed without saving it'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Approve',
                                    style: TextStyle(color: subColor),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    for (int i = 0; i < 5; i++) {
                                      upController.bluPlayer[i] = champIcon;
                                      upController.blueBan[i] = champIcon;
                                      upController.redPlayer[i] = champIcon;
                                      upController.redBan[i] = champIcon;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ],
                            );
                          },
                        )),
                ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      size: displayRatio * 20,
                      color: mainColor,
                    ),
                    title: Text(
                      'Exit App',
                      style: teamColor(mainColor),
                    ),
                    dense: true,
                    onTap: () => showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Exit Alert'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                        'Current data will be removed without saving it.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Approve',
                                    style: TextStyle(color: subColor),
                                  ),
                                  onPressed: () {
                                    if (Platform.isAndroid) {
                                      SystemNavigator.pop();
                                    } else
                                      exit(0);
                                    ;
                                  },
                                ),
                              ],
                            );
                          },
                        )),
                Container(
                  padding: EdgeInsets.only(top: displayHeight * 0.38),
                  child: Text(
                      "LOL: Pick Ban Simulator IS NOT endorsed by Riot Games and does not reflect the views or opinions of those who produce or manage Riot Games or the League of Legends officially. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games. Inc. League of Legends © Riot Games. Inc. v1.00",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: displayHeight * 0.015)),
                ),
              ],
            ),
          ),
          body: Container(
              width: displayWidth,
              height: displayHeight,
              child: Column(
                children: [
                  Row(
                    children: [
                      teamName(Colors.blue, "DAMWON"),
                      Container(
                        height: displayHeight * 0.05,
                        decoration: myBoxDecoration(),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Patch 11.12',
                            style: TextStyle(
                                fontSize: displayRatio * 3,
                                color: Colors.white54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: displayWidth * 0.146,
                      ),
                      teamName(Colors.red, "SKT T1"),
                    ],
                  ),
                  Row(
                    children: [
                      banContainer(upController.blueBan, 'blue', 0),
                      banContainer(upController.blueBan, 'blue', 1),
                      banContainer(upController.blueBan, 'blue', 2),
                      banContainer(upController.blueBan, 'blue', 3),
                      banContainer(upController.blueBan, 'blue', 4),
                      Container(
                          width: displayWidth * 0.1465,
                          height: displayHeight * 0.05,
                          decoration: myBoxDecoration(),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'BANS',
                              style: teamColor(subColor),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      banContainer(upController.redBan, 'red', 0),
                      banContainer(upController.redBan, 'red', 1),
                      banContainer(upController.redBan, 'red', 2),
                      banContainer(upController.redBan, 'red', 3),
                      banContainer(upController.redBan, 'red', 4),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          playerContainer(upController.bluPlayer, 'blue', 0),
                          playerContainer(upController.bluPlayer, 'blue', 1),
                          playerContainer(upController.bluPlayer, 'blue', 2),
                          playerContainer(upController.bluPlayer, 'blue', 3),
                          playerContainer(upController.bluPlayer, 'blue', 4)
                        ],
                      ),
                      Stack(
                        children: [
                          InteractiveViewer(
                              minScale: 1.0,
                              maxScale: 4.0,
                              child: Stack(children: [
                                Container(
                                  height: displayHeight * 0.43,
                                  width: displayWidth * 0.66,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      image: DecorationImage(
                                          image: new AssetImage(
                                              'assets/images/map.png'),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  left: displayWidth * 0.54,
                                  top: displayHeight * 0.0,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                        icon: Icon(Icons.zoom_in),
                                        color: subColor,
                                        onPressed: () {
                                          debugPrint('hell');
                                        }),
                                  ),
                                )
                              ])),
                        ],
                      ),
                      Column(
                        children: [
                          playerContainer(upController.redPlayer, 'red', 0),
                          playerContainer(upController.redPlayer, 'red', 1),
                          playerContainer(upController.redPlayer, 'red', 2),
                          playerContainer(upController.redPlayer, 'red', 3),
                          playerContainer(upController.redPlayer, 'red', 4)
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                        length: 5,
                        child: Column(
                          children: [
                            Container(
                              child: TabBar(
                                indicator: BoxDecoration(color: subColor),
                                labelStyle: teamColor(subColor),
                                unselectedLabelColor: subColor,
                                indicatorColor: mainColor,
                                labelColor: Colors.white,
                                tabs: [
                                  Tab(text: 'TOP'),
                                  Tab(text: 'JG'),
                                  Tab(text: 'MID'),
                                  Tab(text: 'BOT'),
                                  Tab(text: 'SUP')
                                ],
                              ),
                              decoration: myTabBoxDecoration(),
                            ),
                            Expanded(
                              flex: 1,
                              child: TabBarView(children: [
                                championGrid(topList, topPlayerList),
                                championGrid(jugList, jugPlayerList),
                                championGrid(midList, midPlayerList),
                                championGrid(botList, botPlayerList),
                                championGrid(supList, supPlayerList),
                              ]),
                            ),
                          ],
                        )),
                  ),
                ],
              )),
        ));
  }
}

Widget banContainer(List banList, String team, int n) {
  final upController = Get.put(UpdateController());
  return Container(
    width: displayWidth * 0.0853,
    height: displayHeight * 0.05,
    alignment: Alignment.center,
    decoration: myBoxDecoration(),
    child: DragTarget<String>(
      onWillAccept: (value) {
        banTemp = value;
        return true;
      },
      onAccept: (value) {
        targetTeam = team;
        if (trigger == 1) {
          //ban->other ban
          if (draggingTeam == targetTeam) {
            debugPrint('ban->same team ban');
            banList[tempNum] = banList[n];
          } else {
            if (team == 'red') {
              upController.blueBan[tempNum] = banList[n];
            } else {
              upController.redBan[tempNum] = banList[n];
            }
          }
          ;
          banList[n] = dragging1;
          //add Update
        } else if (trigger == 2) {
          //ban->player
          if (draggingTeam == targetTeam) {
            debugPrint('ban->player');
            if (team == 'red') {
              upController.redPlayer[tempNum] = banList[n];
            } else {
              upController.bluPlayer[tempNum] = banList[n];
            }
          } else {
            if (team == 'red') {
              upController.bluPlayer[tempNum] = banList[n];
            } else {
              upController.redPlayer[tempNum] = banList[n];
            }
          }
          ;
          banList[n] = dragging1;
          //add Update
        } else if (trigger == 3) {
          debugPrint('champ->ban');
          //ban->ban
          banList[n] = dragging1;
          //add Update
        }
      },
      builder: (_, candidateData, rejectedData) {
        return Stack(children: [
          Container(
            width: displayWidth * 0.0853,
            height: displayHeight * 0.05,
            alignment: Alignment.center,
            child: banList[n] != null
                ? Image.asset(
                    banList[n],
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Container(
            child: LongPressDraggable(
              data: banList[n],
              feedback: feedbackContainer(banList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (update) {},
              onDragCompleted: () {},
              onDraggableCanceled: (v, f) => {
                banList[n] = champIcon, //add Update
              },
              onDragStarted: () {
                draggingTeam = team;
                trigger = 1;
                dragging1 = banList[n];
                tempNum = n;
              },
              child: Container(
                  child: Obx(() => Image.asset(banList[n], //3)
                      fit: BoxFit.cover,
                      width: displayWidth * 0.0853,
                      height: displayHeight * 0.05))),
            ),
          ),
        ]);
      },
    ),
  );
}

Widget playerContainer(List playerList, String team, int n) {
  final upController = Get.put(UpdateController());
  Matrix4 mirror = Matrix4.rotationY(0);
  if (team == 'red') {
    mirror = Matrix4.rotationY(math.pi);
  }
  return Container(
    width: displayWidth * 0.17,
    height: displayHeight * 0.086,
    child: DragTarget<String>(onWillAccept: (value) {
      return true;
    }, onAccept: (value) {
      targetTeam = team;
      if (trigger == 1) {
        if (draggingTeam == targetTeam) {
          if (team == 'red') {
            upController.redBan[tempNum] = playerList[n];
          } else {
            upController.blueBan[tempNum] = playerList[n];
          }
        } else {
          if (team == 'red') {
            upController.blueBan[tempNum] = playerList[n];
          } else {
            upController.redBan[tempNum] = playerList[n];
          }
        }
        ;
        playerList[n] = dragging1; //add Update
      } else if (trigger == 2) {
        if (draggingTeam == targetTeam) {
          playerList[tempNum] = playerList[n];
        } else {
          if (team == 'red') {
            upController.bluPlayer[tempNum] = playerList[n];
          } else {
            upController.redPlayer[tempNum] = playerList[n];
          }
        }
        ;
        playerList[n] = dragging1; //add Update
      } else if (trigger == 3) {
        playerList[n] = dragging1; //add Update
      }
    }, builder: (_, candidateData, rejectedData) {
      return Stack(
        children: [
          Container(alignment: Alignment.center, child: Container()),
          Container(
            child: LongPressDraggable(
              data: playerList[n],
              feedback: feedbackContainer(playerList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {},
              onDragCompleted: () {},
              onDraggableCanceled: (v, f) => {
                playerList[n] = champIcon, //add Update
              },
              onDragEnd: (data) {},
              onDragStarted: () {
                draggingTeam = team;
                trigger = 2;
                dragging1 = playerList[n];
                tempNum = n;
              },
              child: Transform(
                  alignment: Alignment.center,
                  transform: mirror,
                  child: Container(
                      child: Obx(() => Image.asset(
                            playerList[n], //3)
                            fit: BoxFit.cover,
                            width: displayWidth * 0.17,
                            height: displayHeight * 0.086,
                          )))),
            ),
          ),
          Positioned(
            top: 1,
            child: IgnorePointer(
                child: Container(
                    child: Opacity(
                        opacity: 1,
                        child: SvgPicture.asset(
                            'assets/images/player_background.svg', //3)
                            fit: BoxFit.cover,
                            width: displayWidth * 0.17,
                            height: displayHeight * 0.086)))),
          ),
          Positioned(right: 0, bottom: 0, child: playerName("PLAYER")),
          Positioned(
            right: 5,
            bottom: 15,
            child: Container(
              height: 15,
              width: 15,
              child: SvgPicture.asset(lines[n]),
            ),
          ),
        ],
      );
    }),
    decoration: myBoxDecoration(),
  );
}

Widget championGrid(List _image, List _image2) {
  return Container(
    child: Scrollbar(
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: displayHeight / 980, // here2
          ),
          itemCount: (_image.length),
          itemBuilder: (context, index) => GridTile(
              child: AbsorbPointer(
                  absorbing: false,
                  child: LongPressDraggable(
                      data: _image[index],
                      feedback: feedbackContainer(_image[index]),
                      childWhenDragging: greyOutChampContainer(_image[index]),
                      onDragCompleted: () {
                        draggableState = true;
                        //add Update
                      },
                      onDragEnd: (data) {},
                      onDragStarted: () {
                        trigger = 3;
                        dragging1 = _image[index];
                        dragging2 = _image2[index];
                        dragging3 = _image[index];
                      },
                      onDragUpdate: (data) {},
                      child: gridContainer(_image[index]))),
              footer: Container(
                child: GridTileBar(
                  backgroundColor: mainColor,
                  subtitle: Text(
                    '$champName',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 8,
                        color: subColor,
                        fontFamily: 'SegoeUI',
                        fontStyle: FontStyle.italic),
                  ),
                ),
                height: 18,
                decoration: myBoxDecoration(),
              ))),
    ),
    color: mainColor,
  );
}

/*extension GlobalKeyExtension on GlobalKey {
  Rect get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}*/
