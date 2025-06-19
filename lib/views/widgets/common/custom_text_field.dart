import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData? prefixIxon;
  final IconData? suffixIxon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool enabled;
  final FocusNode? focusNode;
  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.prefixIxon,
    this.suffixIxon,
    this.obscureText = false,
    this.controller,
    this.validate,
    this.keyboardType,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextField> {
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validate,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.prefixIxon != null ? Icon(widget.prefixIxon) : null,
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                )
                : widget.suffixIxon != null
                ? Icon(widget.suffixIxon)
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
