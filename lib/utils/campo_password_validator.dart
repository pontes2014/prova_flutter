class CampoPasswordValidator {
  static String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');

    if (value == null || value.isEmpty) {
      return 'Senha obrigatória';
    } else if (value.length > 20 || value.length > 20) {
      return 'Os campos não podem ultrapassar 20 caracteres.';
    } else if (value.length < 2) {
      return 'A senha não pode ter menos de dois caracteres.';
    } else if (value.trim() != value || value.trim() != value) {
      return 'Os campos não podem conter espaços em branco.';
    } else if (!regex.hasMatch(value)) {
      return 'A senha não pode ter caracteres especiais';
    }

    return null;
  }
}
