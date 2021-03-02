import 'package:cobaflut/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:cobaflut/constants/color_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cobaflut/widgets/bottom_navigation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cobaflut/models/carousel_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int __current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // App Bar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          title: SvgPicture.asset('assets/svg/travelkuy_logo.svg'),
          elevation: 0,
        ),
        // Set Background Color
        backgroundColor: mBackgroundColor,
        //  Bottom Bar
        bottomNavigationBar: BottomNavigationTravelkuy(),
        // Body
        body: Container(
            child:
                ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 24),
            child: Text('Hi, Dio 👋 This Promo for you!', style: mTitleStyle),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          __current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(carousels[index].image),
                                fit: BoxFit.contain),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(carousels, (index, image) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 6,
                            width: 6,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: __current == index
                                    ? mBlueColor
                                    : mGreyColor),
                          );
                        }),
                      ),
                      Text('More...', style: mMoreDiscountStyle)
                    ],
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24),
            child: Text('Let\'s Booking!', style: mTitleStyle),
          ),
          Container(
            height: 144,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(
                                'assets/svg/service_flight_icon.svg',
                                fit: BoxFit.contain),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Flight',
                                    style: mServiceTitleStyle,
                                  ),
                                  Text(
                                    'Feel Fredoom',
                                    style: mServiceSubtitleStyle,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: mFillColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/service_flight_icon.svg',
                              fit: BoxFit.contain),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Flight',
                                  style: mServiceTitleStyle,
                                ),
                                Text(
                                  'Feel Fredoom',
                                  style: mServiceSubtitleStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    )
                  ],
                )
              ],
            ),
          ),
        ])));
  }
}
