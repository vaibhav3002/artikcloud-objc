#
# Be sure to run `pod lib lint ArtikCloud.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guidespec.cocoapodspec.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
    spec.name             = "ArtikCloud"
    spec.version          = "2.0.0"

    spec.summary          = "Artik Cloud client library."
    spec.description      = "A REST and WebSocket client library for the Artik Cloud"

    spec.platform     = :ios, '7.0'
    spec.requires_arc = true

    spec.framework    = 'SystemConfiguration'

    spec.homepage     = "https://github.com/artikcloud/artikcloud-objc"
    spec.license      = "MIT"
    spec.source       = { :git => "https://github.com/artikcloud/artikcloud-objc.git", :tag => "#{spec.version}" }
    spec.author       = { "Samsung ArtikCloud" => "support@ssi.samsung.com" }

    spec.source_files = 'ArtikCloud/**/*'
    spec.public_header_files = 'ArtikCloud/**/*.h'

    spec.dependency 'AFNetworking', '~> 2.3'
    spec.dependency 'JSONModel', '~> 1.1'
    spec.dependency 'ISO8601', '~> 0.3'
    spec.dependency 'SocketRocket', '~> 0.5.0'
end
