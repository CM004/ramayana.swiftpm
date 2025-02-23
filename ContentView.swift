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
    
    var body: some View {
        NavigationLink(destination: SargaListView(kanda: kanda, themeColor: themeColor)) {
            HStack {
                Rectangle()
                    .fill(themeColor)
                    .frame(width: 4)
                    .cornerRadius(2)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(kanda.name)
                            .font(.title2)
                            .bold()
                        
                        Text("\(kanda.sargas.count) Sargas")
                            .font(.subheadline)
                            .foregroundColor(themeColor)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(themeColor.opacity(0.1))
                            .cornerRadius(8)
                    }
                    
                    Text(kanda.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
    }
}

struct SargaListView: View {
    let kanda: Kanda
    let themeColor: Color
    
    var body: some View {
        List {
            ForEach(kanda.sargas) { sarga in
                NavigationLink(destination: SargaDetailView(sarga: sarga)) {
                    HStack {
                        Rectangle()
                            .fill(themeColor)
                            .frame(width: 4)
                            .cornerRadius(2)
                        
                        VStack(alignment: .leading) {
                            Text("Sarga \(sarga.id)")
                                .font(.headline)
                            Text(sarga.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle(kanda.name)
        .navigationBarTitleDisplayMode(.inline)
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
        HStack(alignment: .top, spacing: 16) {
                    // Verse number in circle
                    ZStack {
                        Circle()
                            .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                            .frame(width: 35, height: 35)
                        Text(shloka.id)
                            .font(.footnote)
                            .background(Color.orange.opacity(0.1))
                            .foregroundColor(.orange)
                    }
                    
            VStack(alignment: .leading, spacing: 16) {
                        // Sanskrit Text
                        Text(shloka.sanskrit)
                    .font(.headline)
                            .multilineTextAlignment(.center)
                            .background(Color.orange.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .padding()
                
                        
                        // Transliteration
                        Text(shloka.romanTransliteration)
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Meaning
                        Text(shloka.meaning)
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    // More options button
                    Button(action: {
                        // Add action for more options
                    }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                Divider()
            }
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
