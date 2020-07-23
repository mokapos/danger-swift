import Foundation

// MARK: - Violation

/// The result of a warn, message, or fail.
public struct Violation: Encodable {
    public let message: String
    public let file: String?
    public let line: Int?

    init(message: String, file: String? = nil, line: Int? = nil) {
        self.message = message
        self.file = file
        self.line = line
    }

    func getMessage() -> String{
        return self.message
    }
}

/// Meta information for showing in the text info
public struct Meta: Encodable {
    let runtimeName = "Danger Swift"
    let runtimeHref = "https://danger.systems/swift"
}

// MARK: - Results

/// The representation of what running a Dangerfile generates.
struct DangerResults: Encodable {
    /// Failed messages.
    var fails = [Violation]()

    /// Messages for info.
    var warnings = [Violation]()

    /// A set of messages to show inline.
    var messages = [Violation]()

    /// Markdown messages to attach at the bottom of the comment.
    var markdowns = [Violation]()

    /// Information to pass back to Danger JS about the runtime
    let meta = Meta()
}
