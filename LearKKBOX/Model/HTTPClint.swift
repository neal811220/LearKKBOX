//
//  HTTPClint.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
// MARK: - Navigation
enum Result<T> {

    case success(T)

    case failure(Error)
}
// MARK: - Navigation
enum KKHTTPClientError: Error {

    case decodeDataFail

    case clientError(Data)

    case serverError

    case unexpectedError
}
// MARK: - Navigation
enum KKHTTPMethod: String {

    case GET

    case POST
    
    case PUT
}
// MARK: - Navigation
enum KKHTTPHeaderField: String {

    case contentType = "Content-Type"

    case auth = "Authorization"
}
// MARK: - Navigation
enum KKHTTPHeaderValue: String {

    case json = "application/json"
    
    case xwww = "application/x-www-form-urlencoded"
    
    case bearer = "Bearer"
}
// MARK: - Navigation
protocol KKRequest {

    var headers: [String: String] { get }

    var body: Data? { get }

    var method: String { get }

    var url: String { get }
}

extension KKRequest {
  // MARK: - Navigation
    func makeRequest() -> URLRequest {

        let urlString = url
        
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)

        request.allHTTPHeaderFields = headers
        
        request.httpBody = body

        request.httpMethod = method

        return request
    }
}
// MARK: - Navigation
class HTTPClient {

    static let shared = HTTPClient()

    private let decoder = JSONDecoder()

    private let encoder = JSONEncoder()

    private init() { }
// MARK: - Navigation
    func request(
        _ kkRequest: KKRequest,
        completion: @escaping (Result<Data>) -> Void
    ) {

        URLSession.shared.dataTask(
            with: kkRequest.makeRequest(),
            completionHandler: { (data, response, error) in

            guard error == nil else {

                return completion(Result.failure(error!))
            }
                
            // swiftlint:disable force_cast
            let httpResponse = response as! HTTPURLResponse
            // swiftlint:enable force_cast
            let statusCode = httpResponse.statusCode

            switch statusCode {

            case 200..<300:

                completion(Result.success(data!))

            case 400..<500:

                completion(Result.failure(KKHTTPClientError.clientError(data!)))

            case 500..<600:

                completion(Result.failure(KKHTTPClientError.serverError))

            default: return

                completion(Result.failure(KKHTTPClientError.unexpectedError))
            }

        }).resume()
    }
}

