# 📖 Ramayana App – Swift Student Challenge

A beautifully crafted iOS app that brings the ancient Indian epic **Vālmīki Rāmāyaṇa** to life in a clean, interactive, and educational format. Built using SwiftUI and MVVM architecture, this app offers a structured, scrollable experience through the Kandās, Sargas, and Shlokas — complete with Sanskrit, transliteration, and English meanings.

---

## ✨ Features

- 📚 **Explore Ramayana Kandās**  
  Browse through each Kandā and its Sargas with clear descriptions and themed visuals.

- 🕉️ **View Shlokas in Detail**  
  Each Shloka is presented with:
  - **Sanskrit text**
  - **Roman transliteration**
  - **English meaning**

- 🔍 **Built-in Search**  
  Quickly find Sargas or topics with a search bar.

- 📐 **MVVM Architecture**  
  Clean, scalable project structure using `@StateObject` and `ObservableObject`.

- 🧘 **Practice Mode (Coming Soon)**  
  A placeholder for engaging exercises or quizzes on Ramayana content.

---

## 🛠️ Tech Stack

- `SwiftUI` – declarative UI framework
- `MVVM` – architecture pattern
- `Codable` – for JSON decoding
- `NavigationView`, `TabView`, `List`, `Picker`, `Binding` – SwiftUI components
- `@State`, `@StateObject`, `@Binding`, `@ObservedObject` – reactive data binding

---

## 📂 Project Structure

📁 RamayanaApp
├── ContentView.swift       # Main entry with TabView
├── LearnView.swift         # Kandā list & navigation
├── SargaListView.swift     # Shows Sargas in each Kandā
├── SargaDetailView.swift   # Displays all Shlokas in selected Sarga
├── ShlokaView.swift        # View showing Sanskrit, transliteration, meaning
├── SearchBar.swift         # Reusable search component
├── Models/
│   ├── Kanda.swift
│   ├── Sarga.swift
│   └── Shloka.swift
├── ViewModel/
│   └── RamayanaViewModel.swift
└── Data/
└── ramayana.json

---

## 🚀 Getting Started

1. Clone the repo  
   `git clone https://github.com/yourusername/ramayana-app.git`
2. Open in Xcode (15+)
3. Build & run on any iOS Simulator (iOS 16+ recommended)

---

## 💡 Future Enhancements

- Add **Practice Mode quizzes** based on Shlokas
- Integrate **audio playback** of Sanskrit verses
- Allow **favorites/bookmarks**
- Add **sharing feature** for inspirational Shlokas

---

## 📜 Acknowledgements

- Data sourced from [Valmiki Ramayana – IITK](https://www.valmiki.iitk.ac.in)
- Inspired by India’s timeless literary heritage

---

## 🙌 Contribution

This app was submitted as part of the **Swift Student Challenge**. Feedback and collaboration are always welcome!

---

## 📘 License

This project is open source and available under the [MIT License](LICENSE).
