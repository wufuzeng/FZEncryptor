#
# Be sure to run `pod lib lint FZEncryptor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FZEncryptor'
  s.version          = '0.0.1'
  s.summary          = 'A short description of FZEncryptor.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wufuzeng/FZEncryptor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wufuzeng' => 'wufuzeng_lucky@sina.com' }
  s.source           = { :git => 'https://github.com/wufuzeng/FZEncryptor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'FZEncryptor/Classes/FZEncryptor.h'
  s.source_files =  'FZEncryptor/Classes/FZEncryptor.h'
  #s.source_files = 'FZEncryptor/Classes/**/*.{h,m}'


#----------- 文件分级 ------------#

s.subspec 'FZURLEncryptor' do |ss|
    ss.source_files = 'FZEncryptor/Classes/FZURLEncryptor/*'
    ss.public_header_files = 'FZEncryptor/Classes/FZURLEncryptor/*.h'
end

s.subspec 'FZBASE64Encryptor' do |ss|
    ss.source_files = 'FZEncryptor/Classes/FZBASE64Encryptor/*'
    ss.public_header_files = 'FZEncryptor/Classes/FZBASE64Encryptor/*.h'
end

s.subspec 'FZMD5Encryptor' do |ss|
    ss.source_files = 'FZEncryptor/Classes/FZMD5Encryptor/*'
    ss.public_header_files = 'FZEncryptor/Classes/FZMD5Encryptor/*.h'
end

s.subspec 'FZSHAEncryptor' do |ss|
    ss.source_files = 'FZEncryptor/Classes/FZSHAEncryptor/*'
    ss.public_header_files = 'FZEncryptor/Classes/FZSHAEncryptor/*.h'
end

s.subspec 'FZAESEncryptor' do |ss|
    ss.source_files = 'FZEncryptor/Classes/FZAESEncryptor/*'
    ss.public_header_files = 'FZEncryptor/Classes/FZAESEncryptor/*.h'
end

s.subspec 'FZPrivateKeyEncryptor' do |ss|
    ss.source_files = 'FZEncryptor/Classes/FZPrivateKeyEncryptor/*'
    ss.public_header_files = 'FZEncryptor/Classes/FZPrivateKeyEncryptor/*.h'
    ss.dependency 'FZEncryptor/FZMD5Encryptor'
    ss.dependency 'FZEncryptor/FZBASE64Encryptor'
end

#----------- 文件分级 ------------#

#  s.prefix_header_contents = <<-EOS
#    #ifdef __OBJC__
#    #import "FZURLEncryptor.h"
#    #import "FZBASE64Encryptor.h"
#    #import "FZMD5Encryptor.h"
#    #import "FZAESEncryptor.h"
#    #import "FZSHAEncryptor.h"
#    #import "FZPrivateKeyEncryptor.h"
#    #endif
#    EOS


  # s.resource_bundles = {
  #   'FZEncryptor' => ['FZEncryptor/Assets/*.png']
  # }
  # s.requires_arc =  true
  #  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = "Foundation", "UIKit"

  # s.libraries = "iconv", "xml2","z"
  # s.library   = "CommonCrypto"

  # s.dependency 'AFNetworking', '~> 2.3'
end
