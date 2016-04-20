Pod::Spec.new do |s|

  s.name         = "myLogToDB"
  s.version      = "0.0.1"
  s.summary      = "通过CocoaLumberjack 开源的日志框架，将日志发送到本地数据库，通过GCDWebServer的方式在本地的浏览器实现日志的访问"
  s.description  = <<-DESC
                   通过CocoaLumberjack 开源的日志框架，将日志发送到本地数据
				       库，通过GCDWebServer的方式在本地的浏览器实现日志的访问
                   DESC

  s.homepage     = "https://github.com/yanduhantan563/myLogToDB"

  s.license      = "MIT"

  s.author             = { "alexYange" => "alex@gamptech.com" }

  # s.platform     = :ios
  s.platform     = :ios, "7.0"

  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/yanduhantan563/myLogToDB.git", :tag => "0.0.1" }

  s.source_files  = "myLogToDB", "myLogToDB/**/*.{h,m}"


  # s.resource  = "icon.png"
  s.resources = "myLogToDB/*.pch"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  s.dependency "FMDB"

end
