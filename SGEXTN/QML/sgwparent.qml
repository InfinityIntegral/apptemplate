import QtQuick
import ThemeColours 0.0
import Resizer 0.0

Rectangle{
	x: 0.5 * (Resizer.appWindowWidth - Resizer.renderSpaceWidth)
	y: 0.5 * (Resizer.appWindowHeight - Resizer.renderSpaceHeight) + Resizer.sizeUnit
    width: Resizer.renderSpaceWidth
    height: Resizer.renderSpaceHeight - Resizer.sizeUnit
    color: ThemeColours.getThemeColour(8)
}
