//
//  Chord+Quality.swift
//  SwiftlyChordUtilities
//
//  © 2023 Nick Berendsen
//

import Foundation

extension Chord {

    /// All the chord qualities we know about
    /// - Note: Changes to the raw value might break the databases
    public enum Quality: String, CaseIterable, Codable, Comparable {

        // MARK: Triad

        case major = ""
        case minor = "m"
        case aug = "aug"
        case dim = "dim"
        
        // MARK: Seventh

        case seven = "7"
        case sevenSharpFive = "7#5"
        case sevenFlatFive = "7b5"
        case sevenSharpNine = "7#9"
        case sevenFlatNine = "7b9"
        case minorSeven = "m7"
        case majorSeven = "maj7"
        case augSeven = "aug7"
        case dimSeven = "dim7"
        case majorSevenSharpFive = "maj7#5"
        case majorSevenFlatFive = "maj7b5"
        case minorMajorSeven = "mMaj7"
        case minorMajorSeventFlatFive = "mMaj7b5"
        case minorSevenFlatFive = "m7b5"

        // MARK: Suspended

        case susTwo = "sus2"
        case susFour = "sus4"
        case sevenSusTwo = "7sus2"
        case sevenSusFour = "7sus4"

        // MARK: Extended

        case nine = "9"
        case majorNine = "maj9"
        case minorMajorNine = "mMaj9"
        case minorNine = "m9"
        case nineFlatFive = "9b5"
        case nineSharpEleven = "9#11"

        case eleven = "11"
        case majorEleven = "maj11"
        case minorEleven = "m11"
        case minorMajorEleven = "mMaj11"

        case thirteen = "13"
        case majorThirteen = "maj13"
        case minorThirteen = "m13"

        // MARK: Added

        case five = "5"
        case six = "6"
        case minorSix = "m6"
        case sixNine = "69"
        case minorSixNine = "m69"
        case addNine = "add9"
        case minorAddNine = "madd9"

        // MARK: Augmented

        case augNine = "aug9"

        // MARK: Other

        /// Fallback
        case unknown

        /// Implement Comparable
        public static func < (lhs: Self, rhs: Self) -> Bool {
            allCases.firstIndex(of: lhs) ?? 0 < allCases.firstIndex(of: rhs) ?? 1
        }

        // swiftlint:disable large_tuple

