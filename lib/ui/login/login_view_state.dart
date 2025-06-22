import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../localization/localization_constants.dart';
import '../../../util/color_util.dart';
import "../../../util/image_util.dart";
import '../../Common/login_button.dart';
import '../../route/navigation_service.dart';
import '../../shared_pref/shared_pref_util.dart';
import 'common_dialog.dart';

class LoginViewFinal extends StatefulWidget {
  const LoginViewFinal({super.key});

  @override
  _LoginViewFinalState createState() => _LoginViewFinalState();
}

class _LoginViewFinalState extends State<LoginViewFinal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _keyboardOpen = false;
  bool _passVisibility = true;

  late StateSetter _setInnerState;

  List<String> _suggestedEmails = [];

  TextEditingController userNameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  // void afterBuild() async {
  //   // Check if user is logged in
  //   bool isLoggedIn = await SharedPrefUtil().getIsLoggedIn();
  //   bool isIntroCompleted = await SharedPrefUtil().getIsTntro();
  //
  //   if (isLoggedIn == true) {
  //     if (isIntroCompleted == true) {
  //       isLoading = false;
  //       _setInnerState(() {});
  //       navigateToEmotionPage();
  //     } else {
  //       isLoading = false;
  //       _setInnerState(() {});
  //       navigateToWelcome();
  //     }
  //   } else {
  //     isLoading = false;
  //     _setInnerState(() {});
  //   }
  // }

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? userRole;
  late bool isLoading;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userNameCon.text.trim(),
              password: passwordCon.text.trim());

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userCredential.user != null) {
        SharedPrefUtil().setLoggedIn();
        if (userDoc.exists) {
          setState(() {
            userRole = userDoc['role'];
          });

          if (userRole == 'super_admin') {
            if (kDebugMode) {
              print(userRole);
            }
          } else if (userRole == 'admin') {
            if (kDebugMode) {
              print(userRole);
            }
          } else if (userRole == 'volunteer') {
            if (kDebugMode) {
              print(userRole);
            }
          } else {
            if (kDebugMode) {
              print("Unauthorized role");
            }
          }
        }
        navigateToWelcome();
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ Error: Credentials did not found")),
        );
      }

      // if (userDoc.exists) {
      //   setState(() {
      //     userRole = userDoc['role'];
      //   });
      //
      //   if (userRole == 'super_admin') {
      //     if (kDebugMode) {
      //       print(userRole);
      //     }
      //   } else if (userRole == 'admin') {
      //     if (kDebugMode) {
      //       print(userRole);
      //     }
      //   } else {
      //     if (kDebugMode) {
      //       print("Unauthorized role");
      //     }
      //   }
      //   SharedPrefUtil().setLoggedIn();
      //   navigateToWelcome();
      // } else {
      //   if (userCredential.user != null) {
      //     SharedPrefUtil().setLoggedIn();
      //     navigateToWelcome();
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text("❌ Error: Credentials did not found")),
      //     );
      //   }
      // }
    } catch (e) {
      if (kDebugMode) {
        print('Login failed: $e'); // this already exists
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void showSnackBar(String msg) {
    if (msg != 'Error') {
      final snackBar = SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Future.delayed(const Duration(seconds: 3), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
    }
  }

  void navigateToHome() {
    NavigationService.getCurrentState()
        ?.pushReplacementNamed('/home', arguments: 0);
  }

  void navigateToWelcome() {
    NavigationService.getCurrentState()
        ?.pushReplacementNamed('/welcome', arguments: 0);
  }

  void navigateToEmotionPage() {
    NavigationService.getCurrentState()
        ?.pushReplacementNamed('/emotions_first_submit');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorUtil.primaryDark, // Same as AppBar color
        statusBarIconBrightness: Brightness.light, // For light or dark icons
      ),
    );

    Color backgroundColor = const Color(0xFFFFB300);
    String loginIcon = "Monon";

    // WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());

    return _loginPage(backgroundColor, loginIcon);
  }

  Widget _loginPage(Color colorBackground, String loginIcon) {
    _keyboardOpen = MediaQuery.of(context).viewInsets.bottom == 0;

    return SafeArea(
      key: Key('login-page'),
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        // backgroundColor: ColorUtil.primaryDark,
        body: StatefulBuilder(builder: (cntx, state) {
          _setInnerState = state;
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white
                    // gradient: LinearGradient(
                    //   colors: <Color>[
                    //     ColorUtil.primarySwatch[700]!,
                    //     ColorUtil.primarySwatch[400]!,
                    //     ColorUtil.primarySwatch[300]!,
                    //     ColorUtil.primarySwatch[200]!,
                    //   ],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),

                    ),
              ),
              _backgroundLayout(loginIcon),
              _foregroundLayout1(),
              if (_keyboardOpen) _foregroundLayout2(),
            ],
          );
        }),
      ),
    );
  }

  Widget _backgroundLayout(String loginIcon) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Image.asset(
                  ImageUtil.LOGIN_MONON_ICON,
                  key: const Key('logo-image'),
                  width: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        SizedBox(
          height: (_keyboardOpen) ? 450 : 230,
        ),
      ],
    );
  }

  Widget _foregroundLayout1() {
    return Positioned(
      bottom: (_keyboardOpen) ? 150 : 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        // height: 300,
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              ColorUtil.primarySwatch[700]!,
              ColorUtil.primarySwatch[500]!,
              ColorUtil.primarySwatch[400]!,
              ColorUtil.primarySwatch[300]!,
            ],
          ),
          // color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "LOGIN TO CONTINUE",
              style: TextStyle(
                // color: ColorUtil.button,
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Spacer(),
            // if (_session) _progressBar(),
            _emailWidget(),
            const Spacer(),
            _passwordWidget(),
            // SizedBox(height: (_keyboardOpen)? 0: 150,)
          ],
        ),
      ),
    );
  }

  Widget _foregroundLayout2() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        // ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              ColorUtil.primarySwatch[700]!,
              ColorUtil.primarySwatch[500]!,
              ColorUtil.primarySwatch[400]!,
              ColorUtil.primarySwatch[300]!,
            ],
          ),
          // color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // isLoading
            //     ? const CircularProgressIndicator()
            //     : LoginButton(
            //         isLoading,
            //         onTap: login,
            //       ),
            LoginButton(
              isLoading,
              onTap: login,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void onPressDonePassword() {}

  Widget _emailWidget() {
    return Autocomplete<String>(
      key: Key('email-input'),
      optionsBuilder: (TextEditingValue value) {
        if (value.text.isEmpty) {
          return [];
        }

        return _suggestedEmails.where((suggestion) {
          if (suggestion.toLowerCase() == value.text) return false;
          return suggestion.toLowerCase().contains(value.text.toLowerCase());
        });
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        fieldTextEditingController.text = userNameCon.text;
        fieldTextEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: fieldTextEditingController.text.length));
        userNameCon = fieldTextEditingController;

        return TextField(
          key: Key('email-input-field'),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "Enter phone no",
            hintStyle: TextStyle(color: Colors.grey.shade500),
            labelText: "Email / Phone number",
            labelStyle: TextStyle(color: Colors.grey.shade500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: ColorUtil.button),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: ColorUtil.button),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: ColorUtil.button),
            ),
          ),
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 40),
              height: options.length > 3 ? 63.0 * 3 : 63.0 * options.length,
              child: Scrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.all(2.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);

                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(
                        title: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _passwordWidget() {
    return TextField(
      key: Key('password-input'),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      controller: passwordCon,
      autofocus: false,
      obscureText: _passVisibility,
      onEditingComplete: (userNameCon.text.isEmpty)
          ? () {
              showDialog(
                context: context,
                builder: (context) => CommonDialog(
                  title: getTranslated(context, "NO_EMAIL_ADDRESS"),
                  description:
                      getTranslated(context, "PLEASE_ENTER_YOUR_EMAIL"),
                  button1: getTranslated(context, "OK"),
                  button1Flag: true,
                  button1Color: ColorUtil.button,
                ),
              );
            }
          : login,
      decoration: InputDecoration(
        labelText: "Enter Password",
        labelStyle: TextStyle(color: Colors.grey.shade500),
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        suffixIcon: IconButton(
          icon: _passVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            _passVisibility = !_passVisibility;
            _setInnerState(() {});
          },
        ),
      ),
    );
  }

  Widget _newAccountText() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(
        getTranslated(context, "NEW_ACCOUNT"),
        style: const TextStyle(color: ColorUtil.loginDarkBackground),
      ),
    );
  }

  Widget _progressBar() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: LinearProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
  }
}
