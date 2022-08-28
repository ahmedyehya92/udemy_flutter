import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/modules/shop_modules/login/cubit/login_cubit.dart';
import 'package:udemy_flutter/modules/shop_modules/login/cubit/login_states.dart';
import 'package:udemy_flutter/modules/shop_modules/register/register_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
  final CacheHelper cacheHelper;
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ShopLoginScreen(this.cacheHelper);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {

            showToast(
                state.loginModel.message ?? 'done',
                ToastColorMode.SUCCESS);
            cacheHelper.saveData(key: IS_LOGGED_IN_SHARED_PREF_KEY, value: true)?.then((value) {
              navigateAndFinish(context, ShopLayout());
            });
            
            cacheHelper.saveMultipleData(args: {
              IS_LOGGED_IN_SHARED_PREF_KEY: true,
              TOKEN_SHARED_PREF_KEY: state.loginModel.data?.token
            });
            


          } else if (state is ShopLoginFailureState) {
            showToast(state.error, ToastColorMode.ERROR);
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