        /// A suitible string for displaying to users.
        /// - `accessible:`  "seven flat five". Useful for text to speech.
        /// - `short:` Maj, min
        /// - `symbol:` dim⁷, + For the most common uses of symbols in music notation.
        /// - `altSymbol:` °, ⁺ Alternative examples of the above `symbol` examples.
        ///
        /// Advice is to look through this list and choose what is appropriate for your app. Please submit a PR if you'd like to add or change some of these items if you beleive it could be improved.
        /// Because of this, do not rely on these values to always remain the same. So don't use them as identifiers, or keys.
        ///
        /// For accessibility strings the "th" is dropped from numbers. While not completely accurate, it rolls better.
        ///
        /// Symbols use superscript where appropriate (and possible). Be aware that not all fonts will support this. Use `short` instead if you're unsure.
        ///
        /// Some items may also be identical across types. Only in rare cases will an alt symbol be provided e.g. (`dim⁷`,`°`)
        public var display: (accessible: String, short: String, symbolized: String, altSymbol: String) {
            switch self {
            case .major:
                ("major", "", "", "")
            case .minor:
                ("minor", "m", "m", "m")
            case .dim:
                ("diminished", "dim", "dim", "dim")
            case .dimSeven:
                ("dim seven", "dim7", "dim⁷", "°")
            case .susTwo:
                ("suss two", "sus2", "sus²", "sus²")
            case .susFour:
                ("suss four", "sus4", "sus⁴", "sus⁴")
            case .sevenSusTwo:
                ("seven sus two", "7sus2", "⁷sus²", "⁷sus²")
            case .sevenSusFour:
                ("seven sus four", "7sus4", "⁷sus⁴", "⁷sus⁴")
            case .five:
                ("power", "5", "⁵", "⁵")
            case .aug:
                ("augmented", "aug", "aug", "⁺")
            case .six:
                ("six", "6", "⁶", "⁶")
            case .sixNine:
                ("six slash nine", "6/9", "⁶ᐟ⁹", "⁶ᐟ⁹")
            case .seven:
                ("seven", "7", "⁷", "⁷")
            case .sevenFlatFive:
                ("seven flat five", "7b5", "⁷♭⁵", "⁷♭⁵")
            case .augSeven:
                ("org seven", "aug7", "aug⁷", "⁺⁷")
            case .nine:
                ("nine", "9", "⁹", "⁹")
            case .nineFlatFive:
                ("nine flat five", "9b5", "⁹♭⁵", "⁹♭⁵")
            case .augNine:
                ("org nine", "aug9", "aug⁹", "⁺⁹")
            case .sevenFlatNine:
                ("seven flat nine", "7b9", "⁷♭⁹", "⁷♭⁹")
            case .sevenSharpNine:
                ("seven sharp nine", "7#9", "⁷♯⁹", "⁷♯⁹")
            case .sevenSharpFive:
                ("dominant sharp five", "7#5", "⁷♯⁵", "⁷♯⁵")
            case .eleven:
                ("eleven", "11", "¹¹", "¹¹")
            case .nineSharpEleven:
                ("nine sharp eleven", "9#11", "⁹♯¹¹", "⁹♯¹¹")
            case .thirteen:
                ("thirteen", "13", "¹³", "¹³")
            case .minorThirteen:
                ("minor thirteen", "m13", "m¹³", "m¹³")
            case .majorSeven:
                ("major seven", "maj7", "maj⁷", "M⁷")
            case .majorSevenFlatFive:
                ("major seven flat five", "maj7b5", "maj⁷♭⁵", "M⁷♭⁵")
            case .majorSevenSharpFive:
                ("major seven sharp five", "maj7#5", "maj⁷♯⁵", "M⁷♯⁵")
            case .majorNine:
                ("major nine", "maj9", "maj⁹", "M⁹")
            case .majorEleven:
                ("major eleven", "maj11", "maj¹¹", "m¹¹")
            case .majorThirteen:
                ("major thirteen", "maj13", "maj¹³", "M¹³")
            case .minorSix:
                ("minor six", "m6", "m⁶", "m⁶")
            case .minorSixNine:
                ("minor six slash nine", "m6/9", "m⁶ᐟ⁹", "m⁶ᐟ⁹")
            case .minorSeven:
                ("minor seven", "m7", "m⁷", "m⁷")
            case .minorSevenFlatFive:
                ("minor seven flat five", "m7b5", "m⁷♭⁵", "ø⁷")
            case .minorNine:
                ("minor nine", "m9", "m⁹", "m⁹")
            case .minorEleven:
                ("minor eleven", "m11", "m¹¹", "m¹¹")
            case .minorMajorSeven:
                ("minor major seven", "mMaj7", "mMaj⁷", "mᴹ⁷")
            case .minorMajorSeventFlatFive:
                ("minor major seven flat five", "mMaj7b5", "mMaj⁷♭⁵", "mᴹ⁷♭⁵")
            case .minorMajorNine:
                ("minor major nine", "mMaj9", "mMaj⁹", "mᴹ⁹")
            case .minorMajorEleven:
                ("minor major eleven", "mMaj11", "mMaj¹¹", "mᴹ¹¹")
            case .addNine:
                ("add nine", "add9", "add⁹", "ᵃᵈᵈ⁹")
            case .minorAddNine:
                ("minor add nine", "madd9", "madd⁹", "mᵃᵈᵈ⁹")
            case .unknown:
                ("unknown", "?", "?", "?")
            }
        }

        // swiftlint:enable large_tuple

        /// Supports a few most popular groupings. Major, Minor, Diminished, Augmented, Suspended.
        /// Please open a PR if you'd like to introduce more types or offer corrections.
        /// Anything that doesn't fit into the above categories are put in `other`.
        ///
        /// The intention for the group is for developers to offer different filter types for chart lookup.
        var group: Chord.Group {
            // swiftlint:disable line_length
            switch self {
            case .major, .majorSeven, .majorSevenFlatFive, .majorSevenSharpFive, .majorNine, .majorEleven, .majorThirteen, .addNine:
                .major
            case .minor, .minorSix, .minorSixNine, .minorSeven, .minorEleven, .minorSevenFlatFive, .minorMajorSeven, .minorMajorSeventFlatFive, .minorMajorNine, .minorMajorEleven, .minorAddNine, .minorNine, .minorThirteen:
                .minor
            case .dim, .dimSeven:
                .diminished
            case .susTwo, .susFour, .sevenSusTwo, .sevenSusFour:
                .suspended
            case .aug, .augSeven, .augNine:
                .augmented
            case .five, .six, .sixNine, .seven, .sevenFlatFive, .nine, .nineFlatFive, .sevenFlatNine, .sevenSharpNine, .eleven, .nineSharpEleven, .thirteen, .sevenSharpFive, .unknown:
                .other
            }
            // swiftlint:enable line_length
        }

        /// Convert an `Quality` enum to a `Quality` string
        var stringValue: String {
            switch self {
            case .sixNine:
                return "69"
            default:
                return self.rawValue
            }
        }
    }
}

extension String {

    /// Convert a `Quality` string to a `Quality` enum
    var qualityEnumValue: Chord.Quality? {
        switch self {
        case "69":
                .sixNine
        case "m":
                .minor
        default:
            Chord.Quality(rawValue: self)
        }
    }
}
