//
//  Resource.swift
//  PropellerNetwork
//
//  Created by Roy McKenzie on 1/18/17.
//  Copyright © 2017 Propeller. All rights reserved.
//

import Foundation

public typealias JSONObject = [String: Any]
public typealias Parameters = [String: Any]

/// HTTP method mapping for`Resource` and `URLRequest` objects
public enum HTTPMethod: String {
    case get
    case delete
    case patch
    case post
    case put
}

/// Resource is analagous to an endpoint
public struct Resource<A> {
    
    let configuration: WebServiceConfiguration
    /// Resource API endpoint URL path
    let urlPath: String
    /// Method (post, get, etc.)
    let method: HTTPMethod
    /// Parameters for request body
    let parameters: Parameters?
    /// Additional headers for request
    let headers: [String: String]?
    /// Parameter encoding
    let encoding: ParameterEncoding
    /// Parse
    let parsing: ((Any) throws -> A?)?

    
    /// Initializer with some common default values
    public init(configuration: WebServiceConfiguration,
         urlPath: String,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         headers: [String: String]? = nil,
         encoding: ParameterEncoding = JSONEncoder.default,
         parsing: ((Any) throws -> A?)? = nil) {
        
        self.configuration = configuration
        self.urlPath    = urlPath
        self.method     = method
        self.parameters = parameters
        self.headers    = headers
        self.encoding   = encoding
        self.parsing    = parsing
    }
}

// MARK:- CustomStringConvertible
extension Resource: CustomStringConvertible {
    
    /// Description of resource
    public var description: String {
        return "\(method.rawValue) to \(urlPath)"
    }
}
