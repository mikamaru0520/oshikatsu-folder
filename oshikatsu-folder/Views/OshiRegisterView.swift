//
//  OshiRegisterView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI
import PhotosUI

/// 推し登録画面
struct OshiRegisterView: View {
    @EnvironmentObject var store: AppStore
    @Environment(\.dismiss) private var dismiss

    @State private var oshiName: String = ""
    @State private var selectedIcon: String = "star.fill"
    @State private var selectedImageItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var imageSelectionMode: ImageSelectionMode = .photo

    enum ImageSelectionMode {
        case icon
        case photo
    }

    // 選択可能なアイコンリスト
    private let iconOptions = [
        "star.fill",
        "heart.fill",
        "sparkles",
        "flame.fill",
        "bolt.fill",
        "moon.stars.fill",
        "sun.max.fill",
        "cloud.fill"
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    // プレビュー
                    VStack(spacing: 16) {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.pink, lineWidth: 3)
                                )
                        } else {
                            Image(systemName: selectedIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.pink)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.pink.opacity(0.1))
                                )
                        }

                        Text(oshiName.isEmpty ? "推し名を入力してください" : oshiName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(oshiName.isEmpty ? .gray : .primary)
                    }
                    .padding(.top, 32)

                    // 名前入力
                    VStack(alignment: .leading, spacing: 12) {
                        Text("推しの名前")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        TextField("例：〇〇ちゃん", text: $oshiName)
                            .textFieldStyle(.roundedBorder)
                            .font(.body)
                    }
                    .padding(.horizontal)

                    // 画像選択モード切り替え
                    VStack(alignment: .leading, spacing: 12) {
                        Text("画像の選択方法")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Picker("画像選択", selection: $imageSelectionMode) {
                            Text("写真から選択").tag(ImageSelectionMode.photo)
                            Text("アイコンから選択").tag(ImageSelectionMode.icon)
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: imageSelectionMode) { oldValue, newValue in
                            if newValue == .icon {
                                selectedImage = nil
                                selectedImageItem = nil
                            }
                        }
                    }
                    .padding(.horizontal)

                    // 写真選択
                    if imageSelectionMode == .photo {
                        VStack(alignment: .leading, spacing: 12) {
                            PhotosPicker(selection: $selectedImageItem, matching: .images) {
                                HStack {
                                    Image(systemName: "photo.on.rectangle")
                                        .font(.title2)
                                    Text("写真を選択")
                                        .font(.headline)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.pink.opacity(0.1))
                                .foregroundColor(.pink)
                                .cornerRadius(12)
                            }
                            .onChange(of: selectedImageItem) { oldValue, newValue in
                                Task {
                                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        selectedImage = uiImage
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // アイコン選択
                    if imageSelectionMode == .icon {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("アイコンを選択")
                                .font(.headline)
                                .foregroundColor(.secondary)

                            LazyVGrid(
                                columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ],
                                spacing: 16
                            ) {
                                ForEach(iconOptions, id: \.self) { icon in
                                    Button(action: {
                                        selectedIcon = icon
                                    }) {
                                        Image(systemName: icon)
                                            .font(.system(size: 32))
                                            .foregroundColor(selectedIcon == icon ? .white : .pink)
                                            .frame(width: 70, height: 70)
                                            .background(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .fill(selectedIcon == icon ? Color.pink : Color.pink.opacity(0.1))
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 100)
                }
            }
            .navigationTitle("推しを登録")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        saveOshi()
                    }
                    .disabled(oshiName.isEmpty || (imageSelectionMode == .photo && selectedImage == nil))
                    .fontWeight(.bold)
                }
            }
        }
    }

    private func saveOshi() {
        if imageSelectionMode == .photo, let image = selectedImage {
            // 画像を保存してファイル名を取得
            if let fileName = ImageManager.saveImage(image) {
                store.send(.addOshi(name: oshiName, mainImageName: fileName, imageType: .photo))
            }
        } else {
            // アイコンを使用
            store.send(.addOshi(name: oshiName, mainImageName: selectedIcon, imageType: .icon))
        }
        dismiss()
    }
}

#Preview {
    OshiRegisterView()
        .environmentObject(AppStore(initialState: AppState.preview))
}
