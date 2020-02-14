import Foundation

enum HTTPRequestError: Error {
    case CouldNotFormURL
    case CouldNotParseResponse
    case Failure(String)
    case Unknown(String)
}

class NetworkClient {

    /// Performs a GET operation at the specified url and returns a JSON.
    ///
    /// - Parameters:
    ///   - url: Url to be visited.
    ///   - completion: The completion handler to call when the load request is complete.
    public func getHTTP<T : Decodable>(at url: String, withCompletion completion: @escaping (T?, HTTPRequestError?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil, .CouldNotFormURL)
            return
        }

        request(URLRequest(url: url)) { (data, _, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let obj = try jsonDecoder.decode(T.self, from: data)

                    completion(obj, nil)
                }
                catch let error {
                    completion(nil, .Unknown(error.localizedDescription))
                }
            } else {
                completion(nil, error)
            }
        }
    }

    /// Performs a GET operation at the specified url and returns raw Data.
    ///
    /// - Parameters:
    ///   - url: Url to be visited.
    ///   - completion: The completion handler to call when the load request is complete.
    public func getHTTP(at url: String, withCompletion completion: @escaping (Data?, HTTPRequestError?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil, .CouldNotFormURL)
            return
        }

        request(URLRequest(url: url)) { (data, _, error) in
            completion(data, error)
        }
    }

    /// Performs a POST operation at the specified url.
    ///
    /// - Parameters:
    ///   - url: Url to be visited.
    ///   - encodableObj: Encodable object representation of the request's body.
    ///   - completion: The completion handler to call when the load request is complete.
    public func postHTTP<T : Encodable>(at url: String, withEncodableObj encodableObj: T, withCompletion completion: @escaping (Data?, HTTPRequestError?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil, .CouldNotFormURL)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(encodableObj)
            urlRequest.httpBody = jsonData

            request(urlRequest) { (data, _, error) in
                completion(data, error)
            }
        } catch let error {
            completion(nil, .Unknown(error.localizedDescription))
        }
    }

    private func request(_ request: URLRequest, completion: @escaping (Data?, HTTPURLResponse?, HTTPRequestError?) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, nil, .Failure(error.localizedDescription))
            } else if let response = response as? HTTPURLResponse {
                if response.statusCode == 201 || response.statusCode == 200 {
                    completion(data, response, nil)
                } else {
                    completion(nil, nil, .Failure("Error on response (code: \(response.statusCode))."))
                }
            } else {
                completion(nil, nil, .CouldNotParseResponse)
            }
        }.resume()
    }

}
