import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
        itemBuilder: (context, index) => EntryItem(data[index]),

    );
  }



}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, this.index, [this.children = const <Entry>[]]);

  final bool index;
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Serviços',
    true,
    <Entry>[
      Entry(
          'Relatorios',
          false,
          <Entry>[
            Entry('Serviço mais solicitado', false),
          ]
      ),
      Entry('Listar todos', false),
      Entry('Cadastrar serviço', false),
    ],
  ),
  Entry(
    'Clientes',
    true,
    <Entry>[
      Entry(
          'Relatorios',
          false,
          <Entry>[
            Entry('Melhor cliente', false),
            Entry('Pagamentos pendentes', false),
          ]
      ),
      Entry('Listar todos', false),
      Entry('Cadastrar cliente', false),
    ],
  ),
  Entry(
    'Ajudantes',
    true,
    <Entry>[
      Entry(
          'Relatorios',
          false,
          <Entry>[
            Entry('Ajudante do mes', false),
          ]
      ),
      Entry('Listar todos', false),
      Entry('Cadastrar ajudante', false),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      initiallyExpanded: root.index,
      trailing: null,
      backgroundColor: _backgroundSecondary(root),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  Color _backgroundSecondary(Entry root) {
    if (root.index) {
      return Colors.white;
    } else {
      return Colors.blueGrey[50];
    }
  }


  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}