import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Consumer<SubjectProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Performance Summary',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  _buildSummaryCard(
                    context,
                    'Total Subjects',
                    provider.totalSubjects.toString(),
                    Icons.book,
                    Colors.blue,
                  ),
                  const SizedBox(height: 16),
                  _buildSummaryCard(
                    context,
                    'Average Mark',
                    provider.averageMark.toStringAsFixed(1) + '%',
                    Icons.trending_up,
                    Colors.orange,
                  ),
                  const SizedBox(height: 16),
                  _buildSummaryCard(
                    context,
                    'Overall Grade',
                    provider.overallGrade,
                    Icons.star,
                    _getGradeColor(provider.overallGrade),
                  ),
                  const SizedBox(height: 16),
                  _buildSummaryCard(
                    context,
                    'Passing Subjects',
                    '${provider.passingCount} / ${provider.totalSubjects}',
                    Icons.check_circle,
                    Colors.green,
                  ),
                  const SizedBox(height: 24),
                  if (provider.subjects.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grade Distribution',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12),
                          _buildGradeBar(
                            context,
                            'A',
                            Colors.green,
                            provider.subjects
                                .where((s) => s.grade == 'A')
                                .toList(),
                          ),
                          _buildGradeBar(
                            context,
                            'B',
                            Colors.blue,
                            provider.subjects
                                .where((s) => s.grade == 'B')
                                .toList(),
                          ),
                          _buildGradeBar(
                            context,
                            'C',
                            Colors.orange,
                            provider.subjects
                                .where((s) => s.grade == 'C')
                                .toList(),
                          ),
                          _buildGradeBar(
                            context,
                            'F',
                            Colors.red,
                            provider.subjects
                                .where((s) => s.grade == 'F')
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 28,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeBar(
    BuildContext context,
    String grade,
    Color color,
    List subjects,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                grade,
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '${subjects.length} subject${subjects.length != 1 ? 's' : ''}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (subjects.isNotEmpty)
            Text(
              subjects.map((s) => s.name).join(', '),
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.blue;
      case 'C':
        return Colors.orange;
      case 'F':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
