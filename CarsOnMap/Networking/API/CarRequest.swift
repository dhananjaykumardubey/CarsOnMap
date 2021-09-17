
import Foundation

struct CarRequest {
    
    let url: URL
    
    /**
     Initializes `CarRequest` with URL
    
     - parameters:
        - url: Base URL for car lists
     */
    init(url: URL) {
        self.url = url
    }
}

extension CarRequest: DataRequest, ParameteredRequest {
    typealias Response = Cars
    
    var endPoint: String {
        return "/codingtask/cars"
    }
    
    func expressAsURLRequest() throws -> URLRequest {
        try self.buildURL()
    }
    
    func buildURL() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.path = self.endPoint
        components.host = self.url.absoluteString
        guard
            components.host != nil,
            let localUrl = components.url else {
            let errorMessage = components.queryItems?.map { String(describing: $0) }.joined(separator: ", ") ?? ""
            throw BuilderError.unableBuildURL(message: "query item \(errorMessage)")
        }
        
        return URLRequest(url: localUrl,
                                    cachePolicy: URLRequest.CachePolicy.reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
    }
}
