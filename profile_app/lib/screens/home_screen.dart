import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_app/shared_preferences/user_preferences.dart';
import 'package:profile_app/utils/constants.dart';
import 'package:profile_app/widgets/item_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _showMenu(context);
          },
        ),
      ),
      body: _Content(),
    );
  }

  void _showMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset.zero,
          overlay.localToGlobal(overlay.size.bottomCenter(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text('Editar datos del usuario'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Configuración'),
        ),
      ],
    ).then((value) {
      // Manejar la opción seleccionada
      if (value == 1) {
        Navigator.pushNamed(context, EDIT_SCREEN);
      } else if (value == 2) {
        Navigator.pushNamed(context, SETTINGS_SCREEN);
      }
    });
  }
}

class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final String nameState = UserPreferences.name;
  final String emailState = UserPreferences.email;
  final String websiteState = UserPreferences.webSite;
  final String phoneState = UserPreferences.phone;
  final double latitudeState = UserPreferences.latitude;
  final double longitudeState = UserPreferences.longitude;
  final File galleryFile = File(UserPreferences.photoPath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
              child: UserPreferences.photoPath.isEmpty
                  ? Center(
                      child: Image.asset(
                      'assets/images/ic_user.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ))
                  : Center(
                      child: Image.file(
                      galleryFile,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ))),
          ItemData(category: 'Nombre', value: nameState),
          InkWell(
            onTap: () => _openEmailApp(emailState),
            child: ItemData(category: 'Correo Electronico', value: emailState),
          ),
          InkWell(
              onTap: () => _openWebBrowser(websiteState),
              child: ItemData(category: 'Sitio Web', value: websiteState)),
          InkWell(
              onTap: () => _openPhoneCall(phoneState),
              child: ItemData(category: 'Telefono', value: phoneState)),
          InkWell(
            onTap: () => _openGoogleMaps(latitudeState, longitudeState),
            child: ItemData(
                category: 'Ubicación',
                value: '$latitudeState, $longitudeState'),
          ),
        ],
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _openEmailApp(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
    launchUrl(emailLaunchUri);
  }

  void _openWebBrowser(webUrl) async {
    Uri url = Uri.parse('url:$webUrl');
    launchUrl(url);
  }

  void _openPhoneCall(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');
    if (phoneNumber.isNotEmpty) {
      launchUrl(url);
    } else {
      throw 'No se pudo realizar la llamada a $phoneNumber';
    }
  }

  void _openGoogleMaps(double lat, double lng) {
    Uri url = Uri.parse('geo:$lat,$lng?q=$lat,$lng');
    launchUrl(url);
  }
}
