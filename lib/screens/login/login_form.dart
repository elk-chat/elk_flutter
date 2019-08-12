import 'package:elk_chat/widgets/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:flutter_icons/material_community_icons.dart';
import '../find_login_password.dart';
import '../register.dart';

class LoginForm extends StatefulWidget {
  final AuthUnauthenticated authState;

  LoginForm({Key key, @required this.authState}) : super(key: key);

  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  FocusNode _passwordFocusNode;
  FocusNode _usernameFocusNode;
  String _text = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();

    if (widget.authState.account != null) {
      var userName = widget.authState.account.user.userName;
      if (userName.isNotEmpty) {
        _usernameController.text = userName;
        setState(() {
          _text = userName;
        });
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      loginBloc.dispatch(LoginButtonPressed(
        userName: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      // 监听 bloc 事件
      listener: (context, state) {
        if (state is LoginFailure) {
          showFlushBar(state.error, context);
        }
      },
      // 绑定
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
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
                  height: 25.0,
                ),
                Stack(
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
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      _text = val;
                                    });
                                  },
                                  controller: _usernameController,
                                  focusNode: _usernameFocusNode,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (term) {
                                    FocusScope.of(context)
                                        .requestFocus(_passwordFocusNode);
                                  },
                                  style: TextStyle(color: Colors.blue),
                                  decoration: InputDecoration(
                                      hintText: "用户名",
                                      hintStyle: TextStyle(
                                          color: Colors.blue.shade200),
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.person_outline,
                                        color: Colors.blue,
                                      ),
                                      suffixIcon: _text.isEmpty
                                          ? null
                                          : IconButton(
                                              icon: Icon(
                                                MaterialCommunityIcons
                                                    .getIconData(
                                                        'close-circle'),
                                                color: Colors.black38,
                                                size: 18,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _text = '';
                                                });
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) =>
                                                        _usernameController
                                                            .clear());

                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        _usernameFocusNode);
                                              })))),
                          Container(
                            child: Divider(
                              color: Colors.blue.shade400,
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 10.0),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (term) {
                                  if (state is LoginLoading) return;
                                  _onLoginButtonPressed();
                                },
                                obscureText: _obscureText,
                                style: TextStyle(color: Colors.blue),
                                decoration: InputDecoration(
                                    hintText: "密码",
                                    hintStyle:
                                        TextStyle(color: Colors.blue.shade200),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.blue,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          MaterialCommunityIcons.getIconData(
                                              _obscureText
                                                  ? 'eye-off-outline'
                                                  : 'eye'),
                                          color: Colors.black38,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        })),
                              )),
                          Container(
                            child: Divider(
                              color: Colors.blue.shade400,
                            ),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    HapticFeedback.mediumImpact();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (BuildContext context) =>
                                                FindLoginPwdScreen()));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, right: 20.0),
                                      child: Text(
                                        "忘记密码？",
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 14.0),
                                      )))
                            ],
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
                          onPressed: state is LoginLoading
                              ? null
                              : _onLoginButtonPressed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          child: Text(state is LoginLoading ? '登录中' : "登录",
                              style: TextStyle(color: Colors.white)),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80),
                    CupertinoButton(
                      onPressed: () async {
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterScreen(),
                                fullscreenDialog: true));
                        if (result != null) {
                          _usernameController.text = result['userName'];
                          _passwordController.text = result['password'];
                          setState(() {
                            _onLoginButtonPressed();
                          });
                        }
                      },
                      child: Text("或 注册新账号",
                          style: TextStyle(color: Colors.blue, fontSize: 14.0)),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
