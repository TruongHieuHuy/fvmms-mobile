import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Ensure this import is present for DateFormat
import 'log_entry_model.dart';

class DetailLogBook extends StatefulWidget {
  final LogEntry? logEntry;
  const DetailLogBook({super.key, this.logEntry});

  @override
  State<DetailLogBook> createState() => _DetailLogBookState();
}

class _DetailLogBookState extends State<DetailLogBook> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  bool get isEditing => widget.logEntry != null;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      final entry = widget.logEntry!;
      selectedDate = entry.dateTime;
      selectedTime = TimeOfDay.fromDateTime(entry.dateTime);
      _latitudeController.text = entry.latitude.toString();
      _longitudeController.text = entry.longitude.toString();
      _speciesController.text = entry.species;
      _quantityController.text = entry.quantity.toString();
    } else {
      selectedDate = DateTime.now();
      selectedTime = TimeOfDay.now();
    }
    _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    _timeController.text =
        '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _longitudeController.dispose();
    _latitudeController.dispose();
    _speciesController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue[900]!,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.blue[900]),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue[900]!,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.blue[900]),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      final result = LogEntry(
        id:
            widget.logEntry?.id ??
            Random().nextDouble().toString(), // Simple unique id
        dateTime: newDateTime,
        latitude: double.parse(_latitudeController.text),
        longitude: double.parse(_longitudeController.text),
        species: _speciesController.text,
        quantity: double.parse(_quantityController.text),
      );

      Navigator.of(context).pop(result);
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isReadOnly = false,
    VoidCallback? onTap,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icon),
      ),
      readOnly: isReadOnly,
      onTap: onTap,
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Sửa nhật ký' : 'Thêm nhật ký'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _dateController,
                      label: 'Ngày',
                      hint: 'Chọn ngày',
                      icon: Icons.calendar_today,
                      isReadOnly: true,
                      onTap: () => _selectDate(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng chọn ngày';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _timeController,
                      label: 'Giờ',
                      hint: 'Chọn giờ',
                      icon: Icons.access_time,
                      isReadOnly: true,
                      onTap: () => _selectTime(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng chọn giờ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _latitudeController,
                      label: 'Vĩ độ',
                      hint: 'Nhập vĩ độ',
                      icon: Icons.location_on,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập vĩ độ';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _longitudeController,
                      label: 'Kinh độ',
                      hint: 'Nhập kinh độ',
                      icon: Icons.location_on,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập kinh độ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _speciesController,
                label: 'Tên thủy sản',
                hint: 'Nhập tên thủy sản',
                icon: Icons.phishing,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên thủy sản';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _quantityController,
                label: 'Số lượng (kg)',
                hint: 'Nhập số lượng',
                icon: Icons.line_weight,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số lượng';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _saveForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.save),
                label: const Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
