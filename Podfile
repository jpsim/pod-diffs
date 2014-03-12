platform :ios, '7.0'

pod 'JPSImagePickerController'

post_install do | installer |
	`patch -p0 < Diffs/JPSImagePickerController.m.diff`
end
