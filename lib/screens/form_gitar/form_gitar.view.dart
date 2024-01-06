import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/components/button.component.dart';
import 'package:tugas_crud/common/components/input.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/common/utils/validation.util.dart';
import 'package:tugas_crud/screens/form_gitar/form_gitar.vm.dart';

class FormGitarView extends StatelessWidget {
  final bool isEdit;
  final String id;

  const FormGitarView({super.key, this.isEdit = false, this.id = ''});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormGitarVM>.reactive(
      viewModelBuilder: () => FormGitarVM(),
      onViewModelReady: (model) {
        if (isEdit) {
          model.getGitar(id);
        }
      },
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              isEdit ? 'Edit Data' : 'Tambah Data',
              style: UTextStyles.h5,
            ),
            backgroundColor: Colors.transparent, // Set AppBar background color to transparent
            elevation: 0, // Remove shadow
            iconTheme: const IconThemeData(
              color: Colors.black,
            ), // Set icon color to black
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Merek",
                    textController: vm.merek,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Model",
                    textController: vm.model,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Warna",
                    textController: vm.warna,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Tahun",
                    textController: vm.tahun,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Dibuat Di",
                    textController: vm.dibuatDi,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Material",
                    textController: vm.material,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Harga",
                    textController: vm.harga,
                    inputFormatters: [NumberInputFormatter()],
                    keyboardType: UValidation.typeNumber(),
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  CTextFieldWithLabel(
                    validationLength: 0,
                    label: "Gambar",
                    textController: vm.gambar,
                    textAlign: TextAlign.left,
                    isValidation: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validationType: ValidationType.normalType,
                  ),
                  const SizedBox(height: 20),
                  CButton(
                    text: isEdit ? 'Edit Data' : 'Tambah Data',
                    onPressed: () {
                      isEdit ? vm.editGitar(id) : vm.addGitar();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Use a regular expression to only allow numeric input
    final RegExp regex = RegExp(r'^[0-9]*$');
    String newText = '';

    for (int i = 0; i < newValue.text.length; i++) {
      if (regex.hasMatch(newValue.text[i])) {
        newText += newValue.text[i];
      }
    }

    return newValue.copyWith(text: newText);
  }
}
