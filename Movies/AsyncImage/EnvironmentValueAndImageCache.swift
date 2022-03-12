//
//  EnvironmentValueAndImageCache.swift
//  Movies
//
//  Created by LiewSyetChau on 4/3/22.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TempImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get{
            self[ImageCacheKey.self]
        }
        set {
            self[ImageCacheKey.self] = newValue
        }
    }
}
