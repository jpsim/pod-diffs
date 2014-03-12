# Modifying Pods with Diffs

Times were simpler (but suckier) when Xcode projects didn't have package management. Now that we have [cocoapods](http://cocoapods.org), modifying vendored code isn't as obvious.

This project guides you through a neat way to modify pods using patchfiles.

For an overview of the approaches available to modify pods, please read my article on [Cocoapods Tips & Tricks](http://jpsim.com/cocoapods-tips-tricks).

## Process

* Start off with an Xcode project using cocoapods.
* Then copy the file you wish to patch into the project's root directory.
* Edit the file in the root directory with the changes you'd like to make.
* Create a `Diffs` directory where you'll keep your patches: `mkdir Diffs`

* Generate the patchfile:

```shell
diff -u Pods/JPSImagePickerController/JPSImagePickerController/JPSImagePickerController.m JPSImagePickerController.m > Diffs/JPSImagePickerController.m.diff
```

* Edit the patchfile to remove dates and have both paths point to Pods:

```
+++ Pods/JPSImagePickerController/JPSImagePickerController/JPSImagePickerController.m
--- Pods/JPSImagePickerController/JPSImagePickerController/JPSImagePickerController.m
```

* Add a `post_install` block to your `Podfile` to apply the patch on every `pod install`:

```ruby
post_install do | installer |
	`patch -p0 < Diffs/JPSImagePickerController.m.diff`
end
```

* Finally, remove the temporary file you created: `rm JPSImagePickerController.m`

The next times you run `pod install`, your patches will be applied.

You can take a look at the project in this repo to see this process in action. The `Diffs` and `Podfile` will be of interest.
