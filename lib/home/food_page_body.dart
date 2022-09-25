import 'package:flutter/material.dart';
import 'package:food_app/Widgets/big_texts.dart';
import 'package:food_app/Widgets/small_text.dart';
import 'package:food_app/utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction : 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color:Colors.redAccent,
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
    return Stack(
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
              color: Colors.white
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
                    heigth: 20,
                  ),
                  frow
                ],
              )
            )
          ),
        )
      ]
    );
  }
}