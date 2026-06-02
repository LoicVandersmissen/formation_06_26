import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoForm extends StatefulWidget {
  const DemoForm({super.key});

  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = "Coucou";
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormData(),
      lazy: false,
      child: Builder(
        builder: (context) {
          return ListenerAMoi<FormData>(
            onChanged: () {
              _nameController.text = context.read<FormData>().name;
              _emailController.text = context.read<FormData>().email;
            },
            child: Scaffold(
              body: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    onChanged: (value) {
                      context.read<FormData>().updateName(value);
                    },
                    decoration: const InputDecoration(labelText: 'Nom'),
                  ),
                  TextField(
                    controller: _emailController,
                    onChanged: (value) {
                      context.read<FormData>().updateEmail(value);
                    },
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  Consumer<FormData>(
                    builder: (_, FormData changeNotifier, _) {
                      return FilledButton(
                        onPressed: changeNotifier.valid ? () {} : null,
                        child: const Text('Envoyer'),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListenerAMoi<T extends ChangeNotifier> extends StatefulWidget {
  const ListenerAMoi({super.key, required this.onChanged, required this.child});

  final VoidCallback onChanged;
  final Widget child;

  @override
  State<ListenerAMoi> createState() => _ListenerAMoiState<T>();
}

class _ListenerAMoiState<T extends ChangeNotifier> extends State<ListenerAMoi> {
  T? _notifier;

  @override
  void didUpdateWidget(covariant ListenerAMoi oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('ListenerAMoi didUpdateWidget');

    _notifier = context.read<T>();
    _notifier!.addListener(onChanged);
  }

  void onChanged() {
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _notifier?.removeListener(onChanged);
    super.dispose();
  }
}

class FormData extends ChangeNotifier {
  String _name = '';
  String _email = '';

  FormData() {
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    _name = 'John Doe';
    _email = 'toto@tata.fr';
    notifyListeners();
  }

  String get name => _name;

  String get email => _email;

  bool get valid => _name.isNotEmpty && _email.isNotEmpty;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}
