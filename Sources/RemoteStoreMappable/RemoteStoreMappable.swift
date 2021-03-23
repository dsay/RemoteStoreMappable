import ObjectMapper
import Foundation
import RemoteStoreAlamofire
import SwiftRepository
import Alamofire

open class RemoteStoreMappable<Item: BaseMappable>: RemoteStoreAlamofire, RemoteStoreObjects {
    
    public func send(request: RequestProvider,
                     keyPath: String? = nil,
                     responseObject: @escaping (Result<Item, Error>) -> Void)
    {
        do {
            try send(request).responseObject(keyPath: keyPath) { (response: AFDataResponse<Item>) -> Void in
                responseObject(self.handler.handle(response))
            }
        } catch {
            responseObject(.failure(error))
        }
    }
    
    public func send(request: RequestProvider,
                     keyPath: String? = nil,
                     responseArray: @escaping (Result<[Item], Error>) -> Void)
    {
        do {
            try send(request).responseArray(keyPath: keyPath) { (response: AFDataResponse<[Item]>) -> Void in
                responseArray(self.handler.handle(response))
            }
        } catch {
            responseArray(.failure(error))
        }
    }
}
