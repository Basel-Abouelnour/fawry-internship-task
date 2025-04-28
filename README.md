# Fawry-DevOps-Internship-Task
## Content
### 1. Q1) [Customer Command (mygrep.sh)](#1-q1-customer-command-mygrepsh)
### 2. Q2) [Web Dashboard Scenario](#q2-web-dashboard-scenario)
> # Q1) Custom Command (mygrep.sh)

## sections
1. [Introduction](#1introduction)
2. [How to script handels arguments and options](#2how-the-script-handels-arguments-and-options)
3. [Hardest part of the script](#3-hardest-part-of-the-script)
4. [Future work](#4-future-work)

## 1.Introduction
This task is part of the Fawry Internship Enrollment process, creating a custom command that acts as a mini version of the `grep` command but ignoring case sensitivity with some arguments like:
+ `--help` Displays the usage and structure of the command.
+ `-n` Displays the numbers of the lines.
+ `-v` Inverts the match "prints lines that do not match" 
> ⚡ **Note:**
 I left the comments on purpse in case the reviewer wanted to understand my chain of thoughts .



## 2.How the script handels arguments and options
> there are 3 cases that the script can handle arguments in:

1. In the following cases the script will exit and ouput the proper usage of the script.
    - Usage without __any arguments__
    - with __too few arguments__
    -  __the `--help` flag__
    -  or with __wrong and unsupported flags__ 
    - Entering a __non existing filenname__ (in this case the output will tell you to enter a valid filename)
```
Usage:  ./mygrep.sh     [Options] SearchString  Filename
Options -n              show line numbers for each match
        -v              invert the match (print lines that do not match
        --help          show command usage and options
```

2. Usage with __only a search string and a file name__, and in this case the scprit will ouput every line that contains the matched search string (ignores case-sensitivity)

3. __Using flags__ like `-n` or `-v` or a compination of them `-nv` or `-vn` and depending on your choice the output will vary. 

## 3. Hardest part of the script 
In my opinion the hardest part of the script was working with the `awk` command which i choose to mimic the outputs of the usualy output of the `grep` command.

The usage of the command itself isn't hard, but finding the needed options to make the ouput as close as possible to my needs and compining both a regular expression and a variable to make it usable at the end.

## 4. Future Work
some features could be added to make it more "grep-like":

1. `-i` flag for controlling case-sensitivity, this could be implemented, simply by changing the value of the `IGNORECASE` variable from 1 to 0 (which is the default in `awk`) to make it case sensitive.

2. `-l` flag, could be applied, but in my thought's it could be used by `find` or `locate` commands without `awk`.

3. `-c` flag, can be implemented by piping the output of normal usage of the script to `wc -l` command.

---
<br><br>

> # Q2) Web Dashboard Scenario
- The details of this scenario are in the [scenario-2.md](scenario-2.md)
