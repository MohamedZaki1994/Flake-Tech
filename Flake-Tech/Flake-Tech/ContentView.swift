//
//  ContentView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 22/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    let landingViewModel = LandingViewModel(router: AppRouter())
    let vm = ViewModelA(activeNavigation: AppRouter())
    var body: some View {
//        ViewA(viewModel: vm)
        LandingContainerView(landingViewModel: landingViewModel)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//////////
protocol Routing {
    associatedtype Route
    associatedtype View: SwiftUI.View
    @ViewBuilder func view(for route: Route) -> Self.View
//    associatedtype ViewModel
//    func didFinish(for: ViewModel)
}

enum AppRoutes {
    case LandingPage
    case login
    case homeDetails
    case topOffers
}

protocol ViewModelProtocol: ObservableObject {
    associatedtype Route
    var activeNavigation: Route? { get set }
    associatedtype view: SwiftUI.View
    @ViewBuilder func navigate() -> Self.view
}
extension ViewModelProtocol {
    func navigate() -> some View {
        Text("please implement navigate func")
    }
}

struct MainAppRouter: Routing {
//    func didFinish(for: ViewModel) {
//
//    }
    func view(for route: AppRoutes) -> some View {
        switch route {
        case .LandingPage:
            Text("landing")
        case .login:
            Text("login")
        case .homeDetails:
            Text("home details")
        case .topOffers:
            Text("top offers")
        }
    }
}


///


enum AppRoute {
    case viewA
    case viewB
}


struct AppRouter: Routing {

    func view(for route: AppRoute) -> some View {
        switch route {
        case .viewA:
            Text("view A")
        case .viewB:
//            ViewB(router: self)
            ViewB(viewModel: ViewModelB(activeNavigation: self))
        }
    }
}

struct ViewA<ViewModel: ViewModelAProtocol>: View {
//    let router: Router
    let viewModel: ViewModel
    @State var shouldNavigate = false
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text("coldy kill them")
                    Text("with hate and rage")
                }
                .onTapGesture {
                    shouldNavigate = true
                }
                NavigationLink(isActive: $shouldNavigate) {
//                    router.view(for: .viewB)
//                    viewModel.activeNavigation.view(for: .viewB)
                    viewModel.navigate()
                } label: {
                    EmptyView()
                }
            }
        }

    }
}

protocol ViewModelBProtocol: ViewModelProtocol {
    var data: [String]? { get }
}

class ViewModelB<Route: Routing>: ViewModelBProtocol {
    var activeNavigation: Route?
    var data: [String]? = ["1"]

    init(activeNavigation: Route) {
        self.activeNavigation = activeNavigation
    }

}

struct ViewB<ViewModel: ViewModelBProtocol>: View {
    let viewModel: ViewModel
    var body: some View {
        Text("There you are\(viewModel.data?.first ?? "")")
    }
}

protocol ViewModelAProtocol: ViewModelProtocol {
//    associatedtype Route
//    var activeNavigation: Route? { get set }
    var data: [String]? { get }
    associatedtype View: SwiftUI.View
    @ViewBuilder func navigate() -> Self.View
}

class ViewModelA<Router: Routing>: ViewModelAProtocol where Router.Route == AppRoute {
    var activeNavigation: Router?
    var data: [String]? = ["1","2","3","4","5","6",]

    init(activeNavigation: Router) {
        self.activeNavigation = activeNavigation
    }

    func navigate() -> some View {
        activeNavigation?.view(for: .viewB)
    }
}
