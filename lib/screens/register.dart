import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../protocol/api/auth.dart' as auth;

/// 注册，简单的 loading 不需要 bloc
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  BuildContext _context;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final UserRegisterReq _UserRegisterReq = UserRegisterReq();

  FocusNode _usernameFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _confirmPasswordFocusNode;

  bool loading = false;

  @override
  void initState() {
    super.initState();

    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  /// 展示提示
  void showTip(String text, [bool isSuccess = false]) {
    showFlushBar(text, context);
  }

  void onSubmit() {
    // 检查
    var error_msg = '', focusNode;
    if (_usernameController.text.isEmpty) {
      error_msg = '用户名必填';
      focusNode = _usernameFocusNode;
    } else if (_passwordController.text.isEmpty) {
      error_msg = '密码必填';
      focusNode = _passwordFocusNode;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      error_msg = '两次密码不一样';
      focusNode = _confirmPasswordFocusNode;
    }

    // 如果有错误信息
    if (error_msg.isNotEmpty) {
      showTip(error_msg);
      FocusScope.of(_context).requestFocus(focusNode);
      return;
    }

    // 如果没有，设置正在请求中
    setState(() {
      loading = true;
    });
    _UserRegisterReq.userName = _usernameController.text;
    _UserRegisterReq.password = _passwordController.text;
    // 发送请求
    auth.register(_UserRegisterReq, (data) {
      if (data.hasError) {
        setState(() {
          loading = false;
        });
        showTip(data.res);
        return;
      }

      Navigator.pop(_context, {
        'userName': _usernameController.text,
        'password': _passwordController.text
      });
    });
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            child: Image.asset('assets/img/origami.png'),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                onPressed: loading
                    ? null
                    : () {
                        Navigator.pop(context);
                      },
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildForm() {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 320,
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
                      focusNode: _usernameFocusNode,
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (term) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
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
                      focusNode: _passwordFocusNode,
                      controller: _passwordController,
                      onSubmitted: (term) {
                        FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocusNode);
                      },
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          hintText: "密码",
                          hintStyle: TextStyle(color: Colors.blue.shade200),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock_open,
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
                      focusNode: _confirmPasswordFocusNode,
                      controller: _confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (term) {
                        if (loading) return;
                        onSubmit();
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          hintText: "确认密码",
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
            height: 340,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: loading
                    ? null
                    : () {
                        this.onSubmit();
                      },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text(loading ? '立即注���中' : '立即注册',
                    style: TextStyle(color: Colors.white)),
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
      body: Builder(builder: (BuildContext context) {
        _context = context;
        return _buildPageContent(context);
      }),
    );
  }
}
