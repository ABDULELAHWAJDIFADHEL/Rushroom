//
//  String+Additions.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation
import UIKit

extension String {
    
    var isNumber: Bool {
        
        let charcter  = NSCharacterSet(charactersIn: "$0123456789").inverted
        var filtered:String!
        let inputString:[String] = self.components(separatedBy: charcter)
        filtered = inputString.joined(separator: "")
        if filtered == "" && self == "" {
            return false
        }
        return  self == filtered
        
    }

    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func timeFormat()->String{
        let seconds = Int(self)
        let (h, m, s) = secondsToHoursMinutesSeconds (seconds:seconds ?? 0)
        if h == 0 {
            return "\(m):\(s)"
        } else {
            return "\(h):\(m):\(s)"
        }
    }
    
    func flag() -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in self.utf16 {
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
    
    func containsNumbers() -> Bool {
        let charSet = CharacterSet.letters
        let range = self.rangeOfCharacter(from: charSet)
        if let _ = range {
            return false
        } else {
            return true
        }
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func hasSubString(_ string: String) -> Bool {
        //return self.contains(string)
        if self.lowercased().range(of: string.lowercased()) != nil {
            return true
        } else {
            return false
        }
    }
    
    func utf8DecodedString()-> String {
        let data = self.data(using: .utf8)
        if let message = String(data: data!, encoding: .nonLossyASCII){
            return message
        }
        return ""
    }
    
    func utf8EncodedString()-> String {
        let messageData = self.data(using: .nonLossyASCII)
        let text = String(data: messageData!, encoding: .utf8)
        return text!
    }
    
    public func localizedString() -> String {
        return NSLocalizedString(self, comment: self)
    }
    
    func localize() -> String {
        let table = AppConfig.getAPPConstantFileName()
        let value = NSLocalizedString(self, tableName: table, bundle: .main, value:"", comment: "")
        return NSLocalizedString(value, comment: "")
    }
    
    public func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    public func trimSpace() -> String {
        let trimmedString = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmedString
    }
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            return trimmed.isEmpty
        }
    }
    
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func isValidPhone() -> Bool {
        let PHONE_REGEX = "^[0-9]{8,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    func checkNoSpecialChacter() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func removeSpecialCharsFromString() -> String {
        let validChar = Set("+1234567890")
        return String(self.filter { validChar.contains($0) })
    }
    
