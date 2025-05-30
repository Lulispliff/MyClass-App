class InitState {
  bool? isProfessor;
  bool? isAluno;
  String? userName;
  String? userSenha;

  InitState({
    this.isProfessor = false,
    this.isAluno = false,
    this.userName = '',
    this.userSenha = '',
  });

  InitState copyWith({
    bool? isProfessor,
    bool? isAluno,
    String? userName,
    String? userSenha,
  }) {
    return InitState(
      isProfessor: isProfessor ?? this.isProfessor,
      isAluno: isAluno ?? this.isAluno,
      userName: userName ?? this.userName,
      userSenha: userSenha ?? this.userSenha,
    );
  }
}
