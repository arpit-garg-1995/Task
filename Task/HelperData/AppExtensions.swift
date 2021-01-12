//
//  AppExtensions.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


// localization extension

let AppLanguageKey = "AppLanguage"
let AppLanguageDefaultValue = "en"

var appLanguage: String {
    
    get {
        if let language = UserDefaults.standard.string(forKey: AppLanguageKey) {
            return language
        } else {
            UserDefaults.standard.setValue(AppLanguageDefaultValue, forKey: AppLanguageKey)
            return AppLanguageDefaultValue
        }
    }
    
    set(value) {
        UserDefaults.standard.setValue((value), forKey: AppLanguageKey)
    }
    
}

extension String {
    
    var localized: String {
        return localized(lang1: appLanguage)
    }
    
    var localizeStringUsingSystemLang: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(lang1: String?) -> String {
        
        if let lang = lang1 {
            if let path = Bundle.main.path(forResource: lang, ofType: "lproj") {
                let bundle = Bundle(path: path)
                return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
            }
            
        }
        
        return localizeStringUsingSystemLang
    }
}

extension UIImageView {
    
    func setImage(imageUrl: String ) {
        //        ImageCache.default.calculateDiskCacheSize { size in
        //            print("Used disk size by bytes: \(size/(1024*1024))")
        //        }
        ImageCache.default.maxDiskCacheSize = 30 * 1024 * 1024
        
        if URL(string: imageUrl) != nil && imageUrl.count > 0 {
            let resource = ImageResource(downloadURL: URL(string: imageUrl)!, cacheKey: imageUrl)
            self.contentMode = .scaleAspectFit
            self.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        } else {
            self.image = UIImage(named: "placeholder")
        }
    }
}

