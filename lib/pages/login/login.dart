import 'package:flutter/material.dart';
import 'package:flutter_gallery/utils/http/http_using.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// 登录
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _submitForm() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      // form.save();

      // 在这里添加登录逻辑，比如调用API
      // 如果登录成功，可以导航到另一个屏幕
      // 如果登录失败，可以显示一个错误消息

      var resp = await Fetch.get("/apis/login", params: {"username": "yy", "password": "qwer1234"});
      print(resp);
      print('Username: ${_usernameController.text}, Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: '用户名'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: '密码'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Container(
                  width: 1.sw,
                  margin: EdgeInsets.only(top: 30.w),
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Login'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
