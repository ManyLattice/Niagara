/**
 * Niagara
 * Copyright (c) Luca Meghnagi 2021
 * MIT license, see LICENSE file for details
 */

import Cocoa

public struct NSCollectionLayoutWaterfallConfiguration {
    
    public var columnCount: Int
    
    public var spacing: CGFloat
    
    public var itemSizeProvider: NSCollectionViewWaterfallLayoutItemSizeProvider
        
    public init(
        columnCount: Int = 2,
        spacing: CGFloat = 8,
        itemSizeProvider: @escaping NSCollectionViewWaterfallLayoutItemSizeProvider
    ) {
        self.columnCount = columnCount
        self.spacing = spacing
        self.itemSizeProvider = itemSizeProvider
    }
}
