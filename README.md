## Files Sanitation
Bash script that removes/replaces special characters in filenames

# Syntax

```
./sanitize_filenames.sh [ARGS]
``` 
File list as argument. Comma separated values with double quotes prefixed and suffixed.

For example:

```
./sanitize_filenames.sh "analysis{fir #.py,rep>ort}2020.xl,one\\eml/u&.lp,two=sta+ts.sl,final\`repo.ui"
``` 

# Escaping

Following special characters should be escaped with backslash while giving as a input. 

!(exclamation) `(backtick) "(double quotes) \\(backslash)

```
\! \` \" \\
``` 

# Replacement

Following special characters will be removed because it is difficult to manupulate while
having these on filenames.

```
  blank space
\(backslash)
'(single quote)
"(double quotes)
```

Following special characters will be replaced with corresponding texts.

```
# pound
% percent
& ampersand
{ leftCurlBr
} rightCurlBr
< leftBr
> rightBr
* asterisk
? question
! exclam
: colon )
@ at
+ plus
| pipe
= eq
```

# Reusability

Script defines a list called replacements. This list can be modified if 
we want to add new special character or change the replacement text. 

For example add semicolon on the list.End of replacement list addition.  Add following.

```
replacements+=( [";"]=semicoln )
```


