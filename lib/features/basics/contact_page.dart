import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/features/common/ui/widgets/glitch_effect.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/features/common/ui/widgets/input_field.dart';
import 'package:portfolio/features/common/ui/widgets/corner_cut_style_button.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/gen/fonts.gen.dart';

@RoutePage()
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields_")),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // Replace 'YOUR_FORMSPREE_ID' with your actual Formspree ID
      final response = await http.post(
        Uri.parse('https://formspree.io/f/xlgwdwpv'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'message': _messageController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent successfully!")),
        );
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        throw Exception("Failed to send message_");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      showClock: true,
      showMadeWithText: true,
      showSocial: true,
      menuItem: "Contact",
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal:
                  context.responsiveSize(desktop: 100, tablet: 50, mobile: 20),
              vertical:
                  context.responsiveSize(desktop: 150, tablet: 100, mobile: 80),
            ),
            child: context.isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactDetails(context),
                      const Gap(50),
                      _buildContactForm(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildContactDetails(context)),
                      const Gap(100),
                      Expanded(flex: 1, child: _buildContactForm(context)),
                    ],
                  ),
          ),
        )
      ],
    );
  }

  Widget _buildContactDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlitchEffect(
          child: Text(
            "GET IN TOUCH_",
            style: titleOneTextStyle(context).copyWith(
              fontFamily: FontFamily.iBMPlexMono,
              fontSize:
                  context.responsiveSize(desktop: 64, tablet: 48, mobile: 32),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const Gap(30),
        Text(
          "Have a project in mind or just want to say hi? My inbox is always open.",
          style: paragraphTextStyle(context).copyWith(
            fontSize: context.responsiveSize(desktop: 20, mobile: 16),
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
          ),
        ),
        const Gap(50),
        _buildInfoItem(
            context, "EMAIL", "sheikhanikbd@gmail.com", Icons.email_outlined),
        const Gap(30),
        _buildInfoItem(
            context, "PHONE", "+880 1766 785027", Icons.phone_android_outlined),
        const Gap(30),
        _buildInfoItem(context, "LOCATION", "Dhaka, Bangladesh",
            Icons.location_on_outlined),
      ],
    );
  }

  Widget _buildInfoItem(
      BuildContext context, String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24),
        const Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: subtitleTextStyle(context).copyWith(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                letterSpacing: 2,
                fontSize: 10,
              ),
            ),
            Text(
              value,
              style: subtitleTextStyle(context).copyWith(
                fontFamily: FontFamily.iBMPlexMono,
                fontSize: context.responsiveSize(desktop: 18, mobile: 14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputField(
          hint: "NAME_",
          padding: EdgeInsets.zero,
          controller: _nameController,
        ),
        const Gap(30),
        InputField(
          hint: "EMAIL_",
          padding: EdgeInsets.zero,
          controller: _emailController,
        ),
        const Gap(30),
        InputField(
          hint: "MESSAGE_",
          padding: EdgeInsets.zero,
          controller: _messageController,
        ),
        const Gap(50),
        CornerCutButton(
          text: _isSubmitting ? "SENDING..." : "SEND MESSAGE",
          onTap: _isSubmitting ? null : _submitForm,
        ),
      ],
    );
  }
}
