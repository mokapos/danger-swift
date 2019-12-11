public struct SwiftLintViolation: Decodable {
    enum Severity: String, Decodable {
        case warning = "Warning"
        case error = "Error"
    }

    var ruleID: String
    var reason: String
    var line: Int
    var severity: Severity
    var file: String

    public var fileName: String {
        "\(file.split(separator: "/").last!)"
    }

    public var violationLine: Int {
        return line
    }

    var messageText: String {
        return reason + " (`\(ruleID)`)"
    }

    enum CodingKeys: String, CodingKey {
        case ruleID = "rule_id"
        case reason, line, file, severity
    }

    public func toMarkdown() -> String {
        let formattedFile = fileName + ":\(line)"
        return "\(severity.rawValue) | \(formattedFile) | \(messageText) |"
    }

    public func toComment() -> String {
        return "**\(fileName) : \(line)** (\(ruleID))<br>\(reason)"
    }
}

/*
 "rule_id" : "opening_brace",
 "reason" : "Opening braces should be preceded by a single space and on the same line as the declaration.",
 "character" : 39,
 "file" : "\/Users\/ash\/bin\/Harvey\/Sources\/Harvey\/Harvey.swift",
 "severity" : "Warning",
 "type" : "Opening Brace Spacing",
 "line" : 8
 */
