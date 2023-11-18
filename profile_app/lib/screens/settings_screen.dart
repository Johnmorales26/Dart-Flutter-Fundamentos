import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
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
  bool isEnableClic = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(children: [
            ListTile(
              title: const Text('Habilitar Clics'),
              trailing: Switch(
                  value: isEnableClic,
                  onChanged: (value) {
                    setState(() {
                      isEnableClic = value;
                    });
                  }),
            ),
            const Divider(),
            ListTile(
              title: const Text('Tamaño de la imagen'),
              trailing: IconButton(onPressed: () {
                _showMenu(context);
              }, icon: const Icon(Icons.arrow_drop_down)),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Eliminar datos del usuario'),
                trailing: Text(''),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Restaurar configuraciones'),
                trailing: Text(''),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Restaurar datos y configuraciones'),
                trailing: Text(''),
              ),
            ),
          ]),
        ));
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
          child: Text('Chica'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Mediana'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Grande'),
        ),
      ],
    ).then((value) {
      // Manejar la opción seleccionada
      if (value == 1) {
      } else if (value == 2) {}
    });
  }
}
