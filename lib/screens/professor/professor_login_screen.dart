import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_class_app/common/localization/messages.dart';
import 'package:my_class_app/cubit/init_cubit.dart';
import 'package:my_class_app/cubit/init_state.dart';
import 'package:my_class_app/screens/Inicial/init_screen.dart';
import 'package:my_class_app/widgets/button.dart';
import 'package:my_class_app/widgets/input.dart';
import 'package:my_class_app/widgets/main_container.dart';

class ProfessorLoginScreen extends StatelessWidget {
  const ProfessorLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Material(
        color: Colors.transparent,
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loginText(),
        const SizedBox(height: 130),
        _usuario(),
        _senha(),
        const SizedBox(height: 15),
        _loginButton(),
      ],
    );
  }

  Widget _loginText() {
    return Text(
      Messages.of('login.message'),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget _usuario() {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) {
        final cubit = context.read<InitCubit>();

        return Padding(
          padding: const EdgeInsets.only(right: 40, left: 40),
          child: Input(
            label: Messages.of('user'),
            hint: Messages.of('user'),
            preffixIcon: const Icon(Icons.person),
            value: state.userName,
            onChanged: (p0) {
              cubit.setUserName(p0);
            },
          ),
        );
      },
    );
  }

  Widget _senha() {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) {
        final cubit = context.read<InitCubit>();

        return Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Input(
            label: Messages.of('senha'),
            hint: Messages.of('senha'),
            preffixIcon: const Icon(Icons.remove_red_eye),
            value: state.userSenha,
            onChanged: (p0) {
              cubit.setUserSenha(p0);
            },
          ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) {
        return ButtonApp(
          text: Messages.of('login'),
          color: const Color.fromARGB(255, 155, 218, 84),
          onPressed: () {
            if (state.userName == 'master' && state.userSenha == '0') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InitScreen()));
            }
          },
        );
      },
    );
  }
}
