//
//  OshiRegisterView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI
import SwiftData
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
                VStack(spacing: AppSpacing.xxl) {
                    // プレビュー
                    VStack(spacing: AppSpacing.lg) {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: AppShape.cornerRadiusLg))
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppShape.cornerRadiusLg)
                                        .stroke(AppColors.primary, lineWidth: 3)
                                )
                        } else {
                            Image(systemName: selectedIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(AppColors.primary)
                                .padding(AppSpacing.lg)
                                .background(
                                    RoundedRectangle(cornerRadius: AppShape.cornerRadiusLg)
                                        .fill(AppColors.primaryLight)
                                )
                        }

                        Text(oshiName.isEmpty ? "推し名を入力してください" : oshiName)
                            .font(AppTypography.title2())
                            .foregroundColor(oshiName.isEmpty ? AppColors.textSecondary : AppColors.textPrimary)
                    }
                    .padding(.top, AppSpacing.xxl)

                    // 名前入力
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                        Text("推しの名前")
                            .font(AppTypography.headline())
                            .foregroundColor(AppColors.textSecondary)

                        DSTextField("例：〇〇ちゃん", text: $oshiName, icon: "person.fill")
                    }
                    .padding(.horizontal, AppSpacing.lg)

                    // 画像選択モード切り替え
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                        Text("画像の選択方法")
                            .font(AppTypography.headline())
                            .foregroundColor(AppColors.textSecondary)

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
                    .padding(.horizontal, AppSpacing.lg)

                    // 写真選択
                    if imageSelectionMode == .photo {
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            PhotosPicker(selection: $selectedImageItem, matching: .images) {
                                HStack {
                                    Image(systemName: "photo.on.rectangle")
                                        .font(AppTypography.title2())
                                    Text("写真を選択")
                                        .font(AppTypography.headline())
                                }
                                .frame(maxWidth: .infinity)
                                .padding(AppSpacing.lg)
                                .background(AppColors.primaryLight)
                                .foregroundColor(AppColors.primary)
                                .cornerRadius(AppShape.cornerRadiusMd)
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
                        .padding(.horizontal, AppSpacing.lg)
                    }

                    // アイコン選択
                    if imageSelectionMode == .icon {
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            Text("アイコンを選択")
                                .font(AppTypography.headline())
                                .foregroundColor(AppColors.textSecondary)

                            LazyVGrid(
                                columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ],
                                spacing: AppSpacing.lg
                            ) {
                                ForEach(iconOptions, id: \.self) { icon in
                                    Button(action: {
                                        selectedIcon = icon
                                    }) {
                                        Image(systemName: icon)
                                            .font(.system(size: 32))
                                            .foregroundColor(selectedIcon == icon ? AppColors.textWhite : AppColors.primary)
                                            .frame(width: 70, height: 70)
                                            .background(
                                                RoundedRectangle(cornerRadius: AppShape.cornerRadiusMd)
                                                    .fill(selectedIcon == icon ? AppColors.primary : AppColors.primaryLight)
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, AppSpacing.lg)
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
    @Previewable @State var container: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Oshi.self, configurations: config)
        return container
    }()

    @Previewable @State var store: AppStore = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Oshi.self, configurations: config)
        return AppStore(modelContext: ModelContext(container))
    }()

    OshiRegisterView()
        .environmentObject(store)
        .modelContainer(container)
}
