# Creating Packages for OpenOrchid

To create packages for OpenOrchid, you can follow these steps:

1. Prepare your package files and resources.

2. Put them in a directory (e.g. `./packages/mypackage`)

3. Make a script to compile or install the package and name it whatever you want. (e.g. `myscript.sh`)

4. enable the package by adding this line to your `.config`:
```
PACKAGE_<uppercase package dir name>=y
```
e.g.
```
PACKAGE_MYPACKAGE=y
```

And now it will be installed in OpenOrchid after building.
