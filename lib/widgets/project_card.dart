import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form_screen.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  Future<void> _handleTap(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final auth = context.read<AuthState>();

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
      );

    if (item.name == "Lihat Proyek") {
      navigator.push(
        MaterialPageRoute(builder: (context) => const ProjectListScreen()),
      );
    } else if (item.name == "Tambah Proyek") {
      if (!await ensureLoggedIn(context)) return;
      navigator.push(
        MaterialPageRoute(builder: (context) => const ProjectFormScreen()),
      );
    } else if (item.name == "Tambah Pengalaman") {
      navigator.push(
        MaterialPageRoute(builder: (context) => const ExperienceFormPage()),
      );
    } else if (item.name == "Logout") {
      if (auth.isLoggedIn) {
        await auth.logout();
        messenger.showSnackBar(
          const SnackBar(content: Text("You have been logged out.")),
        );
      } else {
        messenger.showSnackBar(
          const SnackBar(content: Text("You are not logged in.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => _handleTap(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}