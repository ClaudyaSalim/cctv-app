import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xyz_application/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                const Text('Welcome back!', style: TextStyle(fontSize: 20),),
                const SizedBox(
                  height: 24,
                ),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Image(image: AssetImage('assets/logo_xyz.png'))
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                    labelText: 'Email'
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                }, 
                child: const Text('Login')
                )
              ],
            ),
          ),
        )
    );
  }
}