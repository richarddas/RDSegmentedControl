Pod::Spec.new do |s|
  s.name         = 'RDSegmentedControl'
  s.version      = '0.1'
  s.authors      = { 'Richard Das' => 'richard@richarddas.com' }
  s.license 	 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://github.com/richarddas/RDSegmentedControl'
  s.summary      = 'A custom UIControl for handling a series of UIControls separated by a UIImage separator.'
  s.source       = { :git => 'https://github.com/richarddas/RDSegmentedControl.git', :tag => "#{s.version}"
  s.source_files = "RDSegmentedControl/Classes/*.*"
  s.platform     = :ios
end