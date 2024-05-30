//
//  ParalaxFlowLayout.swift
//  Carousel
//
//  Created by Юрий Мартыненко on 16.05.2024.
//
// Вся магия здесь ))
//

import UIKit


class ParalaxFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        let centerX = collectionView!.contentOffset.x + collectionView!.bounds.width / 2
        
        attributes?.forEach { attr in
            let distance = abs(attr.center.x - centerX)
            let scale = 1 - min(max(distance / collectionView!.bounds.width, 0), 0.75)
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
            attr.alpha = scale
        }
        
        return attributes
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.width, height: collectionView.bounds.height)
        
        guard let attributes = super.layoutAttributesForElements(in: targetRect) else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        let centerX = proposedContentOffset.x + collectionView.bounds.width / 2
        
        var closestAttribute: UICollectionViewLayoutAttributes?
        
        for attribute in attributes {
            if closestAttribute == nil || abs(attribute.center.x - centerX) < abs(closestAttribute!.center.x - centerX) {
                closestAttribute = attribute
            }
        }
        
        guard let closest = closestAttribute else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        let offsetX = closest.center.x - collectionView.bounds.width / 2
        
        return CGPoint(x: offsetX, y: proposedContentOffset.y)
    }
}

