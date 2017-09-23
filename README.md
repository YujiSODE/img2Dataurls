# img2Dataurls
It outputs file that has an array of dataurls, corresponding to image files with the given extension in the current directory, and returns the output filename.  
https://github.com/YujiSODE/img2Dataurls
>Copyright (c) 2017 Yuji SODE \<yuji.sode@gmail.com\>  
>This software is released under the MIT License.  
>See LICENSE or http://opensource.org/licenses/mit-license.php
______
>## 0. data URL scheme
>According to RFC 2397 \(Masinter, 1998\), data URL scheme is URL scheme that would work like \'immediate addressing\', and this scheme has following form of URL:  
>`data:[<mediatype>][;base64],<data>`  
>RFC 2397 \(Masinter, 1998\) shows an example of using data URL scheme as an inline image in a HTML document as follows:  
>`<IMG SRC="data:image/gif;base64,R0lGODdhM` ... `AA7" ALT="Larry">`

## 1. Synopsis
**Tcl**  
`::img2Dataurls::getUrls exName1;`  
**Shell**  
`tclsh img2Dataurls.tcl exName1 ??exName2? ?exName3? ... ?exNameN??;`

**Parameters**  
- `exNameN`: *N*-th name of image file extension

**Script**  
- `img2Dataurls.tcl`

## 2. Output
This script outputs a file that has an array of dataurls corresponding to image files with the given extension in the current directory.  
**Details of output file**  
1. **filename:** `dataurls_<exNameN><XXX>.tcl`  
   where `<exNameN>` and `<XXX>` are given file extension and numbers.
2. **file contents**  
   There are header section and body section.  
   1. **header section**  
      It has `timestamp`, `directory` and `fileExtension`.  
      - `timestamp`: timestamp of execution
      - `directory`: path to the current directory
      - `fileExtension`: given file extension
      
   2. **body section**  
      It has following format:  
      `#=== File: <matched filename> ===`  
      `#dataurl`  
      `set dataurls(<matched filename>) {<dataurl>};`
      
## 3. Library list
- dataurl64/dataurl64.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/009cdfb080e273ec506a1ef24acd050c

## 4. Reference
- Masinter, L. 1998. The "data" URL scheme. *Request for Comments 2397*, *The Internet Society*.
derived on \[2017-09-23\] from: https://tools.ietf.org/html/rfc2397
