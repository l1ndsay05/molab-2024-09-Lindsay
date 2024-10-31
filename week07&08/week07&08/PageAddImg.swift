import SwiftUI
import PhotosUI

struct PageAddImg: View {
    @EnvironmentObject var colorModel: ColorModel

    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var layoutConfig = LayoutConfig()

    var body: some View {
        VStack {
            PhotosPicker("Select Photo", selection: $avatarItem, matching: .images)
                .padding()
            
            ZStack {
                if let avatarImage = avatarImage {
                    avatarImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .overlay(
                            GeometryReader { geometry in
                                let width = geometry.size.width
                                let height = geometry.size.height
                                
                                // Calculate circle size and position based on layout configuration
                                let circleSize: CGFloat = min(width / CGFloat(layoutConfig.columns), height / CGFloat(layoutConfig.rows)) - 5
                                
                                VStack(spacing: 5) {
                                    ForEach(0..<layoutConfig.rows, id: \.self) { _ in
                                        HStack(spacing: 5) {
                                            ForEach(0..<layoutConfig.columns, id: \.self) { _ in
                                                Circle()
                                                    .fill(colorModel.rgbColor)
                                                    .frame(width: circleSize, height: circleSize)
                                            }
                                        }
                                    }
                                }
                                .frame(width: width, height: height)
                            }
                        )
                } else {
                    Text("No image selected")
                        .foregroundColor(.gray)
                        .frame(width: 300, height: 300)
                        .border(Color.gray, width: 1)
                }
            }
        }
        .frame(width: 400, height: 500, alignment: .center)
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    avatarImage = Image(uiImage: uiImage)
                    // Update layout configuration randomly each time a new image is selected
                    layoutConfig = LayoutConfig()
                } else {
                    print("Failed to load image")
                }
            }
        }
    }
}

struct LayoutConfig {
    let rows: Int
    let columns: Int

    init() {
        // Randomly generate rows and columns for each new image
        self.rows = Int.random(in: 3...6)
        self.columns = Int.random(in: 4...8)
    }
}

struct PageAddImg_Previews: PreviewProvider {
    static var previews: some View {
        PageAddImg()
            .environmentObject(ColorModel())
    }
}
