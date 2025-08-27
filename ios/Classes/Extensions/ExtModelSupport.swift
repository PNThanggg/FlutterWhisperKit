import WhisperKit

extension ModelSupport {
    /// Converts ModelSupport to a dictionary for JSON serialization
    func toJson() -> [String: Any] {
        return [
            "default": `default`,
            "supported": supported,
            "disabled": disabled
        ]
    }
}
