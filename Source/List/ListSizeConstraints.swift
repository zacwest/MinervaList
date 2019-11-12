//
//  ListSizeConstraints.swift
//  Minerva
//
//  Copyright © 2019 Optimize Fitness, Inc. All rights reserved.
//

import Foundation
import UIKit

/// Sizing information to help size individual cells.
public struct ListSizeConstraints: Hashable {

	/// The overall size for the container the cell is in.
	public let containerSize: CGSize
	/// The constraints for the section containing the model.
	public let sectionConstraints: ListSection.Constraints

	/// Sizing information to help size individual cells.
	/// - Parameter containerSize: The overall size for the container the cell is in.
	/// - Parameter sectionConstraints: The constraints for the section containing the model.
	public init(
		containerSize: CGSize,
		sectionConstraints: ListSection.Constraints
	) {
		self.containerSize = containerSize
		self.sectionConstraints = sectionConstraints
	}

	/// The container size adjusted for the insets, distribution, minimumInteritemSpacing, and scroll direction.
	public var adjustedContainerSize: CGSize {
		let insetSize = containerSize.adjust(for: inset)
		guard case .equally(let cellsInRow) = distribution else {
			return insetSize
		}
		let rowWidth = insetSize.width
		let rowHeight = insetSize.height
		let maxSize: CGSize
		if scrollDirection == .vertical {
			let equalCellWidth = (rowWidth / CGFloat(cellsInRow))
				- (minimumInteritemSpacing * CGFloat(cellsInRow - 1) / CGFloat(cellsInRow))
			maxSize = CGSize(width: equalCellWidth, height: rowHeight)
		} else {
			let equalCellHeight = (rowHeight / CGFloat(cellsInRow))
				- (minimumInteritemSpacing * CGFloat(cellsInRow - 1) / CGFloat(cellsInRow))
			maxSize = CGSize(width: rowWidth, height: equalCellHeight)
		}
		return maxSize
	}

	public var inset: UIEdgeInsets {
		return sectionConstraints.inset
	}
	public var minimumLineSpacing: CGFloat {
		return sectionConstraints.minimumLineSpacing
	}
	public var minimumInteritemSpacing: CGFloat {
		return sectionConstraints.minimumInteritemSpacing
	}
	public var distribution: ListSection.Distribution {
		return sectionConstraints.distribution
	}
	public var scrollDirection: UICollectionView.ScrollDirection {
		return sectionConstraints.scrollDirection
	}
}
