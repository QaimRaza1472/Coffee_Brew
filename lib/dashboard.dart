import 'package:coffee/cold_brew.dart';
import 'package:coffee/collor_pallet.dart';
import 'package:coffee/goldbrew.dart';
import 'package:flutter/material.dart';
import 'collor_pallet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'black_gold.dart';
import 'nescafe.dart';
import 'mccafe.dart';


class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  final colorPalette=ColorPalette();

  var _selectedOption=0;

  List allOptions = [
    BlackGold(),
    ColdBrew(),
    NesCafe(),
    McCafe(),
    GoldBrew(),
  ];

  List isSelected=[true,  false,  false,  false, false];


  @override
  Widget build(BuildContext context) {

    var ScreenHeight=MediaQuery.of(context).size.height;
    var ScreenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenHeight,
            width: ScreenWidth,
            color: Colors.transparent,
          ),
          Container(
            height: ScreenHeight,
            width: ScreenWidth/5,
            color: colorPalette.leftBarColor,
          ),
          Positioned(
            left: ScreenWidth/5,
              child: Container(
                height: ScreenHeight,
                width: ScreenWidth-(ScreenWidth/5),
                color: Colors.white,
              ),
          ),
          Positioned(
              top: 35,
              left: 20,
              child:Icon(Icons.menu),
          ),
          Positioned(
              top: 35,
              right: 20,
              child: Icon(Icons.shopping_bag_outlined),
          ),
          Positioned(
              top: ScreenHeight-(ScreenHeight-100),
              left: (ScreenWidth/5)+25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CoffeeHouse",
                  style: GoogleFonts.bigShouldersText(
                    color:Color(0xFF23163d),
                    fontSize:40,
                  ),
                  ),
                  Text(
                    "A lot can happen over coffee",
                    style:  GoogleFonts.bigShouldersText(
                      color:Color(0xFFa59fb0),
                      fontSize:16,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 40,
                    width: 225,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: EdgeInsets.only(top: 10,left: 10),
                        hintText: "search...",
                        hintStyle: GoogleFonts.bigShouldersText(
                          color:Color(0xFFA59FB0),
                          fontSize: 15,
                        ),
                          suffixIcon:Icon(Icons.search,
                          color: Colors.grey.withOpacity(0.4),

                          ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
          buildSideNavigator(),
          Positioned(
            top: (ScreenHeight / 3)+ 5,
            left: (ScreenWidth / 5)+ 25,
            child: Container(
              height: ScreenHeight -((ScreenHeight/3) + 50),
              width: ScreenWidth - ((ScreenWidth / 5)) + 40,
              child: allOptions[_selectedOption],


              ),
          ),
        ],
      ),
    );
  }



  buildSideNavigator(){
    return Positioned(
      top: 75,
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            width: MediaQuery.of(context).size.height-100,
            height: MediaQuery.of(context).size.width/5,
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                buildOption('Black Gold',0),
                buildOption('Cold Brew',1),
                buildOption('NesCafe',2),
                buildOption('McCafe',3),
                buildOption('Gold Brew',4),
              ],
            ),
          ),
        ),
    );
  }


  buildOption(String title, int index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index] ? Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff23163d),
          ),
        ) :Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
        ),
        SizedBox(height: 5,),
        GestureDetector(
          onTap: (){
            setState(() {
              _selectedOption=index;
              isOptionSelected(index);
            });
           },
          child: Text(title,
            style: isSelected[index] ? GoogleFonts.bigShouldersText(
              color: Color(0xff23163d),fontSize: 18,
            ):GoogleFonts.bigShouldersText(
              color: Color(0xffa59FB0),fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }

  isOptionSelected(index){
    var previousIndex=isSelected.indexOf(true);
    isSelected[index]=true;
    isSelected[previousIndex]=false;
  }


}


