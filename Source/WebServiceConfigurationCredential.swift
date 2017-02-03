//
//  WebServiceConfigurationCredential.swift
//  PropellerNetwork
//
//  Created by Roy McKenzie on 1/23/17.
//  Copyright © 2017 Propeller. All rights reserved.
//

import Foundation

private let APICredentialsAccessTokenKey = "APICredentialsAccessTokenKey"
public struct WebServiceConfigurationCredential {
    /// The key for the authorization header
    public let authHeaderKey: String
    
    /// Access token for resource
    public var authAccessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: APICredentialsAccessTokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: APICredentialsAccessTokenKey)
        }
    }
}
