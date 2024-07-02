//
//  LoginEndPoint.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//


import Foundation

enum LoginEndPoint {
    case login
}

// https://fakestoreapi.com/Login
extension LoginEndPoint: EndPointType {

    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }

    var baseURL: String {
        switch self {
        case .login:
            return ""
        }
    }

    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }

    var method: HTTPMethods {
        switch self {
        case .login:
            return .get
        }
    }

    var body: Encodable? {
        switch self {
        case .login:
            return nil
        }
    }

    var headers: [String : String]? {
        APIManager.commonHeaders
    }
}
