#!/bin/sh

flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/l10n/localized_strings.dart
cp lib/l10n/intl_messages.arb lib/l10n/intl_en.arb
cp lib/l10n/intl_messages.arb lib/l10n/intl_ja.arb

flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \
    --no-use-deferred-loading lib/l10n/localized_strings.dart lib/l10n/intl_*.arb
