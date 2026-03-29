//
//  ImageManager.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import UIKit

/// 画像の保存・読み込みを管理するヘルパー
struct ImageManager {

    /// Documents directoryのパスを取得
    static var documentsDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    /// 画像を保存してファイル名を返す
    static func saveImage(_ image: UIImage) -> String? {
        // ファイル名を生成（UUID + .jpg）
        let fileName = "\(UUID().uuidString).jpg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        // UIImageをJPEGデータに変換
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }

        // ファイルに書き込み
        do {
            try imageData.write(to: fileURL)
            return fileName
        } catch {
            print("画像の保存に失敗: \(error)")
            return nil
        }
    }

    /// ファイル名から画像を読み込む
    static func loadImage(fileName: String) -> UIImage? {
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        // ファイルからデータを読み込み
        guard let imageData = try? Data(contentsOf: fileURL) else {
            return nil
        }

        return UIImage(data: imageData)
    }

    /// 画像ファイルを削除
    static func deleteImage(fileName: String) {
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("画像の削除に失敗: \(error)")
        }
    }
}
