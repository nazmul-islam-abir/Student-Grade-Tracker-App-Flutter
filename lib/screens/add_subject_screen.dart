import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final mark = double.parse(_markController.text);

      context.read<SubjectProvider>().addSubject(name, mark);

      _nameController.clear();
      _markController.clear();
      _formKey.currentState!.reset();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Subject "$name" added successfully!'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Subject')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter Subject Details',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Subject Name',
                  hintText: 'e.g., Mathematics',
                  prefixIcon: Icon(Icons.book),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a subject name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _markController,
                decoration: const InputDecoration(
                  labelText: 'Mark',
                  hintText: '0 - 100',
                  prefixIcon: Icon(Icons.grade),
                  suffixText: '%',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a mark';
                  }
                  final mark = double.tryParse(value);
                  if (mark == null) {
                    return 'Please enter a valid number';
                  }
                  if (mark < 0 || mark > 100) {
                    return 'Mark must be between 0 and 100';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Subject'),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grading Scale:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    _buildGradeChip('A', '≥ 80%', Colors.green),
                    _buildGradeChip('B', '65% - 79%', Colors.blue),
                    _buildGradeChip('C', '50% - 64%', Colors.orange),
                    _buildGradeChip('F', '< 50%', Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradeChip(String grade, String range, Color color) {
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
          Text(range, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
