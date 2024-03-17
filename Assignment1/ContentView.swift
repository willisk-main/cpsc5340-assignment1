import SwiftUI

// EmojiCounterViewModel class; counter logic/state
class EmojiCounterViewModel: ObservableObject {
    // @Published auto updates view for any count change
    @Published var count: Int
    
    // initialCount == starting count
    init(initialCount: Int) {
        self.count = initialCount
    }
    
    /* counter functions */
    
    // increases the counter
    func increase() {
        count += 1
    }
    
    // decreases the counter
    func decrease() {
        count -= 1
    }
}

// ContentView defines UI
struct ContentView: View {
    
    /* View models with emoji counter for each respective emoji */
    
    // tilt_Laugh_Cry_Emoji
     @StateObject var tilt_Laugh_Cry_Emoji = EmojiCounterViewModel(initialCount: 0)
     // wink_Eye_Emoji
     @StateObject var wink_Eye_Emoji = EmojiCounterViewModel(initialCount: 0)
     // straight_Smile_Emoji
     @StateObject var straight_Smile_Emoji = EmojiCounterViewModel(initialCount: 0)
     // star_Eyed_Emoji
     @StateObject var star_Eyed_Emoji = EmojiCounterViewModel(initialCount: 0)
     // straight_Laugh_Cry_Emoji
     @StateObject var straight_Laugh_Cry_Emoji = EmojiCounterViewModel(initialCount: 0)
     
    // view content/layout
    var body: some View {
        
      // NavigationView title display
      NavigationView {
        
      // vertical stack for row layout
      VStack(spacing: 6) {
            
                /* emojiRows */
                
                // tilt_Laugh_Cry
                emojiRow(emoji: "🤣", viewModel: tilt_Laugh_Cry_Emoji)
                // wink_Eye_Emoji
                emojiRow(emoji: "😜", viewModel: wink_Eye_Emoji)
                // straight_Smile_Emoji
                emojiRow(emoji: "😄", viewModel: straight_Smile_Emoji)
                // star_Eyed_Emoji
                emojiRow(emoji: "🤩", viewModel: star_Eyed_Emoji)
                // straight_Laugh_Cry_Emoji
                emojiRow(emoji: "😂", viewModel: straight_Laugh_Cry_Emoji)
                 
                // push towards top
                Spacer()
            }
            
            // background below navigationBar; white
            .background(Color(.white))
          
            // navigationBar background; white
            .toolbarBackground(
                           Color.white,
                           for: .navigationBar)
                       .toolbarBackground(.visible, for: .navigationBar)
       
            
            // "Emoji Counter" centered; font title size & bold
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Emoji Counter")
                        .font(.title.bold())
                }
            }
        }
    }
    
// individual emojiRow viewModel
func emojiRow(emoji: String, viewModel: EmojiCounterViewModel) -> some View {
        
        // horizontal stack rows layout
        HStack {
            
            // display emoji
            Text(emoji)
                .font(.system(size: 20))
            
            // push content
            Spacer()
            
            // Display the counter value
            Text("Counter: \(viewModel.count)")
                .font(.title2)
                .foregroundColor(.red) // Set text color to red.
            
            Spacer()
            
            // + button increases the counter
            Button(action: {
                viewModel.increase()
            }) {
                // (+)  red foreground/outline; white background; rounded rectangle
                Text("+")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.red, lineWidth: 1.25))
            }
            
            // Minus (-) button to decrement the counter.
            Button(action: {
                viewModel.decrease()
            }) {
                // (-) red foreground/outline; white background; rounded rectangle
                Text("-")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.red, lineWidth: 1.25))
            }
        }
    
        // gray border
        .border(Color.gray, width: 0.25)
        
        // Hstack padding
        .padding(.horizontal)
        
        // fixed row height & width
        .frame(height: 55)
        
        // light gray background
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
    }
}

// ContentView preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
/* Original ContentView contents below
 
 import SwiftUI
 
    struct ContentView: View {
        var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
*/
