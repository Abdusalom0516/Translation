import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:translation/core/common/widgets/sizedbox.dart';
import 'package:translation/core/constants/country_languages.dart';
import 'package:translation/core/constants/lang_coutry_codes.dart';
import 'package:translation/core/utils/app_responsive.dart';
import 'package:translation/core/utils/app_state_wrapper.dart';
import 'package:translation/providers/from_provider.dart';
import 'package:translation/providers/to_provider.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key, this.from});
  final bool? from;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (ref, colors) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Choose Language"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: h(15),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                child: Column(
                    children: languageCountryList
                        .map(
                          (e) => Card(
                            margin: EdgeInsets.only(
                              bottom: appH(15),
                              left: appW(20),
                              right: appW(20),
                            ),
                            elevation: appW(4.1),
                            child: ListTile(
                              onTap: () {
                                if (from != null) {
                                  ref
                                      .read(fromProvider.notifier)
                                      .changeLanguageCode(
                                          newLangCode: e["langCode"]!);
                                  Navigator.pop(context);
                                } else {
                                  ref
                                      .read(toProvider.notifier)
                                      .changeLanguageCode(
                                          newLangCode: e["langCode"]!);
                                  Navigator.pop(context);
                                }
                              },
                              minTileHeight: appH(79),
                              tileColor: Colors.blue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(appW(9))),
                              title: Text(
                                countryLanguages[e["countryCode"]!]!,
                                style: TextStyle(
                                  color: colors.blue,
                                  fontSize: appW(17),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              leading: CountryFlag.fromCountryCode(
                                e["countryCode"]!,
                                height: appH(51),
                                width: appW(51),
                                shape: Circle(),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
