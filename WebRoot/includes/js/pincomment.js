/*
	Toggles a menu on & off (using cookies
*/
var showText = '';
var showTitle = '';

var hideText = '';
var hideTitle = '';


function initPinComments(showText1, showTitle1, hideText1, hideTitle1) 
{
    showText = showText1;
    showTitle = showTitle1;

    hideText = hideText1;
    hideTitle = hideTitle1;
}

function toggleMenu(sSectionID, eSectionIcon)
{
	var eSection = document.getElementById(sSectionID);
	if (readFromConglomerateCookie("simple.conglomerate.cookie", sSectionID, '0') == "1")
	{
        eSectionIcon.innerHTML = showText;
		eSectionIcon.setAttribute("title", showTitle);
        eraseFromConglomerateCookie("simple.conglomerate.cookie", sSectionID);
    }
	else
	{
        eSectionIcon.innerHTML = hideText;
		eSectionIcon.setAttribute("title", hideTitle);
        saveToConglomerateCookie("simple.conglomerate.cookie", sSectionID, '1');
	}

}
/*
	Restiores a state of a menu
*/

function restoreMenu(sSectionID, sSectionIcon)
{
	var eSection = document.getElementById(sSectionID);
	var eSectionIcon = document.getElementById(sSectionIcon);
	if (readFromConglomerateCookie("simple.conglomerate.cookie", sSectionID, '0') == "1")
	{
        eSection.style.display = "block";
		eSectionIcon.innerHTML = hideText;
		eSectionIcon.setAttribute("title", hideTitle);
	}
    else
    {
        eSectionIcon.innerHTML = showText;
		eSectionIcon.setAttribute("title",showTitle);        
    }

}