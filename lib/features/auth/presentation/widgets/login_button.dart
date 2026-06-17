import 'package:flutter/material.dart';
import 'package:flutter_project_template/app/l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onTap;

  const LoginButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return ElevatedButton(
      onPressed: onTap,
      child: Text(l10n.login),
    );
  }
}