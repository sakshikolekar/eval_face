import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinal/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: HomePage() ,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp>_initializeFirebase() async {
    FirebaseApp firebaseApp= await Firebase.initializeApp();
      return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return loginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
            );
        },
      ),
      );
  }
  
}


class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  static Future<User?>loginUsingEmailPassword({required String email, required String password,required BuildContext context} )async{
        FirebaseAuth auth= FirebaseAuth.instance;
        User? user;
        try{
          UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
          user = userCredential.user;
        } on FirebaseAuthException catch(e){
          if(e.code == "user-not-found"){
            print("no user found for that email");
          }

        }
        return user;
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =TextEditingController();
    TextEditingController _passwordController =TextEditingController();
    return Container(
      height: 1000,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img3.jpg'),
            fit: BoxFit.cover
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                          Container(
                            width: 300,
                            height: 200,
                            child: Image.asset('assets/images/logo.jpg')
                          ),
                          const   SizedBox(
                            height: 44.0,
                            ),
                          Text("Eval-Face ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          )
                          ),
                          Text(
                            "login to your app",
                            style: TextStyle(color: Colors.black,
                             fontWeight: FontWeight.bold
                             ),
                          ),
                          const   SizedBox(
                            height: 44.0,
                            ),
                               TextField(
                              controller: _emailController ,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: "user Email",
                                prefixIcon: Icon(Icons.mail,color: Colors.black),
                              ),
                            ),
                             const  SizedBox(
                              height: 26.0,
                            ),
                              TextField(
                                controller: _passwordController,
                              obscureText: true,
                               decoration: const InputDecoration(
                                hintText: "user Password",
                                prefixIcon: Icon(Icons.lock,color: Colors.black),
                               ),
                          ),
                          const   SizedBox(
                            height: 12.0,
                            ),
                          const   Text("dont remember your password?" ,
                          style: TextStyle(
                            color: Colors.blue,)
                          ),
                            const  SizedBox(
                            height: 88.0,
                            ),
                              Container(
                              width: double.infinity,
                              child: RawMaterialButton(
                                fillColor:const Color(0xFF0069FE),
                                elevation: 0.0,
                                padding:const EdgeInsets.symmetric(vertical: 20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius:BorderRadius.circular(12.0)), 
                                 
                                onPressed:()async {
                                   User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                                    print(user);
                                    if(user != null){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen()));
                    
                                    }
                                },
                               child: const Text("login" ,
                               style: TextStyle(color: Colors.white,
                               fontSize: 18.0,
                               )) ,
                               ),
                            ),
                      ],
                    ),
                  ),
              ],
            ),
            ),
          ),
      ),
    );
  }
}

