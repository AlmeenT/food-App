import 'package:flutter/material.dart';
import 'package:food_app/Widgets/big_texts.dart';
import 'package:food_app/Widgets/icon_and_text.dart';
import 'package:food_app/Widgets/small_text.dart';
import 'package:food_app/utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction : 0.85);
  var currPageValue  = 0.0;
  double scaleFactor = 0.8;
  

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
        
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(
            position
          );
        } )
    );
  }

  Widget _buildPageItem (int index){
    var height = 220;
    Matrix4 matrix = new Matrix4.identity();
    if (index == currPageValue.floor()){
      var CurrScale = 1-(currPageValue-index) * (1- scaleFactor);
      var currTrans = height * (1-CurrScale)/2;
      matrix = Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1){
      var CurrScale = scaleFactor + (currPageValue - index + 1) * (1- scaleFactor);
      var currTrans = height * (1-CurrScale)/2;
      matrix = Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1){
      var CurrScale = 1-(currPageValue-index) * (1- scaleFactor);
      var currTrans = height * (1-CurrScale)/2;
      matrix = Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var CurrScale = 0.8;
      var currTrans = height * (1-CurrScale)/2;
      matrix = Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right:10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df): Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/jollof.jpg'
                )
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right:30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow : [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top:15, left:15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BigTexts(text: 'Jollof Rice'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Wrap(
                          children: List.generate(5, (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '4.5'),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '1287'),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: 'comments')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        IconAndText(icon: Icons.circle_sharp, text: 'Normal',  iconColor: AppColors.iconColor1),
                        SizedBox(
                          width: 10,
                        ),
                         IconAndText(icon: Icons.location_on, text: '1.7km',  iconColor: AppColors.mainColor),
                         SizedBox(
                          width: 10,
                        ),
                          IconAndText(icon: Icons.access_time_rounded, text: '32min',  iconColor: AppColors.iconColor1)
                      ],
                    )
                  ],
                )
              )
            ),
          )
        ]
      ),
    );
  }
}