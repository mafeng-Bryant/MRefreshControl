Pod::Spec.new do |s|
  s.name             = 'MRefreshControl'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MRefreshControl.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/mafeng-Bryant/MRefreshControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1499603656@qq.com' => 'feng.ma@patpat.com' }
  s.source           = { :git => 'https://github.com/mafeng-Bryant/MRefreshControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '8.0'
  s.source_files = 'MRefreshControl/Classes/**/*'
  # s.resource_bundles = {
  #   'MRefreshControl' => ['MRefreshControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MJRefresh', '~> 3.1.15.3'
  s.dependency 'MUIFont', '~> 1.0.0'
  s.dependency 'MLocalizedStringKit', '~> 1.0.0'
  s.dependency 'MExtensions', '~> 2.0.5'
end
