import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/AppRoutes.dart';
import 'package:tunecache_with_flutter/controllers/user_controller.dart';
import 'package:tunecache_with_flutter/models/user_model.dart';
import 'package:tunecache_with_flutter/services/firebase_operations.dart';
import 'package:tunecache_with_flutter/services/validators.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("images/Tune_Logo_Name.png"),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('E-mail'),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  controller: _emailController,
                  validator: (value) => Validators.validateEmail('$value'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Senha'),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  validator: (value) => Validators.validatePassword('$value'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _userController.loginUser(
                        context,
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)),
                ),
                TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signUpPage),
                    child: Text('Criar uma nova conta')),
                TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.forgotPassPage),
                    child: Text('Esqueci minha senha'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
