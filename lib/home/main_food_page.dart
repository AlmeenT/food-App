import 'package:flutter/material.dart';
import 'package:food_app/Widgets/big_texts.dart';
import 'package:food_app/utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              margin: EdgeInsets.only(top:45, bottom:15),
              padding: EdgeInsets.only(left:20, right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      BigTexts(text: 'Nigeria', color: AppColors.mainColor, ),
                      Text('City')
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:  AppColors.mainColor
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white
                      )
                    ),
                  )
                ],
              )
            )
          ),
      ]
      ),
    );
  }
}