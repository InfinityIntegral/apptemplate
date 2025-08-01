import QtQuick
import QtQuick.Controls
import ThemeColours 0.0
import Resizer 0.0
import SingCorrect 0.0

ScrollView{
	property int widgetType: 0
	property string fontClass: "SingScript.sg"
	property int bg: 4
	property int fg: 8
	property int bgHover: 3
	property int fgHover: 7
	property int bgFocus: 2
	property int fgFocus: 6
	property int bgSelected: 6
	property int fgSelected: 2
	property int bgInvalid: 6
	property int fgInvalid: 8
	property int bgScrollbar: 4
	property int fgScrollbar: 6
	property int bgScrollbarHover: 3
	property int fgScrollbarHover: 5
	property int bgScrollbarPress: 2
	property int fgScrollbarPress: 4
	property real x1: 0.0
	property real x0: 0.0
	property real y1: 0.0
	property real y0: 0.0
	property real w1: 0.0
	property real w0: 0.0
	property real h1: 0.0
	property real h0: 0.0
	property real f1: 0.0
	property real f0: 0.0
	property real s1: 0.0
	property real s0: 0.0
	property bool invalid: false
	
	function emitClickedSignal(){
		if(noSendSignal == false && objectName == "0"){objectName = "1";}
		else if(noSendSignal == false){objectName = "0";}
	}
	objectName: "0"
	property bool noSendSignal: false
	
	x: x1 * Resizer.renderSpaceWidth + x0 * Resizer.sizeUnit
	y: y1 * Resizer.renderSpaceHeight + y0 * Resizer.sizeUnit
	width: w1 * Resizer.renderSpaceWidth + w0 * Resizer.sizeUnit
	height: h1 * Resizer.renderSpaceHeight + h0 * Resizer.sizeUnit
	
	ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
	contentWidth: width
	clip: true
	
	property int bgNow: bg
	property int fgNow: fg
	
	function updateInteraction(){
		if(invalid){
			bgNow = bgInvalid;
			fgNow = fgInvalid;
		}
		else if(activeFocus){
			bgNow = bgFocus;
			fgNow = fgFocus;
		}
		else if(hovered){
			bgNow = bgHover;
			fgNow = fgHover;
		}
		else{
			bgNow = bg;
			fgNow = fg;
		}
	}

	property string timerSourceCode: `
	import QtQuick

	Timer{
		interval: 1000
		repeat: false
		running: true
		onTriggered: {parent.invalid = false; destroy();}
	}
	`

	function resetInvalid(){
		if(invalid){
			Qt.createQmlObject(timerSourceCode, this);
		}
	}

	onActiveFocusChanged: updateInteraction();
	onHoveredChanged: updateInteraction();
	onInvalidChanged: {updateInteraction(); resetInvalid();}
	
	Column{
		width: parent.width
		TextArea{
			property bool isInputField: true
			x: 0
			y: 0
			width: parent.width - (s1 * Resizer.renderSpaceWidth + s0 * Resizer.sizeUnit)
			height: Math.max(implicitHeight, h1 * Resizer.renderSpaceHeight + h0 * Resizer.sizeUnit)
			padding: 0
			
			function autocorrect(){
				let pos = cursorPosition;
				let newText = SingCorrect.correct(text);
				pos = pos + newText.length - text.length;
				pos = Math.max(0, pos);
				text = newText;
				cursorPosition = Math.min(pos, text.length);
			}
			onTextChanged: {autocorrect(); emitClickedSignal();}
		
			background: Rectangle{
				x: 0
				y: 0
				width: parent.width
				height: parent.height
				color: ThemeColours.getThemeColour(bgNow)
			}
		
			font.pixelSize: f1 * Resizer.renderSpaceHeight + f0 * Resizer.sizeUnit
			font.family: fontClass
			color: ThemeColours.getThemeColour(fgNow)
			selectionColor: ThemeColours.getThemeColour(bgSelected);
			selectedTextColor: ThemeColours.getThemeColour(fgSelected);
		
			clip: true
			wrapMode: Text.WrapAtWordBoundaryOrAnywhere
		}
	}
	
	ScrollBar.vertical: ScrollBar{
		property int bgNow: bgScrollbar
		property int fgNow: fgScrollbar
		
		function updateInteraction(){
			if(pressed){
				bgNow = parent.bgScrollbarPress;
				fgNow = parent.fgScrollbarPress;
			}
			else if(hovered){
				bgNow = parent.bgScrollbarHover;
				fgNow = parent.fgScrollbarHover;
			}
			else{
				bgNow = parent.bgScrollbar;
				fgNow = parent.fgScrollbar;
			}
		}
		
		onPressedChanged: updateInteraction()
		onHoveredChanged: updateInteraction()
		policy: ScrollBar.AlwaysOn
		
		x: parent.width - width
		y: 0
		width: s1 * Resizer.renderSpaceWidth + s0 * Resizer.sizeUnit
		height: parent.height
		padding: 0
		
		contentItem: Rectangle{
			color: ThemeColours.getThemeColour(parent.fgNow)
			width: parent.width
		}
		background: Rectangle{
			color: ThemeColours.getThemeColour(parent.bgNow)
			width: parent.width
		}
	}
}
