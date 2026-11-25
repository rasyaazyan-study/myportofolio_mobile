import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ProjectFormScreen extends StatefulWidget {
  const ProjectFormScreen({super.key});

  @override
  State<ProjectFormScreen> createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _techStack = '';
  String _projectUrl = '';
  String _projectImageUrl = '';
  bool _isSubmitting = false;

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null &&
        uri.hasAuthority &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loggedIn = await ensureLoggedIn(context);
    if (!mounted || !loggedIn) return;

    final authState = context.read<AuthState>();
    final apiClient = context.read<ApiClient>();
    final messenger = ScaffoldMessenger.of(context);
    final token = authState.token;
    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    final newProject = Project(
      title: _title.trim(),
      description: _description.trim(),
      techStack: _techStack.trim(),
      projectUrl: _projectUrl.trim(),
      projectImageUrl: _projectImageUrl.trim(),
    );

    try {
      final created = await apiClient.createProject(newProject, token: token);
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Project saved'),
          content: Text('"${created.title}" was created successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } on ApiException catch (e) {
      if (e.statusCode == 401) {
        await authState.logout();
        if (!mounted) return;
        messenger.showSnackBar(
          const SnackBar(content: Text('Session expired. Please log in again.')),
        );
        await ensureLoggedIn(context);
      } else {
        messenger.showSnackBar(
          SnackBar(content: Text('Failed to save project (${e.statusCode}).')),
        );
      }
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Cannot reach the server.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  InputDecoration _decoration(String label) => InputDecoration(
    labelText: label,
    hintText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Achievement')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: _decoration('Title'),
                onChanged: (v) => _title = v,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Title cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: _decoration('Description'),
                maxLines: 4,
                onChanged: (v) => _description = v,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Description cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: _decoration('Tech Stack'),
                onChanged: (v) => _techStack = v,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Tech Stack cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: _decoration('Project URL'),
                keyboardType: TextInputType.url,
                onChanged: (v) => _projectUrl = v,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Project URL cannot be empty!';
                  }
                  if (!_isValidUrl(v.trim())) {
                    return 'Enter a valid URL (http:// or https://)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: _decoration('Project Image URL (Optional)'),
                keyboardType: TextInputType.url,
                onChanged: (v) => _projectImageUrl = v,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return null;
                  return _isValidUrl(v.trim())
                      ? null
                      : 'Enter a valid URL (http:// or https://)';
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}