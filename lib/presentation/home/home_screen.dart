import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:translation/core/common/widgets/sizedbox.dart';
import 'package:translation/core/constants/country_codes.dart';
import 'package:translation/core/constants/country_languages.dart';
import 'package:translation/core/utils/app_responsive.dart';
import 'package:translation/core/utils/app_state_wrapper.dart';
import 'package:translation/core/utils/clipboard.dart';
import 'package:translation/presentation/home/languages_screen.dart';
import 'package:translation/providers/from_provider.dart';
import 'package:translation/providers/to_provider.dart';
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
              Icon(
                Icons.translate_rounded,
                size: appW(27),
              ),
              Text("Translator"),
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
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LanguagesScreen(
                                      from: true,
                                    ),
                                  ),
                                );
                                // FocusScope.of(context).unfocus();
                                // controller.clear();
                              },
                              child: Row(
                                spacing: appW(9),
                                children: [
                                  CountryFlag.fromCountryCode(
                                    countryCodes[ref.watch(fromProvider)]!,
                                    height: appH(27),
                                    width: appW(27),
                                    shape: Circle(),
                                  ),
                                  Text(
                                    countryLanguages[countryCodes[
                                        ref.watch(fromProvider)]!]!,
                                    style: TextStyle(
                                      color: colors.blue,
                                      fontSize: appW(17),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                String to = ref.watch(toProvider);
                                ref
                                    .read(toProvider.notifier)
                                    .changeLanguageCode(
                                      newLangCode: ref.watch(fromProvider),
                                    );
                                ref
                                    .read(fromProvider.notifier)
                                    .changeLanguageCode(newLangCode: to);
                              },
                              color: colors.blue,
                              icon: Icon(
                                Icons.swap_horiz_rounded,
                                size: appW(25),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LanguagesScreen(),
                                  ),
                                );
                                // FocusScope.of(context).unfocus();
                                // controller.clear();
                              },
                              child: Row(
                                spacing: appW(9),
                                children: [
                                  Text(
                                    countryLanguages[
                                        countryCodes[ref.watch(toProvider)]!]!,
                                    style: TextStyle(
                                      color: colors.blue,
                                      fontSize: appW(17),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  CountryFlag.fromCountryCode(
                                    countryCodes[ref.watch(toProvider)]!,
                                    height: appH(27),
                                    width: appW(27),
                                    shape: Circle(),
                                  ),
                                ],
                              ),
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
                      child: IntrinsicHeight(
                        child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: appW(11),
                                    children: [
                                      Text(
                                        countryLanguages[countryCodes[
                                            ref.watch(fromProvider)]!]!,
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
                                          .read(
                                              translationWordsProvider.notifier)
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
                              TextField(
                                maxLines: null,
                                controller: controller,
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
                                          .read(
                                              translationWordsProvider.notifier)
                                          .translate(
                                            ref.watch(fromProvider),
                                            ref.watch(toProvider),
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: h(25),
            ),
            ref.watch(translationWordsProvider).value != null
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
                                    countryLanguages[
                                        countryCodes[ref.watch(toProvider)]!]!,
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
                              ref.watch(translationWordsProvider).isLoading
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: appH(7),
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: colors.blue
                                              .withValues(alpha: 0.4),
                                          highlightColor: colors.blue
                                              .withValues(alpha: 0.7),
                                          child: Container(
                                            width: double.infinity,
                                            height: appH(15),
                                            decoration: BoxDecoration(
                                              color: colors.blue
                                                  .withValues(alpha: 0.6),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                appW(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: colors.blue
                                              .withValues(alpha: 0.4),
                                          highlightColor: colors.blue
                                              .withValues(alpha: 0.7),
                                          child: Container(
                                            width: appW(250),
                                            height: appH(15),
                                            decoration: BoxDecoration(
                                              color: colors.blue
                                                  .withValues(alpha: 0.6),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                appW(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: colors.blue
                                              .withValues(alpha: 0.4),
                                          highlightColor: colors.blue
                                              .withValues(alpha: 0.7),
                                          child: Container(
                                            width: appW(200),
                                            height: appH(15),
                                            decoration: BoxDecoration(
                                              color: colors.blue
                                                  .withValues(alpha: 0.6),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                appW(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: colors.blue
                                              .withValues(alpha: 0.4),
                                          highlightColor: colors.blue
                                              .withValues(alpha: 0.7),
                                          child: Container(
                                            width: appW(150),
                                            height: appH(15),
                                            decoration: BoxDecoration(
                                              color: colors.blue
                                                  .withValues(alpha: 0.6),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                appW(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : ref
                                          .watch(translationWordsProvider)
                                          .value!
                                          .isEmpty
                                      ? Text(
                                          textAlign: TextAlign.start,
                                          "...",
                                          style: TextStyle(
                                            color: colors.blue
                                                .withValues(alpha: 0.6),
                                            fontSize: appW(15),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : Text(
                                          textAlign: TextAlign.start,
                                          ref
                                              .watch(translationWordsProvider)
                                              .value!,
                                          style: TextStyle(
                                            color: colors.blue
                                                .withValues(alpha: 0.6),
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
                                        ref
                                            .watch(translationWordsProvider)
                                            .value!,
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
