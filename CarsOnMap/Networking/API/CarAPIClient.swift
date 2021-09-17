

import Foundation

protocol APIClient {
    
    init(baseURL: URL, networkSession: NetworkSession)

    func fetchCarList(_ completion: @escaping ((Result<Cars, Error>) -> Void))
}

/// Responsible for providing required content fetched from server.
struct CarApiClient: APIClient {
    
    private let baseURL: URL
    private let networkSession: NetworkSession
    /**
     Initializes `CarApiClient` with provided URL and session
     
     - parameters:
        - baseURL: Base URL
     */
    init(baseURL: URL, networkSession: NetworkSession = URLSession(configuration: .ephemeral)) {
        self.baseURL = baseURL
        self.networkSession = networkSession
    }
    
    func fetchCarList(_ completion: @escaping ((Result<Cars, Error>) -> Void)) {
        let request = CarRequest(url: self.baseURL)
        request.execute(onNetwork: self.networkSession, then: completion)
    }
}
