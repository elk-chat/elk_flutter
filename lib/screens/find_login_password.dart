import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class FindLoginPwdScreen extends StatelessWidget {
  Widget _buildPageContent(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('找回密码'),
          centerTitle: true,
          // leading: IconButton(
          //   icon: Icon(
          //     MaterialCommunityIcons.getIconData('close'),
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: Container(
          color: Colors.blue.shade100,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              _buildForm(context),
            ],
          ),
        ));
  }

  Container _buildForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 280,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      autocorrect: false,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          hintText: "用户名",
                          hintStyle: TextStyle(color: Colors.blue.shade200),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person_outline,
                            color: Colors.blue,
                          )),
                    )),
                Container(
                  child: Divider(
                    color: Colors.blue.shade400,
                  ),
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          hintText: "密码",
                          hintStyle: TextStyle(color: Colors.blue.shade200),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          )),
                    )),
                Container(
                  child: Divider(
                    color: Colors.blue.shade400,
                  ),
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  _launchURL(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text("提交", style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }

  void _launchURL(BuildContext context) async {
    try {
      await launch(
        'https://v2ex.com',
        option: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          // animation: CustomTabsAnimation.slideIn(),
          // or user defined animation.
          animation: const CustomTabsAnimation(
            startEnter: 'slide_up',
            startExit: 'android:anim/fade_out',
            endEnter: 'android:anim/fade_in',
            endExit: 'slide_down',
          ),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
            'com.UCMobile.intl',
            'com.tencent.mtt',
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
