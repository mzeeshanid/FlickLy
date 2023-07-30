//
//  AppConfiguration.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation

class AppConfiguration {
    static var environment: AppEnvironment = {
        var envName: String? = nil
        
        #if App_Env_Dev
            envName = AppEnvironment.dev.rawValue
        #endif
        
        var env = AppEnvironment.prod
        
        if let environment = AppEnvironment(rawValue: envName ?? "") {
            env = environment
        }
        
        AppConfiguration.setUpCommonDependencies()
        
        return env
    }()
    
    private static func setUpCommonDependencies() {
        
    }
}
