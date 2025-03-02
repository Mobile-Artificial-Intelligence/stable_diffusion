#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sdcpp.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'sdcpp'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'https://github.com/Mobile-Artificial-Intelligence/sdcpp'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.dependency 'FlutterMacOS'
  s.swift_version = '5.0'


  s.prepare_command = <<-CMD
    set -e
    set -u
    set -o pipefail

    SOURCE_DIR="../src/stable_diffusion"
    TARGET_DIR="./stable_diffusion"

    # Ensure source directory exists
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "Source directory $SOURCE_DIR does not exist. Exiting."
        exit 1
    fi

    # Remove existing target directory if it exists
    if [ -d "$TARGET_DIR" ]; then
        echo "Removing existing target directory $TARGET_DIR..."
        rm -rf "$TARGET_DIR"
    fi

    # Copy source to target
    echo "Copying $SOURCE_DIR to $TARGET_DIR..."
    cp -R "$SOURCE_DIR" "$TARGET_DIR"

    echo "Copy completed successfully."
  CMD

  s.source           = { :path => '.' }
  s.source_files = 'stable_diffusion/*.cpp',
                   'stable_diffusion/thirdparty/*.c',
                   'stable_diffusion/ggml/src/*.c',
                   'stable_diffusion/ggml/src/*.cpp',
                   'stable_diffusion/ggml/src/ggml-cpu/*.c',
                   'stable_diffusion/ggml/src/ggml-cpu/*.cpp',
                   'stable_diffusion/ggml/src/ggml-metal/*.m',

  s.frameworks = 'Foundation', 'Metal', 'MetalKit'
  s.platform = :osx, '10.15'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'USER_HEADER_SEARCH_PATHS' => [
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/thirdparty',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/include',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/src',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/src/ggml-cpu',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/src/ggml-metal',
    ],
    'HEADER_SEARCH_PATHS' => [
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/thirdparty',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/include',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/src',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/src/ggml-cpu',
      '$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/src/ggml-metal',
    ],
    'OTHER_CFLAGS' => ['$(inherited)', '-O3', '-flto', '-fno-objc-arc', '-w', '-I$(PODS_TARGET_SRCROOT)/stable_diffusion', '-I$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/include', '-DGGML_LLAMAFILE=OFF', '-DGGML_USE_CPU'],
    'OTHER_CPLUSPLUSFLAGS' => ['$(inherited)', '-O3', '-flto', '-fno-objc-arc', '-w', '-std=c++17', '-fpermissive', '-I$(PODS_TARGET_SRCROOT)/stable_diffusion', '-I$(PODS_TARGET_SRCROOT)/stable_diffusion/ggml/include', '-DGGML_LLAMAFILE=OFF', '-DGGML_USE_CPU'],
    'GCC_PREPROCESSOR_DEFINITIONS' => ['$(inherited)', 'GGML_USE_METAL=1'],
  }
end
