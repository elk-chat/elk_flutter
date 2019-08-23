import 'package:elk_chat/blocs/auth/auth_state.dart';
import 'package:elk_chat/protocol/api/proto_helper.dart';
import 'package:elk_chat/repositorys/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'contact_detail.dart';

// 添加新联系人
class NewContactScreen extends StatefulWidget {
  final String title;
  final AuthState authState;
  final ChatRepository chatRepository;

  NewContactScreen(
      {Key key,
      @required this.title,
      @required this.authState,
      @required this.chatRepository})
      : super(key: key);

  @override
  _NewContactScreenState createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  String _status = 'init'; // init loading error
  List<User> _users = [];
  TextEditingController _controller = TextEditingController();
  UserGetUsersReq _userGetUsersReq = getUserGetUsersReq(0, 100, '');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _userGetUsersReq.clear();
    super.dispose();
  }

  handleSearch(text) {
    if (text.isEmpty) {
      return;
    }
    setState(() {
      _status = 'loading';
    });
    _userGetUsersReq.condition.userName = _controller.text;

    // 搜索联系人
    searchUser(_userGetUsersReq, (result) {
      if (!mounted) return;
      if (result.hasError) {
        print('searchUser has Error $result');
        setState(() {
          _status = 'error';
        });
      } else {
        UserGetUsersResp res = result.res;
        setState(() {
          _status = 'init';
          _users = res.users;
        });
      }
    });
  }

  // 点击联系人
  handleTap(User contact) {
    // Navigator.of(context).popUntil(ModalRoute.withName('/my-target-screen'));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ProfileScreen(
                  title: contact.userName,
                  contact: contact,
                  authState: widget.authState,
                  chatRepository: widget.chatRepository,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget tips = Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
    );
    Widget container = Container();
    // 初始化
    if (_status == 'init') {
      if (_users.isNotEmpty) {
        tips = Container(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
          child: Text('搜索结果',
              style: TextStyle(fontSize: 14, color: Colors.black45)),
        );
        container = Expanded(
            child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ContactWidget(
                avatarSize: 48,
                user: _users[index],
                onTap: () {
                  handleTap(_users[index]);
                });
          },
          itemCount: _users.length,
          separatorBuilder: (context, index) {
            return EDivider(
              indent: 66,
            );
          },
        ));
      }
    } else if (_status == 'loading') {
      // 加载中
      container = Container(
        child: Center(
            child: CupertinoActivityIndicator(
          radius: 10,
        )),
      );
    } else {
      // 加载失败
      container = Center(child: Container(child: Text('加载失败')));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                controller: _controller,
                onSubmitted: (text) {
                  handleSearch(text.trim());
                },
                textInputAction: TextInputAction.search,
                // style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    hintText: "搜索...",
                    // hintStyle: TextStyle(color: Colors.blue.shade200),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      MaterialCommunityIcons.getIconData('account-search'),
                      color: Colors.black87,
                      size: 22,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          MaterialCommunityIcons.getIconData('close-circle'),
                          color: Colors.black38,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _users = [];
                          });
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) => _controller.clear());
                        })),
              )),
          Container(
            child: Divider(
              height: 2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
          tips,
          container
        ],
      )),
    );
  }
}
