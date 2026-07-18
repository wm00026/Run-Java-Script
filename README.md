# Run Java "Script"
A bash script that compiles and runs a Java program with enhanced warnings.

## How to Use
The bash script checks if it actually is a Java file, then compiles with javac and runs the program.

The script can work with simple Java program or with Java programs with packages.

```sh
# First, copy the program to your directory where your Java file is

cp run_java.sh <directory>/

# Then, run the file.
./run_java.sh <file_name>.java

```

## Limitations

- The check on java and javac versions is done with the assumption that the JDK on javac and java is the same.
- The check for packages is assuming the directory layout matches the package.
