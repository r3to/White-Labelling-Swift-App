#  README

This is an Example for the base setup of a white labeling app which uses Build configuration and Schemes instead of targets to differentiate between different Customers.

## tl;dr

We separate customer specific Assets and Configurations in different directories and use Build configurations to include only those files, that are needed per implemenation.

## Reading Resources

- [Conditional Compilation, Part 2: Including and Excluding Source Files](https://davedelong.com/blog/2018/07/25/conditional-compilation-in-swift-part-2/)
- [Xcode Build Settings](https://xcodebuildsettings.com/#excluded_source_file_names)
- [White-Labeling in Xcode](https://betterprogramming.pub/white-labelling-in-xcode-a5ad66f30a8a)


## Project Structure

For each customer, we define two build configurations (one for debugging and one for releasing). Going further, we can move that to a custom `.xccconfig` file.

We organize different files in distinct subdirectories and use `EXCLUDED_SOURCE_FILE_NAMES` together with `INCLUDED_SOURCE_FILE_NAMES` to exclude resources that belong to a different customer. 

### Example

In [`BaseWhiteLabelConfiguration.xcconfig`](./BaseWhiteLabelConfiguration.xcconfig) we define the paths for all customer implementations

``` xcconfig
CLIENT_PATHS = */ClientA/* */ClientB*/

EXCLUDED_SOURCE_FILE_NAMES = $CLIENT_PATHS
INCLUDED_SOURCE_FILE_NAMES = */$(CLIENT)/*
```
In the build configuration for each customer, we set the `$(CLIENT)` value to the correct name. 

### Custom Swift Implementations per Customer

Excluding Swift files doesn't work that well. Xcode will return a `Invalid redeclaration of 'X'` error when defining custom implementations in the Customer's subdirectory. As a workaround, the value of `$(CLIENT)` is added to `SWIFT_ACTIVE_COMPILATION_CONDITIONS`. We can then wrap the whole implmentation in a conditional statement.

``` swift
#if ClientB
import UIKit

struct Client: Whitelabelable {
    var name: String { return "Client A" }
    var tintColor: UIColor { return .blue }
}
#endif
```

## Adding A New customer

1. Creating subdirectory
2. Adding directory to `$(CLIENT_PATHS)` in [`BaseWhiteLabelConfiguration.xcconfig`](./BaseWhiteLabelConfiguration.xcconfig)
3. Creating new Build configurations (Debug and Release)
    - Duplicate existing configurations
    - Set `$(CLIENT)` to the correct name 
    - -> TODO: have a base implementation, that can be copy-pasted
4. Create a Build Scheme for the new customer
5. Adjust configuration to match the customers specification


## Considerations

- Multiple targets become messy
- Separate Icons, certificates and configuration per App
- Simple is better than complicated
