# macOS 環境から macOS のためにビルドする
swift build --disable-sandbox -c release --arch arm64 --arch x86_64 --product playground

# macOS 環境から Linux のためにビルドする
# IMPORTANT: あらかじめ Swift Open Source Xcode Toolchain をインストールしておく
#            https://download.swift.org/swift-6.0.3-release/xcode/swift-6.0.3-RELEASE/swift-6.0.3-RELEASE-osx.pkg
if ! swift sdk list | grep -q "swift-6.0.3-RELEASE_static-linux-0.0.1"; then
    swift sdk install https://download.swift.org/swift-6.0.3-release/static-sdk/swift-6.0.3-RELEASE/swift-6.0.3-RELEASE_static-linux-0.0.1.artifactbundle.tar.gz --checksum 67f765e0030e661a7450f7e4877cfe008db4f57f177d5a08a6e26fd661cdd0bd
fi
xcrun --toolchain swift swift build --swift-sdk x86_64-swift-linux-musl -c release --product playground

swift package --allow-writing-to-package-directory generate-artifact-bundle \
    --package-version 0.0.1 \
    --executable-name playground \
    --build-folder .build \
    --build-config release
unzip playground.artifactbundle.zip
rm playground.artifactbundle.zip
