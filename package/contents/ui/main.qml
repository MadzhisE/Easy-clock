import QtQuick
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents

PlasmoidItem {
    id: root
    width: root.height*4
    implicitHeight: 100

    property var format: "❜yy年 M月d日"

    Plasmoid.backgroundHints: "NoBackground"

    FontLoader {
        id: dotGothic16Regular
        source: Qt.resolvedUrl("../fonts/DotGothic16-Regular.ttf")
    }

    FontLoader {
        id: zpix
        source: Qt.resolvedUrl("../fonts/zpix.ttf")
    }

    FontLoader {
        id: bestTen
        source: Qt.resolvedUrl("../fonts/BestTen-DOT.otf")
    }

    FontLoader {
        id: nosutaruRegular
        source: Qt.resolvedUrl("../fonts/Nosutaru-dotMPlusH-10-Regular.ttf")
    }

    PlasmaComponents.Label {
        id: label1
        color: "goldenrod"
        text: Qt.formatDateTime(new Date(), format)
        font.family: zpix.name
        fontSizeMode: Text.Fit
        font.pixelSize: root.height * 0.8
        font.weight: 400
    }

    ShaderEffectSource {
        id: textSource
        sourceItem: label1
        hideSource: true
    }

    ShaderEffect {
        anchors.centerIn: parent
        width: label1.contentWidth
        enabled: false
        height: label1.contentHeight
        property variant source: textSource
        fragmentShader: Qt.resolvedUrl("scanline.frag.qsb")
    }


    Timer {
        interval: 60000; running: true; repeat: true
        onTriggered: {
            var now = new Date()
            label1.text = Qt.formatDateTime(now, format)
        }
    }

}