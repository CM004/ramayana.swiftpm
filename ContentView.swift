import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RamayanaViewModel()
    @State private var searchText = ""
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LearnView(viewModel: viewModel, searchText: $searchText)
                .tabItem {
                    Label("Learn", systemImage: "book")
                }
                .tag(0)
            
            PracticeView()
                .tabItem {
                    Label("Practice", systemImage: "pencil")
                }
                .tag(1)
        }
    }
}

// MARK: - Learn View
struct LearnView: View {
    @ObservedObject var viewModel: RamayanaViewModel
    @Binding var searchText: String
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    if let kandas = viewModel.ramayanaData?.kandas {
                        ForEach(kandas) { kanda in
                            KandaView(
                                kanda: kanda,
                                themeColor: viewModel.getKandaColor(kanda.colorTheme)
                            )
                        }
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .navigationTitle("Vālmeeki Rāmāyaṇa")
                .navigationBarTitleDisplayMode(.large)
                
                SearchBar(text: $searchText)
                    .padding()
            }
        }
    }
}

// MARK: - Practice View (Placeholder for now)
struct PracticeView: View {
    var body: some View {
        Text("Practice Mode Coming Soon!")
            .font(.title2)
            .foregroundColor(.gray)
    }
}

// MARK: - Supporting Views
struct KandaView: View {
    let kanda: Kanda
    let themeColor: Color
    @State private var isExpanded = false
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                ForEach(kanda.sargas) { sarga in
                    NavigationLink(destination: SargaDetailView(sarga: sarga)) {
                        VStack(alignment: .leading) {
                            Text("Sarga \(sarga.id)")
                                .font(.headline)
                            Text(sarga.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 8)
                    }
                }
            },
            label: {
                HStack {
                    Rectangle()
                        .fill(themeColor)
                        .frame(width: 4)
                        .cornerRadius(2)
                    
                    VStack(alignment: .leading) {
                        Text(kanda.name)
                            .font(.title2)
                            .bold()
                        Text(kanda.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        )
        .padding(.vertical, 4)
    }
}

struct SargaDetailView: View {
    let sarga: Sarga
    
    var body: some View {
        List(sarga.shlokas) { shloka in
            ShlokaView(shloka: shloka)
        }
        .navigationTitle("Sarga \(sarga.id)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShlokaView: View {
    let shloka: Shloka
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("श्लोक \(shloka.id)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Picker("View", selection: $selectedTab) {
                Text("संस्कृत").tag(0)
                Text("Transliteration").tag(1)
                Text("Meaning").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            switch selectedTab {
            case 0:
                Text(shloka.sanskrit)
                    .font(.system(.body, design: .serif))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(8)
            case 1:
                Text(shloka.romanTransliteration)
                    .font(.system(.body, design: .serif))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            case 2:
                Text(shloka.meaning)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
            default:
                EmptyView()
            }
        }
        .padding()
    }
}

// MARK: - Search Bar
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search Ramayana", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = RamayanaViewModel()
//    @State private var searchText = ""
//    @State private var selectedTab = 0
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            LearnView(viewModel: viewModel, searchText: $searchText)
//                .tabItem {
//                    Label("Learn", systemImage: "book")
//                }
//                .tag(0)
//
//            PracticeView()
//                .tabItem {
//                    Label("Practice", systemImage: "pencil")
//                }
//                .tag(1)
//        }
//    }
//}
//
//// MARK: - Learn View
//struct LearnView: View {
//    @ObservedObject var viewModel: RamayanaViewModel
//    @Binding var searchText: String
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 0) {
//                // Header
//                HStack(spacing: 16) {
//                    Text("Kanda")
//                        .frame(width: 60, alignment: .leading)
//                        .foregroundColor(.secondary)
//                        .font(.subheadline)
//                    Text("Name")
//                        .frame(width: 120, alignment: .leading)
//                        .foregroundColor(.secondary)
//                        .font(.subheadline)
//                    Text("Description")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.secondary)
//                        .font(.subheadline)
//                }
//                .padding(.horizontal)
//                .padding(.vertical, 8)
//                .background(Color(.systemBackground))
//
//                if let kandas = viewModel.ramayanaData?.kandas {
//                    ScrollView {
//                        LazyVStack(spacing: 0) {
//                            ForEach(kandas) { kanda in
//                                KandaView(
//                                    kanda: kanda,
//                                    themeColor: viewModel.getKandaColor(kanda.colorTheme)
//                                )
//                                Divider()
//                            }
//                        }
//                    }
//                } else {
//                    ProgressView()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
//
//                SearchBar(text: $searchText)
//                    .padding()
//            }
//            .navigationTitle("Vālmeeki Rāmāyaṇa")
//            .navigationBarTitleDisplayMode(.large)
//        }
//    }
//}
//
//// MARK: - Practice View (Placeholder for now)
//struct PracticeView: View {
//    var body: some View {
//        Text("Practice Mode Coming Soon!")
//            .font(.title2)
//            .foregroundColor(.gray)
//    }
//}
//
//// MARK: - Supporting Views
//struct KandaView: View {
//    let kanda: Kanda
//    let themeColor: Color
//
//    var body: some View {
//        NavigationLink(destination: SargaListView(kanda: kanda, themeColor: themeColor)) {
//            HStack(spacing: 16) {
//                Text(String(kanda.id))
//                    .frame(width: 60, alignment: .leading)
//                    .foregroundColor(.secondary)
//
//                Text(kanda.name)
//                    .frame(width: 120, alignment: .leading)
//                    .font(.headline)
//                    .foregroundColor(.primary)
//
//                Text(kanda.description)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .foregroundColor(.secondary)
//                    .lineLimit(2)
//            }
//            .padding(.horizontal)
//            .padding(.vertical, 12)
//            .background(Color(.systemBackground))
//        }
//    }
//}
//
//struct SargaListView: View {
//    let kanda: Kanda
//    let themeColor: Color
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header description
//            Text(kanda.description)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(Color(.systemBackground))
//
//            // Table header
//            HStack(spacing: 16) {
//                Text("Sarga")
//                    .frame(width: 60, alignment: .leading)
//                    .foregroundColor(.secondary)
//                    .font(.subheadline)
//                Text("Description")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .foregroundColor(.secondary)
//                    .font(.subheadline)
//                Text("Shlokas")
//                    .frame(width: 80, alignment: .trailing)
//                    .foregroundColor(.secondary)
//                    .font(.subheadline)
//            }
//            .padding(.horizontal)
//            .padding(.vertical, 8)
//            .background(Color(.systemBackground))
//
//            ScrollView {
//                LazyVStack(spacing: 0) {
//                    ForEach(kanda.sargas) { sarga in
//                        NavigationLink(destination: SargaDetailView(sarga: sarga)) {
//                            HStack(spacing: 16) {
//                                Text(String(sarga.id))
//                                    .frame(width: 60, alignment: .leading)
//                                    .foregroundColor(themeColor)
//                                    .font(.headline)
//
//                                Text(sarga.description)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .foregroundColor(.primary)
//                                    .lineLimit(2)
//
//                                Text("\(sarga.shlokaCount)")
//                                    .frame(width: 80, alignment: .trailing)
//                                    .foregroundColor(.secondary)
//                                    .font(.subheadline)
//                            }
//                            .padding(.horizontal)
//                            .padding(.vertical, 12)
//                            .background(Color(.systemBackground))
//                        }
//                        Divider()
//                    }
//                }
//            }
//        }
//        .navigationTitle(kanda.name)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//struct SargaDetailView: View {
//    let sarga: Sarga
//
//    var body: some View {
//        List(sarga.shlokas) { shloka in
//            ShlokaView(shloka: shloka)
//        }
//        .navigationTitle("Sarga \(sarga.id)")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//struct ShlokaView: View {
//    let shloka: Shloka
//    @State private var selectedTab = 0
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("श्लोक \(shloka.id)")
//                .font(.headline)
//                .foregroundColor(.secondary)
//
//            Picker("View", selection: $selectedTab) {
//                Text("संस्कृत").tag(0)
//                Text("Transliteration").tag(1)
//                Text("Meaning").tag(2)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//
//            switch selectedTab {
//            case 0:
//                Text(shloka.sanskrit)
//                    .font(.system(.body, design: .serif))
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .background(Color.orange.opacity(0.1))
//                    .cornerRadius(8)
//            case 1:
//                Text(shloka.romanTransliteration)
//                    .font(.system(.body, design: .serif))
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .background(Color.blue.opacity(0.1))
//                    .cornerRadius(8)
//            case 2:
//                Text(shloka.meaning)
//                    .padding()
//                    .background(Color.green.opacity(0.1))
//                    .cornerRadius(8)
//            default:
//                EmptyView()
//            }
//        }
//        .padding()
//    }
//}
//
//// MARK: - Search Bar
//struct SearchBar: View {
//    @Binding var text: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .foregroundColor(.secondary)
//
//            TextField("Search Ramayana", text: $text)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//        .padding(.horizontal)
//        .background(Color(.systemGray6))
//        .cornerRadius(10)
//    }
//}
//
//// MARK: - Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//

