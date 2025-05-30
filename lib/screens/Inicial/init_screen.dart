import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_class_app/common/localization/messages.dart';
import 'package:my_class_app/cubit/init_cubit.dart';
import 'package:my_class_app/cubit/init_state.dart';
import 'package:my_class_app/screens/aluno/main_aluno_screen.dart';
import 'package:my_class_app/screens/professor/professor_login_screen.dart';
import 'package:my_class_app/widgets/button.dart';
import 'package:my_class_app/widgets/main_container.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _headerText(),
        const SizedBox(height: 80),
        _professorCard(context),
        _alunoCard(context),
        const SizedBox(height: 20),
        _avancarButton(context)
      ],
    );
  }

  Widget _headerText() {
    return Column(
      children: [
        Text(
          Messages.of('welcome'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          Messages.of('select.user'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _professorCard(BuildContext context) {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) {
        final cubit = context.read<InitCubit>();

        return Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              cubit.setProfessor(true);
              cubit.setAluno(false);
            },
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _professor(),
                        Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.grey[400],
                          checkColor: Colors.transparent,
                          value: state.isProfessor,
                          onChanged: (value) {
                            cubit.setProfessor(value!);
                            cubit.setAluno(false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _alunoCard(BuildContext context) {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) {
        final cubit = context.read<InitCubit>();

        return Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              cubit.setAluno(true);
              cubit.setProfessor(false);
            },
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _aluno(),
                        Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.grey[400],
                          checkColor: Colors.transparent,
                          value: state.isAluno,
                          onChanged: (value) {
                            cubit.setAluno(value!);
                            cubit.setProfessor(false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _avancarButton(BuildContext context) {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) {
        return Visibility(
          visible: _showButton(context),
          child: ButtonApp(
            text: Messages.of('avancar'),
            color: const Color.fromARGB(255, 155, 218, 84),
            onPressed: () {
              if (state.isProfessor == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfessorLoginScreen(),
                  ),
                );
              } else if (state.isAluno == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlunoLoginScreen(),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _professor() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('lib/assets/teacher.png'),
        ),
        const SizedBox(width: 20),
        Text(
          Messages.of('prof'),
          style: const TextStyle(fontSize: 19),
        ),
      ],
    );
  }

  Widget _aluno() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('lib/assets/student.png'),
        ),
        const SizedBox(width: 20),
        Text(
          Messages.of('aluno'),
          style: const TextStyle(fontSize: 19),
        )
      ],
    );
  }

  bool _showButton(BuildContext context) {
    final cubit = context.read<InitCubit>();
    if (cubit.state.isAluno == true || cubit.state.isProfessor == true) {
      return true;
    }
    return false;
  }
}
