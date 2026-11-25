import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.projectImageUrl.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.projectImageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 120,
                    child: Center(child: Icon(Icons.broken_image, size: 48)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(project.title, style: textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('Tech Stack', style: textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(project.techStack),
            const SizedBox(height: 16),
            Text('Description', style: textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(project.description),
            const SizedBox(height: 16),
            Text('Project URL', style: textTheme.titleMedium),
            const SizedBox(height: 4),
            SelectableText(project.projectUrl),
          ],
        ),
      ),
    );
  }
}