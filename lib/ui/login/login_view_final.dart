import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import "../../../util/image_util.dart";
import '../../../../main.dart';
import '../../../base/request_state.dart';

import '../../../localization/localization_constants.dart';
import '../../../util/color_util.dart';
import '../../route/navigation_service.dart';

import 'common_dialog.dart';
import '../../Common/login_button.dart';
import 'login_view.dart';

class LoginViewFinal extends StatefulWidget {
  @override
  _LoginViewFinalState createState() => _LoginViewFinalState();
}

class _LoginViewFinalState extends State<LoginViewFinal> {
  // late LoginPresenter _presenter;
  // late LoginUserDataModel _loginUserDataModel;
  // late LoginDataModel _loginDataModel;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _session = true;
  bool _loggedInChecked = false;
  bool _isLoading = true;
  bool _keyboardOpen = false;
  bool _passVisibility = true;

  bool _hasLoginData = false;
  bool _isRefreshTokenCheck = false;
  bool _navigated = false;
  bool _isWaiting = true;
  bool _errorShown = false; // Flag to track if error has been shown
  late StateSetter _setInnerState;
  // late AppConfig appConfig;

  List<String> _suggestedEmails = [];

  TextEditingController userNameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();


  void afterBuild() async {
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  void showSnackBar(String msg) {
    if (msg != 'Error') {
      final snackBar = SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Future.delayed(Duration(seconds: 3), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
    }
  }

  void navigateToHome() {
        NavigationService.getCurrentState()?.pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
        statusBarColor: ColorUtil.primaryDark, // Same as AppBar color
        statusBarIconBrightness: Brightness.light, // For light or dark icons
      ),
    );

    Color backgroundColor =
            const Color(0xFFFFB300);
    String loginIcon =  "Monon";

    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());

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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      ColorUtil.primaryDarkSwatch[900]!,
                      ColorUtil.primaryDarkSwatch[600]!,
                      ColorUtil.primaryDarkSwatch[600]!,
                      ColorUtil.primaryDarkSwatch[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
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
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(),
            // LoginText(
            //   isWaiting: _isWaiting,
            //   session: _session,
            //   isLoading: _isLoading,
            // ),
            const Spacer(),
            const Text("LOGIN TO CONTINUE",
            style: TextStyle(
              color: ColorUtil.button,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),),
            const Spacer(),
            // if (_session) _progressBar(),
             _emailWidget(),
            const Spacer(),
             _passwordWidget(),
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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
              LoginButton(
                key: Key('login-btn-layout'),
                onTap: navigateToHome,
              ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void onPressDonePassword() {
    // _errorShown = false; // Reset the error flag for a new login attempt
    // _presenter.attemptLogin(
    //   userNameCon.text.trim(),
    //   passwordCon.text,
    // );
    // _isLoading = true;
    // _session = true;
    // _setInnerState(() {});
  }

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
            hintStyle: const TextStyle(
              color: ColorUtil.button
            ),
            labelText: "Email / Phone number",
            labelStyle: const TextStyle(
                color: ColorUtil.button
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: ColorUtil.button),
            ),
            enabledBorder: OutlineInputBorder(
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
            getTranslated(context, "PLEASE_ENTER_YOUR EMAIL"),
            button1: getTranslated(context, "OK"),
            button1Flag: true,
            button1Color: ColorUtil.button,
          ),
        );
      }
          : onPressDonePassword,
      decoration: InputDecoration(
        labelText: "Enter Password",
        labelStyle: const TextStyle(
            color: ColorUtil.button
        ),
        hintText: "Password",
        hintStyle: const TextStyle(
            color: ColorUtil.button
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        suffixIcon: IconButton(
          icon: _passVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
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
      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(
        getTranslated(context, "NEW_ACCOUNT"),
        style: TextStyle(color: ColorUtil.loginDarkBackground),
      ),
    );
  }

  Widget _progressBar() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: LinearProgressIndicator(),
      ),
    );
  }
}
