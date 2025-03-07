import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:translation/core/common/widgets/sizedbox.dart';
import 'package:translation/core/utils/app_responsive.dart';
import 'package:translation/core/utils/app_state_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (ref, colors) => Scaffold(
        appBar: AppBar(
          title: Text("Language Translator"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              sliver: SliverFillRemaining(
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
                          borderRadius: BorderRadius.circular(appW(16)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Icons.close_rounded,
                                    color: colors.blue,
                                    size: appW(24),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(colors.blue),
                                  ),
                                  onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
