import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp/common/widgets/custom_icon_button.dart';
import 'package:whatsapp/common/widgets/custom_text_field.dart';

class VerficationPage extends ConsumerWidget {
  final String smsCodeId;
  final String phoneNumber;

  const VerficationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  void verifySmsCode(
    BuildContext context,
    WidgetRef ref,
    String smsCode,
  ) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "Verify your number",
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "You've tried to register + 811067930907. before requesting an SMS with your code. ",
                    ),
                    TextSpan(
                      text: "Wrong number?",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                hintText: "- - -  - - -",
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    return verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Enter 6-digit code",
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Resend SMS",
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
