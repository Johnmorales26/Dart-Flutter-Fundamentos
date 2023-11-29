import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_app/screens/screens.dart';
import 'package:profile_app/shared_preferences/user_preferences.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar datos del usuario'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final TextEditingController nameController =
      TextEditingController(text: UserPreferences.name);
  final FocusNode nameFocusNode = FocusNode();
  final TextEditingController emailController =
      TextEditingController(text: UserPreferences.email);
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController webSiteController =
      TextEditingController(text: UserPreferences.webSite);
  final FocusNode webSiteFocusNode = FocusNode();
  final TextEditingController phoneController =
      TextEditingController(text: UserPreferences.phone);
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController latitudeController =
      TextEditingController(text: UserPreferences.latitude.toString());
  final FocusNode latitudeFocusNode = FocusNode();
  final TextEditingController longitudeController =
      TextEditingController(text: UserPreferences.longitude.toString());
  final FocusNode longitudeFocusNode = FocusNode();
  File? galleryFile;

  _collectData(BuildContext context) {
    if (nameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        webSiteController.text.isNotEmpty ||
        phoneController.text.isNotEmpty ||
        latitudeController.text.isNotEmpty ||
        longitudeController.text.isNotEmpty ||
        galleryFile != null) {
      UserPreferences.name = nameController.text;
      UserPreferences.email = emailController.text;
      UserPreferences.website = webSiteController.text;
      UserPreferences.phone = phoneController.text;
      UserPreferences.photoPath = galleryFile!.path;
      UserPreferences.latitude =
          double.tryParse(latitudeController.text) ?? 0.0;
      UserPreferences.longitude =
          double.tryParse(longitudeController.text) ?? 0.0;
      Fluttertoast.showToast(
        msg: "Guardando Datos...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        galleryFile = File(pickedFile.path);
      });
      print('Ruta de la imagen: ${pickedFile.path}');
    } else {
      print('No se seleccionó ninguna imagen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipOval(
                    child: galleryFile == null
                        ? Center(
                            child: Image.asset(
                      'assets/images/ic_user.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ))
                        : Center(
                            child: Image.file(
                            galleryFile!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ))),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.image_search_outlined),
                    onPressed: () => _pickImageFromGallery(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              focusNode: nameFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre Completo',
              ),
              onSubmitted: (value) {
                nameFocusNode.unfocus(); // Oculta el teclado virtual
                FocusScope.of(context).requestFocus(emailFocusNode);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo Electronico',
              ),
              onSubmitted: (value) {
                emailFocusNode.unfocus(); // Oculta el teclado virtual
                FocusScope.of(context).requestFocus(webSiteFocusNode);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: webSiteController,
              keyboardType: TextInputType.url,
              focusNode: webSiteFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sitio Web',
              ),
              onSubmitted: (value) {
                webSiteFocusNode.unfocus(); // Oculta el teclado virtual
                FocusScope.of(context).requestFocus(phoneFocusNode);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              focusNode: phoneFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefono',
              ),
              onSubmitted: (value) {
                phoneFocusNode.unfocus(); // Oculta el teclado virtual
                FocusScope.of(context).requestFocus(latitudeFocusNode);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: latitudeController,
              keyboardType: TextInputType.number,
              focusNode: latitudeFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Latitud',
              ),
              onSubmitted: (value) {
                latitudeFocusNode.unfocus(); // Oculta el teclado virtual
                FocusScope.of(context).requestFocus(longitudeFocusNode);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: longitudeController,
              keyboardType: TextInputType.number,
              focusNode: longitudeFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Longitud',
              ),
              onSubmitted: (value) {
                longitudeFocusNode.unfocus(); // Oculta el teclado virtual
              },
            ),
            const SizedBox(height: 12),
            FilledButton(
                onPressed: () {
                  _collectData(context);
                },
                child: const Text('Save Data'))
          ],
        ),
      ),
    );
  }
}
