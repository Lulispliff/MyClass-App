import 'package:flutter/material.dart';

class Messages {
  Messages();
  static Locale? locale;

  static init(Locale locale) {
    Messages.locale = locale;
  }

  static String of(String key) {
    if (locale == null) {
      Messages.init(const Locale('pt'));
    }
    return _localizedValues[locale!.languageCode]?[key] ?? '';
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'pt': {
      //TELA INICIAL:
      'welcome': 'Olá, Seja Bem - Vindo(a)!',
      'select.user': 'Selecione o seu tipo de usuário:',
      'prof': 'Professor(a)',
      'aluno': 'Aluno',
      'user': 'Usuário',
      'senha': 'Senha',
      //TELA DE LOGIN:
      'login.message':
          'Preencha as informações de login para acessar sua conta de professor',
      //AÇÕES:
      'avancar': 'Avançar',
      'login': 'Login',
    },
  };
}
