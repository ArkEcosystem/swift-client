//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

public class Node {

    private let connection: Connection
    private let apiGetHandler: ApiGetHandler
    private var endpoint: String {
        return "\(connection.host)/node"
    }

    public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet) {
        self.connection = connection
        self.apiGetHandler = apiGetHandler
    }

    /// Retrieves the status
    public func status(completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/status", [:], completionHandler)
    }

    /// Retrieves the node syncing status
    public func syncing(completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/syncing", [:], completionHandler)
    }

    /// Retrieves the configuration
    public func configuration(completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/configuration", [:], completionHandler)
    }

    /// Retrieves the crypto configuration
    public func crypto(completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/configuration/crypto", [:], completionHandler)
    }

    /// Retrieves the fee statistics
    public func fees(completionHandler: @escaping ([String: Any]?) -> Void, days: Int? = nil) {
        var params: [String:Int] = [:]
        if days != nil {
            params["days"] = days
        }
        apiGetHandler("\(endpoint)/fees", params, completionHandler)
    }
}
