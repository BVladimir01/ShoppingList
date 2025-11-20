//
//  ShoppingList27App.swift
//  ShoppingList27
//
//  Created by Nikita Tsomuk on 01.09.2025.
//

import SwiftUI
import SwiftData

// MARK: - ShoppingList27App

@main
struct ShoppingList27App: App {
	@AppStorage("hasCompleteOnboarding") private var hasCompleteOnboarding = false
	@AppStorage("ThemeType") private var selectedThemeType: ThemeType = .system
	@StateObject private var listsMainVM = ListsMainViewModel()

	var body: some Scene {
		WindowGroup {
			RootView(hasCompletedOnboarding: $hasCompleteOnboarding)
				.preferredColorScheme(
					selectedThemeType == .system
					? nil
					: (selectedThemeType == .light ? .light : .dark)
				)
		}
		.modelContainer(for: [ShoppingList.self, Product.self])
	}
}

enum ThemeType: String, CaseIterable {
	case system, dark, light
}
