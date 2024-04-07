import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/apis/user.dart';
import 'package:flutter_gallery/utils/storage/storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gallery/widgets/my_snackbar/my_snackbar.dart';

/// 登录
class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool _isLoading = false;
  final storage = Storage();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // 登录操作
  void _submitForm() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      // form.save();

      // 在这里添加登录逻辑，比如调用API
      // 如果登录成功，可以导航到另一个屏幕
      // 如果登录失败，可以显示一个错误消息
      setState(() {_isLoading = true;});
      var resp = await UserApi.register({"username": _usernameController.text, "password": _passwordController.text});
      setState(() {_isLoading = false;});
      MySnackbar.success(message: '注册成功，即将前往登录页');
      Timer(const Duration(seconds: 2), () {
        context.go('/login');
      });
    }
  }

  void _goRegister() {
    context.go('/login');
  }

  Widget _buildButtonContent() => _isLoading ?
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('注册中', style: TextStyle(fontSize: 18)),
      Container(
        width: 24.0,
        height: 24.0,
        margin: const EdgeInsets.only(left: 10),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
    ],
  ) : const Text('注册', style: TextStyle(fontSize: 18));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _goRegister,
                        child: const Text('已有账号？去登录')
                    )
                  ],
                ),
                Container(
                  width: 1.sw,
                  height: 50,
                  margin: EdgeInsets.only(top: 30.w),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.redAccent), // 背景颜色
                      foregroundColor: const MaterialStatePropertyAll(Colors.white), // 文字/图标 颜色
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // 配置圆角 - 默认圆角
                          )
                      ),
                    ),
                    child: _buildButtonContent(),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
