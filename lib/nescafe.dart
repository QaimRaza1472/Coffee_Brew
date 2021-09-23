import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'collor_pallet.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class NesCafe extends StatefulWidget {
  @override
  _NesCafeState createState() => _NesCafeState();
}

class _NesCafeState extends State<NesCafe> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItem('assets/NesCafe2.png',"150",ColorPalette().secondSlice),
        buildListItem('assets/NesCafe.png',"200",ColorPalette().firstSlice),



      ],
    );
  }

  buildListItem(String imgPath,   String price,  Color bgColor){
    return GestureDetector(
      onTap: (){
      },
      child: Stack(
        children:[
          Container(
            height: 300,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage('assets/coffee.png'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: bgColor.withOpacity(0.9),
              ),
            ),
          ),
          Positioned(
            right: 120,
            child:Hero(
              tag: imgPath,
              child: Container(
                height: 230,
                width: 130,
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            top: 125,
            left:15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163d),
                    fontSize: 25,
                  ),
                ),
                Text(
                  '\$' +price,
                  style: GoogleFonts.bigShouldersText(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20,),
                Text("Grady\'s COLD BREW",
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xff23163d),
                    fontSize:27,
                  ),
                ),
                SizedBox(height: 2,),
                Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("65 Reviews",
                            style: GoogleFonts.bigShouldersText(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SmoothStarRating(
                            starCount: 5,
                            size: 18,
                            color: Colors.white,
                            borderColor: Colors.white,
                            rating: 3,
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add,
                                color: Colors.black,size: 16,),
                              SizedBox(width: 5,),
                              Text("Add",
                                style: GoogleFonts.bigShouldersText(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
