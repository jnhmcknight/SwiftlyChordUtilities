//
//  LookupView.swift
//  Swiftly Chord Demo
//
//  © 2023 Nick Berendsen
//

import SwiftUI
import SwiftlyChordUtilities

struct LookupView: View {
    /// The name of the chord
    @State private var name: String = "C"
    /// The status of the `View`
    @State private var status: Status = .loading
    /// The chords to show
    @State private var chords: [ChordDefinition] = []
    /// Chords model
    @EnvironmentObject private var model: ChordsModel
    /// Chord Display Options
    @EnvironmentObject private var options: ChordDisplayOptions
    /// The boduy of the `View`
    var body: some View {
        ScrollView {
            Text(Router.lookup.item.description)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding(.top)
            TextField("Name", text: $name, prompt: Text("Name of the chord chord"))
                .frame(maxWidth: 100)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            switch status {
            case .loading:
                ProgressView()
            case .ready:
                Text("let chord = ChordDefinition(name: \"\(name)\", instrument: .\(options.instrument.rawValue))")
                    .fontDesign(.monospaced)
                GridView(chords: chords)
            case .empty:
                Router.lookup.emptyMessage
            }

        }
        .animation(.default, value: status)
        .task(id: name) {
            findChords()
        }
        .task(id: model.chords) {
            findChords()
        }
    }
    /// Find the chords
    private func findChords() {
        if let chord = ChordDefinition(name: name, instrument: options.instrument) {
            chords = model.chords.matching(root: chord.root).matching(quality: chord.quality).matching(bass: chord.bass)
            status = .ready
        } else {
            chords = []
            status = .empty
        }
    }
}
