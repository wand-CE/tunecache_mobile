class Validators {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "O email não pode estar vazio";
    }
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return "Insira um email válido";
    }
    return null;
  }

  static String? validateUserName(String name) {
    if (name.isEmpty) {
      return "Nome não pode estar vázio!";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "A senha não pode estar vazia";
    }
    if (password.length < 8) {
      return "A senha deve ter pelo menos 8 caracteres";
    }
    return null;
  }

  static String? validatePasswordConfirmation(
      String password, String passwordConfirm) {
    if (password != passwordConfirm) {
      return "As senhas não coincidem";
    }
    return null;
  }
}
