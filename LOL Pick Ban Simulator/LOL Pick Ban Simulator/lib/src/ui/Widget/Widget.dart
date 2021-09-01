import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/list.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: mainColor,
    border: Border.all(color: subColor),
  );
}

TextStyle nameTextField() {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 4,
      color: subColor);
}

TextStyle titleLogo(multiple, color, style) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: style,
      fontSize: displayRatio * multiple,
      color: color);
}

Widget basicAppBar(context) {
  return AppBar(
      actions: [
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: mainColor, onPrimary: subColor),
          child: Icon(Icons.info),
          onPressed: () {
            return showDialog(
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
                                        decoration:
                                            BoxDecoration(color: mainColor),
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
                                        bottom: BorderSide(color: subColor),
                                      )),
                                      child: Row(
                                        children: [
                                          champInfo(),
                                          champInfo(),
                                          champInfo(),
                                          champInfo(),
                                          champInfo()
                                        ],
                                      )),
                                  Container(
                                    child: Container(
                                        width: displayWidth * 0.427,
                                        height: displayHeight * 0.05,
                                        alignment: Alignment.center,
                                        decoration:
                                            BoxDecoration(color: mainColor),
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
                                        bottom: BorderSide(color: subColor),
                                      )),
                                      child: Row(
                                        children: [
                                          champInfo(),
                                          champInfo(),
                                          champInfo(),
                                          champInfo(),
                                          champInfo()
                                        ],
                                      )),
                                ],
                              ))));
                });
          },
        ),
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
      backgroundColor: mainColor);
}

Widget champInfo() {
  return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  'Tanker',
                  style: TextStyle(
                    color: subColor,
                    fontSize: displayHeight * 0.012,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  'AP',
                  style: TextStyle(
                    color: subColor,
                    fontSize: displayHeight * 0.012,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  'Hard CC',
                  style: TextStyle(
                    color: subColor,
                    fontSize: displayHeight * 0.012,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ));
}

Widget blueTeamExpanded(n) {
  final upController = Get.put(UpdateController());
  return Expanded(
    flex: 1,
    child: Container(
      height: displayHeight * 0.08,
      decoration: myBoxDecoration(),
      child: Image.asset(
        '${upController.bluPlayer[n]}',
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget redTeamExpanded(n) {
  final upController = Get.put(UpdateController());
  return Expanded(
    flex: 1,
    child: Container(
      height: displayHeight * 0.08,
      decoration: myBoxDecoration(),
      child: Image.asset(
        '${upController.redPlayer[n]}',
        fit: BoxFit.cover,
      ),
    ),
  );
}

BoxDecoration myTextBoxDecoration(double width, Color colors, double radius) {
  return BoxDecoration(
      color: colors,
      border: Border.all(color: subColor, width: width),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

TextStyle teamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 7,
      color: selectedColor);
}

Widget basicDrawer() {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(color: mainColor)),
      ListTile(
        leading: Icon(
          Icons.delete_forever_outlined,
          size: displayRatio * 20,
          color: mainColor,
        ),
        title: Text(
          'Delete All',
        ),
        trailing: Icon(
          Icons.drag_handle,
          size: displayRatio * 20,
          color: mainColor,
        ),
        dense: true,
        onTap: () {},
      ),
    ],
  ));
}

Widget playerNameEditContainer(lineNum, hintText) {
  return Row(
    children: [
      Container(
        width: displayWidth * 0.08,
        height: displayHeight * 0.04,
        child: SvgPicture.asset(
          lines[lineNum],
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(displayWidth * 0.04, 5, 0, 0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: displayHeight * 0.04,
          width: displayWidth * 0.5,
          child: TextField(
            decoration: InputDecoration(
                hintText: hintText, hintStyle: TextStyle(color: mainColor)),
          ),
        ),
      )
    ],
  );
}

Widget gridContainer(con) {
  if (con != champIcon) {
    champName = con.substring(47).replaceAll('.jpg', '');
  }
  return Stack(children: [
    greyOutChampContainer(con),
    Container(
        width: displayWidth * 0.2,
        height: displayHeight * 0.1,
        child: Image.asset(con, fit: BoxFit.cover),
        decoration: myBoxDecoration())
  ]);
}

Widget teamName(Color selectColors, String hintText) {
  return Container(
    width: displayWidth * 0.427,
    height: displayHeight * 0.05,
    alignment: Alignment.center,
    decoration: myBoxDecoration(),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          hintStyle: teamColor(selectColors),
          hintText: hintText,
          contentPadding: EdgeInsets.all(7)),
      style: teamColor(selectColors),
    ),
  );
}

Widget playerName(String text) {
  return Container(
    height: 11,
    width: displayRatio * 40,
    child: TextField(
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: text,
        hintStyle: nameTextField(),
      ),
      textAlign: TextAlign.right,
      style: nameTextField(),
    ),
  );
}

Widget feedbackContainer(dynamic com) {
  return Container(
      width: displayWidth * 0.2,
      height: displayHeight * 0.12,
      decoration: new BoxDecoration(
        color: mainColor,
        border: Border.all(color: subColor, width: 3),
        image: DecorationImage(image: AssetImage(com), fit: BoxFit.cover),
      ));
}

BoxDecoration myTabBoxDecoration() {
  return BoxDecoration(border: Border.all(color: subColor), color: mainColor);
}

// ignore: non_constant_identifier_names
Widget ChampContainer2() {
  return Container(
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
            image: new AssetImage(champIcon),
            fit: BoxFit.scaleDown,
          )));
}

