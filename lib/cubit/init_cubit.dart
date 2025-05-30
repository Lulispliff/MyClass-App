import 'package:bloc/bloc.dart';
import 'package:my_class_app/cubit/init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(InitState());

  void setProfessor(bool value) {
    emit(state.copyWith(isProfessor: value));
  }

  void setAluno(bool value) {
    emit(state.copyWith(isAluno: value));
  }

  void setUserName(String userName) {
    emit(state.copyWith(userName: userName));
  }

  void setUserSenha(String userSenha) {
    emit(state.copyWith(userSenha: userSenha));
  }
}
