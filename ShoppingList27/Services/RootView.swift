//
//  RootView.swift
//  ShoppingList27
//
//  Created by Алина on 16.09.2025.
//

import SwiftUI

struct RootView: View {

	@State private var router = NavigationRouter()
	@State private var isEditing = false
	@State private var isCreatingNewList = false
	@Binding var hasCompletedOnboarding: Bool

	init(hasCompletedOnboarding: Binding<Bool>) {
		_hasCompletedOnboarding = hasCompletedOnboarding
		let initialRouter = NavigationRouter()
		initialRouter.root = hasCompletedOnboarding.wrappedValue ? .listMain : .welcome
		_router = State(initialValue: initialRouter)
	}

	var body: some View {
		NavigationStack(path: $router.navigationPath) {
			getScreen(for: router.root)
				.navigationDestination(for: NavigationRouter.Route.self) { route in
					getScreen(for: route)
				}
		}
		.sheet(item: $router.presentingSheet) { route in
			getScreen(for: route)
		}
		.fullScreenCover(item: $router.presentingFullScreen) { route in
			getScreen(for: route)
		}
		.environment(router)
		.onChange(of: hasCompletedOnboarding) { _, newValue in
			if newValue && router.root == .welcome {
				router.root = .listMain
				router.popToRoot()
			}
		}
	}

	@ViewBuilder
	private func getScreen(for route: NavigationRouter.Route) -> some View {
		switch route {
		case .welcome:
				WelcomeScreenView(hasCompletedOnboarding: $hasCompletedOnboarding)
		case .listMain:
				ListsMainView(viewModel: ListsMainViewModel())
		case .listEditor(let list, let registeredTitles):
				ListEditorView(shoppingList: list, registeredTitles: registeredTitles)
		case .productList(let listItem):
				ProductListView(selectedShoppingList: listItem)
		case .createProduct(let list, let product):
				ProductEditorView(
					product: product, shoppingList: list
				)
		}
	}
}
