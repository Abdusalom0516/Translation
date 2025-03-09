import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:translation/core/common/widgets/sizedbox.dart';
import 'package:translation/core/utils/app_responsive.dart';
import 'package:translation/core/utils/app_state_wrapper.dart';
import 'package:translation/core/utils/clipboard.dart';
import 'package:translation/providers/translation_words_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (ref, colors) => Scaffold(
        appBar: AppBar(
          title: Row(
            spacing: appW(11),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Language Translator"),
              Icon(
                Icons.translate_rounded,
                size: appW(27),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    h(25),
                    Card(
                      elevation: appW(3.9),
                      shadowColor: colors.blue.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appW(48)),
                      ),
                      child: Container(
                        height: appH(51),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: appW(15)),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(appW(48)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: appW(9),
                              children: [
                                CountryFlag.fromCountryCode(
                                  "US",
                                  height: appH(27),
                                  width: appW(27),
                                  shape: Circle(),
                                ),
                                Text(
                                  "English",
                                  style: TextStyle(
                                    color: colors.blue,
                                    fontSize: appW(17),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              color: colors.blue,
                              icon: Icon(
                                Icons.swap_horiz_rounded,
                                size: appW(25),
                              ),
                            ),
                            Row(
                              spacing: appW(9),
                              children: [
                                Text(
                                  "Uzbek",
                                  style: TextStyle(
                                    color: colors.blue,
                                    fontSize: appW(17),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                CountryFlag.fromCountryCode(
                                  "UZ",
                                  height: appH(27),
                                  width: appW(27),
                                  shape: Circle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    h(21),
                    Card(
                      elevation: appW(3.9),
                      shadowColor: colors.blue.withValues(alpha: 0.3),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(appW(48)),
                      // ),
                      child: Container(
                        height: appH(216),
                        width: double.infinity,
                        padding: EdgeInsets.all(appW(16)),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(appW(12)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: appW(11),
                                  children: [
                                    Text(
                                      "English",
                                      style: TextStyle(
                                        color: colors.blue,
                                        fontSize: appW(17),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.volume_up_rounded,
                                        color: colors.blue,
                                        size: appW(24),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    controller.clear();
                                    ref
                                        .read(translationWordsProvider.notifier)
                                        .clean();
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: colors.blue,
                                    size: appW(24),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TextField(
                                controller: controller,
                                maxLines: 3,
                                cursorColor: colors.blue,
                                style: TextStyle(
                                  color: colors.blue.withValues(alpha: 0.6),
                                  fontSize: appW(15),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  decorationColor: Colors.transparent,
                                  decorationThickness: 0,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter text here...",
                                  hintStyle: TextStyle(
                                    color: colors.blue.withValues(alpha: 0.6),
                                    fontSize: appW(15),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(colors.blue),
                                  ),
                                  onPressed: () async {
                                    // ignore: use_build_context_synchronously
                                    FocusScope.of(context).unfocus();
                                    await ref
                                        .read(translationWordsProvider.notifier)
                                        .translate(
                                          "en",
                                          "uz",
                                          controller.text.trim(),
                                        );
                                  },
                                  child: Text(
                                    "Translate",
                                    style: TextStyle(
                                      color: colors.bg,
                                      fontSize: appW(17),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: h(25),
            ),
            ref.watch(translationWordsProvider) != null
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(20),
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Card(
                        elevation: appW(3.9),
                        shadowColor: colors.blue.withValues(alpha: 0.3),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(appW(16)),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(appW(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: appW(11),
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Uzbek",
                                    style: TextStyle(
                                      color: colors.blue,
                                      fontSize: appW(17),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.volume_up_rounded,
                                      color: colors.blue,
                                      size: appW(24),
                                    ),
                                  ),
                                ],
                              ),
                              h(3),
                              Text(
                                textAlign: TextAlign.start,
                                ref.watch(translationWordsProvider)!,
                                style: TextStyle(
                                  color: colors.blue.withValues(alpha: 0.6),
                                  fontSize: appW(15),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              h(15),
                              Row(
                                spacing: appW(11),
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.star_border,
                                      color: colors.blue,
                                      size: appW(24),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      // Using Clipboard Package to Copy the Translated Sentance/Word.
                                      Clipboard.copy(
                                        ref.watch(translationWordsProvider)!,
                                      );
                                    },
                                    child: Icon(
                                      Icons.copy_rounded,
                                      color: colors.blue,
                                      size: appW(24),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(child: SizedBox.shrink()),
            SliverToBoxAdapter(
              child: h(35),
            ),
          ],
        ),
      ),
    );
  }
}
