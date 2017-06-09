//
//  Gagat.swift
//  Gagat
//
//  Created by Tim Andersson on 2017-02-17.
//  Copyright © 2017 Cocoabeans Software. All rights reserved.
//

import Foundation
import UIKit

public protocol GagatStyleable {
	func toggleActiveStyle()
}

public struct Gagat {
	
	public struct Configuration {
		public let jellyFactor: Double

		public init(jellyFactor: Double) {
			self.jellyFactor = jellyFactor
		}

		public static var defaults: Configuration {
			return Configuration(jellyFactor: 1.0)
		}
	}
	
	public struct TransitionHandle {
		private let coordinator: TransitionCoordinator
		
		fileprivate init(coordinator: TransitionCoordinator) {
			self.coordinator = coordinator
		}

		public var panGestureRecognizer: UIPanGestureRecognizer {
			return coordinator.panGestureRecognizer
		}
	}
	
	public static func configure(for window: UIWindow, with styleableObject: GagatStyleable, using configuration: Configuration = .defaults) -> TransitionHandle? {
		let coordinator = TransitionCoordinator(targetView: window, styleableObject: styleableObject, configuration: configuration)
		return TransitionHandle(coordinator: coordinator)
	}
}
