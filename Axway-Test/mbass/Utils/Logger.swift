// /Utils/Logger.swift
 

// This class handles oAuth authentication based on the required implementation.

import Foundation

public enum LogLevel: Int {
    case verbose = 0
    case info
    case debug
    case error
}

/// Handle logging of information.
public class Logger {

    public var level: LogLevel = .debug

    static let shared: Logger = {
        return Logger() // Lazy loading of singleton object.
    }()

    private init() {} // Make init as private

    func info(_ items: Any...) {
        self.log(inLevel: .info, items: items)
    }
    func debug(_ items: Any...) {
        self.log(inLevel: .debug, items: items)
    }
    func verbose(_ items: Any...) {
        self.log(inLevel: .verbose, items: items)
    }
    func error(_ items: Any...) {
        self.log(inLevel: .error, items: items)
    }

    func log(inLevel: LogLevel, items: Any...) {
        if inLevel.rawValue >= self.level.rawValue {
            print(items)
        }
    }

}
