import 'package:app_movil3/widgets/formulario.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de usuarios"),
      ),
      body: const Formulario(),
    );
  }
}
