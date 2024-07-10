import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formulario = GlobalKey<FormState>();
  String _nombre = "";
  String _correo = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.amber[100]!, Colors.blue[100]!])),
      padding: const EdgeInsets.all(20),
      child: Form(
          key: _formulario,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.person, color: Colors.grey),
                        hintText: "Nombre",
                        border: InputBorder.none),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      return null; // todo salio bien
                    },
                    onSaved: (value) => _nombre = value!,
                  )),
              SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.email, color: Colors.grey),
                        hintText: "Correo",
                        border: InputBorder.none),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingresa tu email";
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Ingresa un email válido';
                      }
                      return null; // todo salio bien
                    },
                    onSaved: (value) => _correo = value!,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.key, color: Colors.grey),
                        hintText: "Contraseña",
                        border: InputBorder.none),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una contraseña';
                      }
                      if (value!.length < 6) {
                        return "La contraseña debe tener como mínimo 6 caracteres";
                      }
                      return null; // todo salio bien
                    },
                    onSaved: (value)=> _password =value!,
                  )),
              Expanded(child: Container()),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formulario.currentState!.validate()) {
                        _formulario.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Procesando datos"))
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Ha ocurrido un error al procesar los datos"))
                        );
                      }
                    },
                    child: Text("Enviar", style: TextStyle(fontSize: 18, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )

                    ),
                  ))
            ],
          )),
    );
  }
}
