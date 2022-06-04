import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/modules/shop_modules/login/cubit/login_cubit.dart';
import 'package:udemy_flutter/modules/shop_modules/login/cubit/login_states.dart';
import 'package:udemy_flutter/modules/shop_modules/register/register_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class ShopLoginScreen extends StatelessWidget {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            Fluttertoast.showToast(
                msg: state.loginModel.message ??
                    'Wrong error from server or integration',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is ShopLoginFailureState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            /*showDialog(context: context, builder: (context) => AlertDialog(
                title: Text(
                    'Wrong',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                content: Text(
                  state.error
                ),
              ));*/
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Text('Login now to browse our hot offers',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54)),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultTextFormField(
                          labelText: 'Email',
                          textController: emailFieldController,
                          icon: Icon(Icons.email),
                          inputType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Email address is required';
                            }
                          }),
                      SizedBox(
                        height: 16.0,
                      ),
                      defaultTextFormField(
                        labelText: 'Password',
                        textController: passwordFieldController,
                        icon: Icon(Icons.lock_outline),
                        inputType: TextInputType.visiblePassword,
                        secure: !ShopLoginCubit.get(context).isPasswordVisible,
                        onSubmit: (value) {
                          if (formKey.currentState?.validate() == true)
                            ShopLoginCubit.get(context).userLogin(
                                email: emailFieldController.text,
                                password: passwordFieldController.text);
                        },
                        suffixIcon:
                            ShopLoginCubit.get(context).isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                        },
                        suffixPressed: () {
                          ShopLoginCubit.get(context).passwordVisible();
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      state is ShopLoginLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : defaultButton(
                              text: 'Login',
                              function: () {
                                if (formKey.currentState?.validate() == true)
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailFieldController.text,
                                      password: passwordFieldController.text);
                              }),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              navigateTo(context, RegisterScreen());
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
