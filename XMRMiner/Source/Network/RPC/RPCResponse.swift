//
//  RPCResponse.swift
//  CocoaAsyncSocket
//
//  Created by Nick Lee on 10/9/17.
//

import Foundation
import ObjectMapper

final class RPCResponse: RPCObject {
    
    // MARK: Types
    
    enum Result {
        case error(value: Any)
        case success(value: Any)
        case none
    }
    
    // MARK: Properties
    
    private(set) var id: Int = 0
    private(set) var result: Result = .none
 
    // MARK: Initialization
    
    required init?(map: Map) {
        guard map["error"].currentValue != nil || map["result"].currentValue != nil else { return nil }
        super.init(map: map)
    }

    // MARK: Mapping
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        var error: Any?
        error <- map["error"]
        
        if let error = error {
            result = .error(value: error)
        }
        else if let jsResult = map.JSON["result"] {
            result = .success(value: jsResult)
        }
    }
    
}
