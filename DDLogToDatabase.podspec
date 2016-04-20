Pod::Spec.new do |s|
  s.name         = "DDLogToDatabase"
  s.version      = "0.0.1"
  s.summary      = "通过DDlog 重定向日志输出的位置，将日志写入数据库中"
  s.description  = <<-DESC
                   this project provide write log to database and visit log infomation by Http request
                   DESC

  s.homepage     = "https://github.com/yanduhantan563/DDLogToDatabase"
  s.license      = { :type => "MIT"}
  s.author       = { "yanduhantan563" => "yanduhantan563@sina.com" }
  s.platform     = :ios
  s.ios.deployment_target = "5.0"
  s.source       = { :git => "https://github.com/yanduhantan563/DDLogToDatabase.git", :tag => "0.0.1" }
  s.framework = "UIKit"
  s.dependency "FMDB"
  s.dependency "CocoaLumberjack"
  s.source_files  = "myLogToDB", "myLogToDB//*.{h,m}"
#  s.source_files = "Classes/*.{h,m}"
  s.requires_arc = true


end