Widget greyOutChampContainer(dynamic champ) {
  return Container(
      foregroundDecoration: BoxDecoration(
        color: Colors.grey,
        backgroundBlendMode: BlendMode.saturation,
      ),
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
            image: new AssetImage(champ),
            fit: BoxFit.cover,
          )));
}

DecorationImage imageMaker(dynamic champ) {
  return DecorationImage(image: new AssetImage(champ), fit: BoxFit.cover);
}

Widget countryTextContainer(String country) {
  if (country == 'lck') {
    country = "한국";
  } else if (country == 'lpl') {
    country = '중국';
  } else if (country == 'lec') {
    country = '유럽';
  } else if (country == 'lcs') {
    country = '북미';
  } else if (country == 'ljl') {
    country = '일본';
  } else if (country == 'tcl') {
    country = '터키';
  } else if (country == 'tcl') {
    country = '터키';
  } else if (country == 'cblol') {
    country = '브라질';
  } else if (country == 'lco') {
    country = '오세아니아';
  } else if (country == 'lla') {
    country = '라틴아메리카';
  } else if (country == 'lcl') {
    country = '독립국가연합';
  }

  return Container(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.fromLTRB(
        displayWidth * 0.04, 0, displayWidth * 0.05, displayHeight * 0.005),
    child: Text(
      country,
      style: titleLogo(displayHeight * 0.009, subColor, FontStyle.normal),
    ),
  );
}

Widget nameTextFieldForm(int _maxlength) {
  return Container(
    height: displayHeight * 0.04,
    margin: EdgeInsets.fromLTRB(displayWidth * 0.1, displayHeight * 0.025,
        displayWidth * 0.1, displayHeight * 0.015),
    child: Container(
        margin: EdgeInsets.fromLTRB(
            displayWidth * 0.04, 0, displayWidth * 0.04, displayHeight * 0.005),
        child: TextFormField(
          style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
          maxLines: 1,
          maxLength: _maxlength,
          decoration: InputDecoration(
              counterStyle: TextStyle(color: subColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white, width: displayHeight * 0.002),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: subColor, width: displayHeight * 0.002),
              )),
          textAlignVertical: TextAlignVertical.center,
        )),
  );
}

Widget nameText(String _hint, double margin) {
  return Container(
    margin:
        EdgeInsets.fromLTRB(0, displayHeight * 0.02, displayWidth * margin, 0),
    child: Text(
      _hint,
      style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
    ),
  );
}

Widget genderButton(String gender) {
  Color tempConlor;
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        primary: mainColor,
        onPrimary: subColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: subColor),
          borderRadius: new BorderRadius.circular(30.0),
        )),
    onPressed: () {
      debugPrint('hello');
    },
    child: Text(gender),
  );
}

Widget traitButton(String trait, double marginLeft) {
  return Container(
      margin: EdgeInsets.fromLTRB(marginLeft, 0, 0, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            primary: mainColor,
            onPrimary: subColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: subColor),
              borderRadius: new BorderRadius.circular(30.0),
            )),
        onPressed: () {
          debugPrint('hello');
        },
        child: Text(trait),
      ));
}

Widget Rot() {
  return RotatedBox(
    quarterTurns: 1,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      height: displayHeight * 0.154,
      decoration: BoxDecoration(
          border: Border.all(color: subColor, width: displayHeight * 0.003)),
      child: Column(
        children: [
          Container(
            child: Text(
              '2021/1/10 10:30PM',
              style: TextStyle(color: subColor),
            ),
          ),
          Row(
            children: [
              Container(
                  height: displayHeight * 0.1,
                  width: displayWidth * 0.16,
                  child: Image.asset(leagues.league_lck[9])),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.04, 0, displayWidth * 0.04, 0),
                  child: Text(
                    'VS',
                    style: titleLogo(10, subColor, FontStyle.normal),
                  )),
              Container(
                  height: displayHeight * 0.1,
                  width: displayWidth * 0.16,
                  child: Image.asset(leagues.league_lck[2])),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget playerCard() {
  return Container(
    child: FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Container(
          height: displayHeight * 0.17,
          child: Stack(
            children: [
              Container(
                height: displayHeight * 0.17,
                child: Image.asset(
                  'assets/images/player/card/player_gold.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    displayWidth * 0.023, displayHeight * 0.04, 0, 0),
                child: Image.asset(
                  'assets/images/test/faker.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.01, displayHeight * 0.015, 0, 0),
                  child: Container(
                    height: displayHeight * 0.018,
                    child: Image.asset(
                      'assets/images/test/south korea.png',
                    ),
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.08, displayHeight * 0.01, 0, 0),
                  child: Text(
                    'Faker',
                    style: TextStyle(
                        fontSize: displayHeight * 0.02,
                        color: Colors.white,
                        fontFamily: 'SegoeUI',
                        fontWeight: FontWeight.w700),
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.01, displayHeight * 0.028, 0, 0),
                  child: Container(
                    height: displayHeight * 0.03,
                    child: Image.asset(
                      'assets/images/league_picture/lck/T1.png',
                    ),
                  )),
              Container(
                height: displayHeight * 0.074,
                padding: EdgeInsets.fromLTRB(
                    displayWidth * 0.016, displayHeight * 0.054, 0, 0),
                child: Image.asset(
                  'assets/images/lines/mid.png',
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.01, displayHeight * 0.075, 0, 0),
                  child: Text(
                    '99',
                    style: TextStyle(
                        fontSize: displayHeight * 0.023,
                        color: Colors.white,
                        fontFamily: 'SegoeUI',
                        fontWeight: FontWeight.w600),
                  )),
            ],
          )),
      back: Container(
        height: displayHeight * 0.17,
        child: Image.asset(
          'assets/images/player/card/player_empty.png',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
