import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool passwordSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login')
      ),
      body:Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 24),
                  defaultTextFormField(
                    labelText: 'Email Address',
                    icon: Icon(Icons.mail),
                    textController: emailController,
                    inputType: TextInputType.emailAddress,
                    validator: (value){
                      if(value != null)
                        if(value.isEmpty) return 'Email address must not be empty';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  defaultTextFormField(
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                    textController: passwordController,
                    secure: passwordSecure,
                    suffixIcon: passwordSecure ? Icons.visibility : Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                        passwordSecure = !passwordSecure;
                      });
                    },
                    validator: (value){
                      if(value != null)
                        if(value.isEmpty) return 'Password must not be empty';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  defaultButton(
                    text: 'Login',
                    function: (){
                      if(formKey.currentState?.validate() ?? false)
                        print(emailController.text);
                      },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?'
                      ),
                      TextButton(onPressed: (){}, child: const Text(
                        'Register Now'
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
