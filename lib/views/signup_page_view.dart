import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/AppRoutes.dart';
import 'package:tunecache_with_flutter/controllers/user_controller.dart';
import 'package:tunecache_with_flutter/models/user_model.dart';
import 'package:tunecache_with_flutter/services/firebase_operations.dart';
import 'package:tunecache_with_flutter/services/validators.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuário'),
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
                    label: Text('Nome de usuário'),
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  controller: _userNameController,
                  validator: (value) => Validators.validateUserName('$value'),
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Confirme a Senha'),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                  controller: _passwordConfirmController,
                  obscureText: !_passwordVisible,
                  validator: (value) => Validators.validatePasswordConfirmation(
                      _passwordController.text, '$value'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserModel user = UserModel(
                        emailAdress: _emailController.text,
                        userName: _userNameController.text,
                        password: _passwordController.text,
                        passwordConfirm: _passwordConfirmController.text,
                      );
                      _userController.registerUser(context, user);
                    }
                  },
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
