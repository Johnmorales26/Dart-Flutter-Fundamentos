String capitalize(String input) {
  if (input.isEmpty) {
    return input; // Devuelve la cadena original si está vacía
  }
  return input[0].toUpperCase() + input.substring(1);
}

String formatNumberWithHash(int number) {
  // Asegurarse de que el número esté entre 0 y 999 para evitar problemas de formato.
  int formattedNumber = number.clamp(0, 999);

  // Formatear el número con ceros a la izquierda y agregar el carácter '#'.
  return '#${formattedNumber.toString().padLeft(3, '0')}';
}