    func validString() -> String
    {
        if(self == "<null>" || self == "<NULL>")
        {
            return ""
        }
        else if(self == "<nil>" || self == "<NIL>")
        {
            return ""
        }
        else if(self == "null" || self == "NULL")
        {
            return ""
        }
        else if(self == "NIL" || self == "nil")
        {
            return ""
        }
        else if(self == "(null)")
        {
            return ""
        }
        
        return self
    }
    
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    //Convert UTC time to Local
    func UTCToLocal(_ toFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = DateFormat.isoFormat
        
        if let dt = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            dateFormatter.timeZone = NSTimeZone.local
            let str = dateFormatter.string(from: dt)
            return dateFormatter.date(from: str)
        }
        return nil
    }
    
    var isAplphabet: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[a-zA-Z ]+", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var digitsOnly: String {
        let stringArray = components(separatedBy: CharacterSet.alphanumerics.inverted)
        let allNumbers = stringArray.joined(separator: "")
        return allNumbers
    }
    
    func formattedText(formattingPattern: String, replacementChar: String) -> String? {
        if !isEmpty {
            let tempString = digitsOnly
            var finalText = ""
            var stop = false
            var formatterIndex = formattingPattern.startIndex
            var tempIndex = tempString.startIndex
            while !stop {
                let formattingPatternRange = formatterIndex ..< formattingPattern.index(formatterIndex, offsetBy: 1)
                
                if formattingPattern[formattingPatternRange] != String(replacementChar) {
                    finalText += formattingPattern[formattingPatternRange]
                } else if !tempString.isEmpty {
                    let pureStringRange = tempIndex ..< tempString.index(tempIndex, offsetBy: 1)
                    
                    finalText += tempString[pureStringRange]
                    tempIndex = tempString.index(after: tempIndex)
                }
                
                formatterIndex = formattingPattern.index(after: formatterIndex)
                
                if formatterIndex >= formattingPattern.endIndex || tempIndex >= tempString.endIndex {
                    stop = true
                }
            }
            return finalText
        } else {
            return nil
        }
    }
    
    func UTCToLocal(toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = CURRENT_CALENDAR.timeZone
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = DateFormat.isoFormat
        
        if let dt = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            dateFormatter.timeZone = NSTimeZone.local
            return dateFormatter.string(from: dt)
        }
        return self
    }
    
    func getMilliSecondDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = DateFormat.shortDateFormatWithSpace
        if let date = dateFormatter.date(from: self) {
            return "\(date.getDateTimeInMilliseconds())"
        }
        return ""
    }
    
    func convertDateFormat() -> Date? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = DateFormat.standardFormat
        let showDate = inputFormatter.date(from: self)
        return showDate
    }
    
    func getMilliDateSecond() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM dd yyyy"
        if let date = dateFormatter.date(from: self) {
            return "\(date.getDateTimeInMilliseconds())"
        }
        return ""
    }
    
    func getDateMilliSecond() -> Date? {
        if let time = Int(self) {
            return Date(timeIntervalSince1970: (TimeInterval(time / 1000)))
        }
        return nil
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    
    func removeExtraSpaces() -> String {
        return self.replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
    }
    
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        var amountWithPrefix = self
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.utf8.count), withTemplate: "")
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        guard number != 0 as NSNumber else {
            return ""
        }
        return formatter.string(from: number)!
    }
    
    func fontName(wieight: FontWeight)-> String {
        return self + "-" + wieight.rawValue
    }
    
    func base64ToImage() -> UIImage? {
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        return nil
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
    
    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
}

extension Array where Element: Equatable {
    mutating func move(_ element: Element, to newIndex: Index) {
        if let oldIndex: Int = self.firstIndex(of: element) { self.move(from: oldIndex, to: newIndex) }
    }
}

extension Array {
    mutating func move(from oldIndex: Index, to newIndex: Index) {
        // Don't work for free and use swap when indices are next to each other - this
        // won't rebuild array and will be super efficient.
        if oldIndex == newIndex { return }
        if abs(newIndex - oldIndex) == 1 { return self.swapAt(oldIndex, newIndex) }
        self.insert(self.remove(at: oldIndex), at: newIndex)
    }
}

extension String {
    func isEmptyOrWhitespace() -> Bool {
        if(self.isEmpty) {
            return true
        }
        return (self.trimmingCharacters(in: NSCharacterSet.whitespaces) == "")
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
    
    func toDateInstaceFromStandardFormat() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = CURRENT_CALENDAR.timeZone
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = DateFormat.isoFormat
        return dateFormatter.date(from: self)
    }
    
    //MARK:- convert string to dictionary
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
}

extension Locale {
    func isoCode(for countryName: String) -> String? {
        return Locale.isoRegionCodes.first(where: { (code) -> Bool in
            localizedString(forRegionCode: code)?.compare(countryName, options: [.caseInsensitive, .diacriticInsensitive]) == .orderedSame
        })
    }
}

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)
    }
    
    var kmFormatted: String {
        switch self {
        case ..<1_000:
            return String(format: "%.0f", locale: Locale.current, self)
        case 1_000 ..< 999_999:
            return String(format: "%.1fK", locale: Locale.current, self / 1_000).replacingOccurrences(of: ".0", with: "")
        default:
            return String(format: "%.1fM", locale: Locale.current, self / 1_000_000).replacingOccurrences(of: ".0", with: "")
        }
    }
}

extension Int {
    var bool: Bool {
        return self == 1 ? true : false
    }
}
