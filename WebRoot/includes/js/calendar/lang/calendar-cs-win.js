/* 
	calendar-cs-win.js
	language: Czech
	encoding: windows-1250
	author: Lubos Jerabek (xnet@seznam.cz)
	        Jan Uhlir (espinosa@centrum.cz)
*/

// ** I18N
Calendar._DN  = new Array('Ned\ufffdle','Pond\ufffdl\ufffd','\ufffdter\ufffd','St\ufffdeda','\ufffdtvrtek','P\ufffdtek','Sobota','Ned\ufffdle');
Calendar._SDN = new Array('Ne','Po','\ufffdt','St','\ufffdt','P\ufffd','So','Ne');
Calendar._MN  = new Array('Leden','\ufffdnor','B\ufffdezen','Duben','Kv\ufffdten','\ufffderven','\ufffdervenec','Srpen','Z\ufffd\ufffd\ufffd','\ufffd\ufffdjen','Listopad','Prosinec');
Calendar._SMN = new Array('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII');

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "O komponent\ufffd kalend\ufffd\ufffd";
Calendar._TT["TOGGLE"] = "Zm\ufffdna prvn\ufffdho dne v t\ufffddnu";
Calendar._TT["PREV_YEAR"] = "P\ufffdedchoz\ufffd rok (p\ufffdidr\ufffd pro menu)";
Calendar._TT["PREV_MONTH"] = "P\ufffdedchoz\ufffd m\ufffds\ufffdc (p\ufffdidr\ufffd pro menu)";
Calendar._TT["GO_TODAY"] = "Dne\ufffdn\ufffd datum";
Calendar._TT["NEXT_MONTH"] = "Dal\ufffd\ufffd m\ufffds\ufffdc (p\ufffdidr\ufffd pro menu)";
Calendar._TT["NEXT_YEAR"] = "Dal\ufffd\ufffd rok (p\ufffdidr\ufffd pro menu)";
Calendar._TT["SEL_DATE"] = "Vyber datum";
Calendar._TT["DRAG_TO_MOVE"] = "Chy\ufffd a t\ufffdhni, pro p\ufffdesun";
Calendar._TT["PART_TODAY"] = " (dnes)";
Calendar._TT["MON_FIRST"] = "Uka\ufffd jako prvn\ufffd Pond\ufffdl\ufffd";
//Calendar._TT["SUN_FIRST"] = "Uka\ufffd jako prvn\ufffd Ned\ufffdli";

Calendar._TT["ABOUT"] =
"DHTML Date/Time Selector\n" +
"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n" + // don't translate this this ;-)
"For latest version visit: http://www.dynarch.com/projects/calendar/\n" +
"Distributed under GNU LGPL.  See http://gnu.org/licenses/lgpl.html for details." +
"\n\n" +
"V\ufffdb\ufffdr datumu:\n" +
"- Use the \xab, \xbb buttons to select year\n" +
"- Pou\ufffdijte tla\ufffd\ufffdtka " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " k v\ufffdb\ufffdru m\ufffds\ufffdce\n" +
"- Podr\ufffdte tla\ufffd\ufffdtko my\ufffdi na jak\ufffdmkoliv z t\ufffdch tla\ufffd\ufffdtek pro rychlej\ufffd\ufffd v\ufffdb\ufffdr.";

Calendar._TT["ABOUT_TIME"] = "\n\n" +
"V\ufffdb\ufffdr \ufffdasu:\n" +
"- Klikn\ufffdte na jakoukoliv z \ufffd\ufffdst\ufffd v\ufffdb\ufffdru \ufffdasu pro zv\ufffden\ufffd.\n" +
"- nebo Shift-click pro sn\ufffden\ufffd\n" +
"- nebo klikn\ufffdte a t\ufffdhn\ufffdte pro rychlej\ufffd\ufffd v\ufffdb\ufffdr.";

// the following is to inform that "%s" is to be the first day of week
// %s will be replaced with the day name.
Calendar._TT["DAY_FIRST"] = "Zobraz %s prvn\ufffd";

// This may be locale-dependent.  It specifies the week-end days, as an array
// of comma-separated numbers.  The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

Calendar._TT["CLOSE"] = "Zav\ufffd\ufffdt";
Calendar._TT["TODAY"] = "Dnes";
Calendar._TT["TIME_PART"] = "(Shift-)Klikni nebo t\ufffdhni pro zm\ufffdnu hodnoty";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "d.m.yy";
Calendar._TT["TT_DATE_FORMAT"] = "%a, %b %e";

Calendar._TT["WK"] = "wk";
Calendar._TT["TIME"] = "\ufffdas:";

// local AM/PM designators
Calendar._TT["AM"] = "AM";
Calendar._TT["PM"] = "PM";
Calendar._TT["am"] = "am";
Calendar._TT["pm"] = "pm";
