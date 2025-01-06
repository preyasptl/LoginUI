//
//  Extension_Text.swift
//  Causeway-Apple
//
//  Created by Bradley Black on 3/7/23.
//

import SwiftUI


enum Typeface {
    case titleLarge
    case title
    case title2
    case title3
    case headline //Card title large
    case subheadline //Card title small
    case body1 //Body large
    case body1SemiBold
    case body2 //Body medium
    case body2SemiBold
    case body3 //Body Default
    case body3SemiBold
    case body4
    case body4SemiBold
    case body5
    case body5SemiBold
    case body6
    case body6SemiBold
    case body7
    case body7SemiBold
    case body8
    case body8SemiBold
    case footnote
    case chartAxis
    case title26
    case title40
    case cardTitleLarge
    case cardTitleSmall
    case numberXLarge
    case numberLarge
    /// Inter 24
    case numberMedium
    case numberSmall
    case numberXSmall
    case numberXXSmall
    
    var fontFamily: String {
        if [.numberXLarge,
            .numberLarge,
            .numberMedium,
            .numberSmall,
            .numberXSmall,
            .numberXXSmall
        ].contains(self) {
            return "inter"
        }
        return "montserrat"
        //return "inter"
    }

    var relativeTypeface: Font.TextStyle {
        switch self {
        case .titleLarge, .title40: return .largeTitle
        case .title: return .title
        case .title2, .title26: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .subheadline: return .subheadline
        case .footnote: return .footnote
        case .chartAxis: return .caption
        default: return .body
        }
    }
    
    var lineSpacing: CGFloat {
        switch self {
        case .titleLarge, .title: return defaultSize * 0.1
        case .title2: return defaultSize * 0.15
        case .title3, .title26, .title40, .subheadline: return defaultSize * 0.2
        case .footnote, .chartAxis: return 4
        case .cardTitleLarge: return defaultSize * 0.1
        case .cardTitleSmall: return defaultSize * 0.2
        default: return defaultSize * 0.25 // should this be 0.5?
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .title2, .headline, .subheadline, .cardTitleLarge, .cardTitleSmall, .numberSmall: return .bold
        case .titleLarge, .title, .title3, .title26, .title40, .body1SemiBold, .body2SemiBold, .body3SemiBold, .body4SemiBold, .body5SemiBold, .body6SemiBold, .body7SemiBold, .body8SemiBold, .numberXLarge, .numberLarge, .numberMedium, .numberXXSmall: return .semibold
        default: return .medium
        }
    }
    
    var defaultColor: Color {
        switch self {
        case .titleLarge, .title, .title2, .title3, .headline, .subheadline, .title26, .title40:
            return .white //Color(light: .ohsTextDarkBlue, dark: .ohsLightBlue)
        default:
            return .white //Color(light: .ohsTextDarkBlue, dark: .ohsTextWhite)
        }
    }
//    var tabletFontScaleFactor: CGFloat {
//        switch self {
//        case .titleLarge, .title, .title2, .title3, .headline, .subheadline, .title26, .title40: return OHSStyle.tabletFontScaleFactor.title.rawValue
//            default: return OHSStyle.tabletFontScaleFactor.body.rawValue
//        }
//    }
    var defaultSize: CGFloat {
        switch self {
        case .titleLarge: return 34
        case .title: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline: return 18
        case .subheadline: return 16
        case .body1, .body1SemiBold: return 20
        case .body2, .body2SemiBold: return 18
        case .body3, .body3SemiBold: return 16
        case .body4, .body4SemiBold: return 14
        case .body5, .body5SemiBold: return 13
        case .body6, .body6SemiBold: return 12
        case .body7, .body7SemiBold: return 11
        case .body8, .body8SemiBold: return 10
        case .footnote: return 14
        case .chartAxis: return 12
        case .title26: return 26
        case .title40: return 40
        case .cardTitleLarge: return 18
        case .cardTitleSmall: return 16
        case .numberXLarge: return 40
        case .numberLarge: return 28
        case .numberMedium: return 24
        case .numberSmall: return 18
        case .numberXSmall: return 16
        case .numberXXSmall: return 14
        }
    }
    func size(scaleForTablet: Bool = true, tabletFontScaleFactorFactor: Double = 1.0) -> CGFloat {
        let blocked: [Typeface] = [.chartAxis, .cardTitleLarge, .cardTitleSmall]
//        print("size: \(scaleForTablet), \(DataManager.shared.isiPadNonSplit)")
//        let canScaleUp = scaleForTablet && isTabletSize && !blocked.contains(self)
        let scaleFactor = 0
        return self.defaultSize + CGFloat(scaleFactor)
    }
    
//    var isTabletSize: Bool {
//        return DataManager.shared.isiPadNonSplit
//    }
}


