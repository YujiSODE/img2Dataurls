# img2Dataurls
It outputs file that has an array of dataurls, corresponding to image files with the given extension in the current directory, and returns the output filename.  
https://github.com/YujiSODE/img2Dataurls
>Copyright (c) 2017 Yuji SODE \<yuji.sode@gmail.com\>  
>This software is released under the MIT License.  
>See LICENSE or http://opensource.org/licenses/mit-license.php
______
## 1. Synopsis
`::img2Dataurls::getUrls exName1;`  
or  
`tclsh img2Dataurls.tcl exName1 ??exName2? ?exName3? ... ?exNameN??;`

**Parameters**  
- `exNameN`: *N*-th name of image file extension

**Script**  
- `img2Dataurls.tcl`

## 2. Output
This script outputs a file that has an array of dataurls corresponding to image files with the given extension in the current directory.  
**Details of output file**  
- filename: `dataurls_<exNameN><XXX>.tcl`  
  where `<exNameN>` and `<XXX>` are given file extension and numbers.
- file contents  
  There are **header section** and **body section**.

## 3. Library list
- dataurl64/dataurl64.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/009cdfb080e273ec506a1ef24acd050c

## 4. Reference
- reference
