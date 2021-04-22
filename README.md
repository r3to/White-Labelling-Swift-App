#  README

This is an Example for the base setup of a white labeling app which uses Build configuration and Schemes instead of targets to differentiate between different Customers.

## tl;dr

We separate customer specific Assets and Configurations in different directories and use Build configurations to include only those files, that are needed per implemenation.

## Reading Resources

- [Conditional Compilation, Part 2: Including and Excluding Source Files](https://davedelong.com/blog/2018/07/25/conditional-compilation-in-swift-part-2/)
- [Xcode Build Settings](https://xcodebuildsettings.com/#excluded_installsrc_subdirectory_patterns)
- [White-Labeling in Xcode](https://betterprogramming.pub/white-labelling-in-xcode-a5ad66f30a8a)
