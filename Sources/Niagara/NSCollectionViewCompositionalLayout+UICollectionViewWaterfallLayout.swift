/**
 * Niagara
 * Copyright (c) Luca Meghnagi 2021
 * MIT license, see LICENSE file for details
 */

import Cocoa

public extension NSCollectionViewCompositionalLayout {
    
    static func waterfall(
        columnCount: Int = 2,
        spacing: CGFloat = 8,
        itemSizeProvider: @escaping NSCollectionViewWaterfallLayoutItemSizeProvider
    ) -> NSCollectionViewCompositionalLayout {
        let configuration = NSCollectionLayoutWaterfallConfiguration(
            columnCount: columnCount,
            spacing: spacing,
            itemSizeProvider: itemSizeProvider
        )
        return waterfall(configuration: configuration)
    }
    
    static func waterfall(configuration: NSCollectionLayoutWaterfallConfiguration) -> NSCollectionViewCompositionalLayout {
        
        var numberOfItems: (Int) -> Int = { _ in 0 }
        
        let layout = NSCollectionViewCompositionalLayout { section, environment in
            
            let groupLayoutSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(environment.container.effectiveContentSize.height)
            )
            
            let group = NSCollectionLayoutGroup.custom(layoutSize: groupLayoutSize) { environment in
                let itemProvider = LayoutItemProvider(configuration: configuration, environment: environment)
                var items = [NSCollectionLayoutGroupCustomItem]()
                for i in 0..<numberOfItems(section) {
                    let indexPath = IndexPath(item: i, section: section)
                    let item = itemProvider.item(for: indexPath)
                    items.append(item)
                }
                return items
            }
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
        numberOfItems = { [weak layout] in
            layout?.collectionView?.numberOfItems(inSection: $0) ?? 0
        }
        
        return layout
    }
}
