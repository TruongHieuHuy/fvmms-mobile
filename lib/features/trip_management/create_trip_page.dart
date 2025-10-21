import 'package:flutter/material.dart';

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final _formKey = GlobalKey<FormState>();
  final _tripNameController = TextEditingController();
  final _shipNameController = TextEditingController();
  final _captainNameController = TextEditingController();
  final _departureDateController = TextEditingController();
  final _returnDateController = TextEditingController(); // Added controller
  final _departurePortController = TextEditingController();
  final _crewCountController = TextEditingController();

  @override
  void dispose() {
    _tripNameController.dispose();
    _shipNameController.dispose();
    _captainNameController.dispose();
    _departureDateController.dispose();
    _returnDateController.dispose(); // Dispose controller
    _departurePortController.dispose();
    _crewCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo chuyến đi mới'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField(controller: _tripNameController, labelText: 'Tên chuyến đi', icon: Icons.card_travel),
              const SizedBox(height: 16),
              _buildTextFormField(controller: _shipNameController, labelText: 'Tên tàu', icon: Icons.directions_boat),
              const SizedBox(height: 16),
              _buildTextFormField(controller: _captainNameController, labelText: 'Thuyền trưởng', icon: Icons.person),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _departureDateController,
                labelText: 'Ngày khởi hành',
                icon: Icons.calendar_today,
                onTap: () => _selectDate(context, _departureDateController),
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _returnDateController,
                labelText: 'Ngày về (dự kiến)',
                icon: Icons.calendar_today,
                onTap: () => _selectDate(context, _returnDateController),
                isOptional: true, // Make this field optional
              ),
              const SizedBox(height: 16),
              _buildTextFormField(controller: _departurePortController, labelText: 'Cảng đi', icon: Icons.location_on),
              const SizedBox(height: 16),
              _buildTextFormField(controller: _crewCountController, labelText: 'Số thuyền viên', icon: Icons.group, keyboardType: TextInputType.number),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // In a real app, you would create a new Trip object and save it.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tạo chuyến đi thành công')),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Tạo chuyến đi', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Widget _buildTextFormField({required TextEditingController controller, required String labelText, required IconData icon, TextInputType? keyboardType, VoidCallback? onTap, bool isOptional = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.blue[900]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue[900]!),
        ),
      ),
      keyboardType: keyboardType,
      onTap: onTap,
      validator: (value) {
        if (!isOptional && (value == null || value.isEmpty)) {
          return 'Vui lòng nhập $labelText';
        }
        return null;
      },
    );
  }
}
