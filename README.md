# WCDBSwiftDemo
A Swift Demo to use WCDB using CocoaPods and build success.

This Demo provided here to show the fix for WCDB: https://github.com/Tencent/wcdb/pull/789

Unless that PR been merged into the official repo, to use WCDB in your pure Swift project, you just need to add these into your `Podfile`:

```ruby
pod 'WCDB.swift', :git => 'https://github.com/dreampiggy/wcdb.git', :branch => 'fix_swift', :modular_headers => true
```
