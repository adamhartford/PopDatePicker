Pod::Spec.new do |s|
  s.name = 'PopDatePicker'
  s.version = '0.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'NSDatePicker with attached NSPopover'
  s.homepage = 'https://github.com/adamhartford/PopDatePicker'
  s.social_media_url = 'http://twitter.com/adamhartford'
  s.authors = { 'Adam Hartford' => 'adam@adamhartford.com' }
  s.source = { :git => 'https://github.com/adamhartford/PopDatePicker.git', :tag => "v#{s.version}" }

  s.osx.deployment_target = '10.10'

  s.source_files = 'PopDatePicker/*.swift'

  s.requires_arc = true
end
