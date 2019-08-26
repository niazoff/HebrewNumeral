import Foundation

extension Int {
  /// Returns the Hebrew numeral represented by the receiver's value.
  ///
  /// Example: A value of 1 retuns א׳.
  /// A value of 0 or any value above one million returns the value in regular Arabic numerals.
  func toHebrewNumeral() -> String {
    let absoluteSelf = abs(self)
    // `DateFormatter` won't use Hebrew numerals after a million so simply return self.
    guard absoluteSelf != 0 && absoluteSelf <= 1_000_000 else { return String(self) }
    
    let calendar = Calendar(identifier: .hebrew)
    // Create a date with the year set to self in the Hebrew calendar.
    guard let date = calendar.date(from: .init(year: self)) else { return String(self) }
    
    let formatter = DateFormatter()
    formatter.calendar = calendar
    formatter.locale = Locale(identifier: "he")
    formatter.dateStyle = .short
    
    let dateString = formatter.string(from: date)
    // The year substrings that reflect self come after the first two components.
    // Multiple year substrings occur when the year includes a space as in "אלף אלפים".
    let yearSubstrings = dateString.split(separator: " ")[2...]
    return yearSubstrings.joined(separator: " ")
  }
}
