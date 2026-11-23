import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _institution = "";
  String _position = "";
  String _type = "Organisasi";
  DateTime? _startDate;
  DateTime? _endDate;
  String _description = "";
  String _certificateLink = "";

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  final List<String> _types = [
    'Magang',
    'Organisasi',
    'Kepanitiaan',
    'Lainnya',
  ];

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-${d.year}';

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: (isStart ? _startDate : _endDate) ?? now,
      firstDate: DateTime(1990),
      lastDate: DateTime(now.year + 10),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
        _startDateController.text = _formatDate(picked);
      } else {
        _endDate = picked;
        _endDateController.text = _formatDate(picked);
      }
    });
  }

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.contains('.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Experience Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Institution ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Institusi",
                    labelText: "Nama Institusi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Nama institusi minimal 3 karakter!";
                    }
                    if (value.trim().length > 100) {
                      return "Nama institusi maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Position ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Posisi / Peran",
                    labelText: "Posisi / Peran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _position = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Posisi tidak boleh kosong!";
                    }
                    if (value.trim().length > 100) {
                      return "Posisi maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Type ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenis Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _type,
                  items: _types
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _type = newValue!;
                    });
                  },
                ),
              ),

              // === Start Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startDateController,
                  readOnly: true,
                  onTap: () => _pickDate(isStart: true),
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal mulai",
                    labelText: "Tanggal Mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (_startDate == null) {
                      return "Tanggal mulai wajib dipilih!";
                    }
                    if (_startDate!.isAfter(DateTime.now())) {
                      return "Tanggal mulai tidak boleh di masa depan!";
                    }
                    return null;
                  },
                ),
              ),

              // === End Date (opsional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endDateController,
                  readOnly: true,
                  onTap: () => _pickDate(isStart: false),
                  decoration: InputDecoration(
                    hintText: "Kosongkan jika masih berlangsung (Sekarang)",
                    labelText: "Tanggal Selesai (opsional)",
                    suffixIcon: _endDate == null
                        ? const Icon(Icons.calendar_today)
                        : IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _endDate = null;
                                _endDateController.clear();
                              });
                            },
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (_endDate == null) return null;
                    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
                      return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Pengalaman",
                    labelText: "Deskripsi Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal 10 karakter!";
                    }
                    if (value.trim().length > 500) {
                      return "Deskripsi maksimal 500 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Certificate Link ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "URL Sertifikat (opsional)",
                    labelText: "Tautan Sertifikat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _certificateLink = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }
                    if (!_isValidUrl(value.trim())) {
                      return "Format URL tidak valid (awali dengan http:// atau https://)";
                    }
                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pengalaman berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institusi: ${_institution.trim()}'),
                                    Text('Posisi: ${_position.trim()}'),
                                    Text('Jenis: $_type'),
                                    Text(
                                      'Periode: ${_formatDate(_startDate!)} - '
                                      '${_endDate == null ? 'Sekarang' : _formatDate(_endDate!)}',
                                    ),
                                    Text('Deskripsi: ${_description.trim()}'),
                                    Text(
                                      'Sertifikat: ${_certificateLink.trim().isEmpty ? '-' : _certificateLink.trim()}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _institution = "";
                                      _position = "";
                                      _type = "Organisasi";
                                      _startDate = null;
                                      _endDate = null;
                                      _description = "";
                                      _certificateLink = "";
                                      _startDateController.clear();
                                      _endDateController.clear();
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}