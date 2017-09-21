#img2Dataurls
#img2Dataurls.tcl
##===================================================================
#	Copyright (c) 2017 Yuji SODE <yuji.sode@gmail.com>
#
#	This software is released under the MIT License.
#	See LICENSE or http://opensource.org/licenses/mit-license.php
##===================================================================
#It outputs file that has an array of dataurls, corresponding to image files with the given extension in the current directory, and returns the output filename.
#=== Synopsis ===
#::img2Dataurls::getUrls exName1;
#or
#tclsh img2Dataurls.tcl exName1 ??exName2? ?exName3? ... ?exNameN??;
#=== Parameters ===
# - exNameN: N-th name of image file extension
##===================================================================
set auto_noexec 1;
package require Tcl 8.6;
#=== namespace: img2Dataurls ===
namespace eval ::img2Dataurls {
	#=== dataurl64/dataurl64.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/009cdfb080e273ec506a1ef24acd050c ===
	#it returns a data url with base64-encoded data.
	proc dataurl64 {fileName {type text/plain}} {set c [open $fileName r];fconfigure $c -encoding binary -translation binary;set v [read $c];close $c;return "data:$type;base64,[binary encode base64 $v]";};
	#it outputs file that has an array of dataurls, corresponding to image files with the given extension in the current directory, and returns the output filename
	proc getUrls {exName} {
		# - $exName: name of image filename extension
		set T [clock seconds];
		#$txt is text data to output
		set txt "\\#[clock format $T -gmt 1]\\n\\#directory:\\t[pwd]\\n\\#FileExtension:\\t$exName";
		#$txtName is filename to output
		set txtName "dataurls_$exName$T.tcl";
		set imgList [lsort -dictionary [glob "*.$exName"]];
		lmap x $imgList {
			lappend txt "\n\#===\tFile:\t$x\t===\n\#dataurl\nset\tdataurls\($x\)\t\{[dataurl64 $x "image/$exName"]\}\;";
		};
		set ch [open $txtName w];
		puts $ch [join $txt {}];
		close $ch;
		#filename of output data is returned
		return $txtName;
	};
};
if {$argc>0} {lmap x $argv {::img2Dataurls::getUrls $x;}};