extension View {
    
    @ViewBuilder func textStyle(_ typeface: Typeface, color: Color? = nil, weight: Font.Weight? = nil, scaleForTablet: Bool = true) -> some View {
        
//        @ObservedObject var dm = DataManager.shared
        let color = color ?? typeface.defaultColor
        
        self
        
//            .font(.custom(typeface.fontFamily, size: DataManager.shared.size(typeface: typeface, scaleForTablet: scaleForTablet), relativeTo: typeface.relativeTypeface)
            .font(.custom(typeface.fontFamily, size: typeface.size(scaleForTablet: scaleForTablet), relativeTo: typeface.relativeTypeface)
                .weight(weight ?? typeface.weight))
            .lineSpacing(typeface.lineSpacing)
            .foregroundColor(color)
    }
}


struct Extension_Text_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Group {
                    Text(verbatim: "Large Title - wrapping around")
                        .textStyle(.titleLarge)
                    Text(verbatim: "Title 1 - wrapping around to two lines")
                        .textStyle(.title)
                    Text(verbatim: "Title 2 - wrapping around and around to two lines")
                        .textStyle(.title2)
                    Text(verbatim: "Title 3")
                        .textStyle(.title3)
                    Text(verbatim: "Headline aka Card title large - wrapping around to two lines")
                        .textStyle(.headline)
                    Text(verbatim: "Subheadline")
                        .textStyle(.subheadline)
                }
                Group {
                    Text(verbatim: "Body 1 - with additional text to demo text wrapping behavior")
                        .textStyle(.body1)
                    Text(verbatim: "Body 1 SemiBold - with additional text to demo text wrapping behavior")
                        .textStyle(.body1SemiBold)
                    Text(verbatim: "Body 2 - with additional text to demo text wrapping behavior")
                        .textStyle(.body2)
                    Text(verbatim: "Body 2 SemiBold - with additional text to demo text wrapping behavior")
                        .textStyle(.body2SemiBold)
                    Text(verbatim: "Body 3 - with additional text to demo text wrapping behavior")
                        .textStyle(.body3)
                    Text(verbatim: "Body 3 SemiBold - with additional text to demo text wrapping behavior")
                        .textStyle(.body3SemiBold)
                    Text(verbatim: "Body 4 - with additional text to demo text wrapping behavior")
                        .textStyle(.body4)
                }
                Group {
                    Text(verbatim: "Footnote - with additional text to demo text wrapping behavior")
                        .textStyle(.footnote)
                }
            }
            .padding()
        }
//        .rootRootView()
    }
}

extension DynamicTypeSize {
    var description: String {
        switch self {
        case .xSmall:
            return "xSmall"
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        case .xLarge:
            return "xLarge"
        case .xxLarge:
            return "xxLarge"
        case .xxxLarge:
            return "xxxLarge"
        case .accessibility1:
            return "Accessibility1"
        case .accessibility2:
            return "Accessibility2"
        case .accessibility3:
            return "Accessibility3"
        case .accessibility4:
            return "Accessibility4"
        case .accessibility5:
            return "Accessibility5"
        @unknown default:
            return "Unknown"
        }
    }
}
