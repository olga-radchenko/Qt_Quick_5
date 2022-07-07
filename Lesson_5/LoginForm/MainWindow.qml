import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Window {
    id: root
    width: 320
    height: 480
    visible: true
    title:  qsTr("Login Form")

    property string userName:""

    property int failLoginCounter: 0 /* После третьей неудачной попытки входа
    появится кнопка для вызова формы восстановления пароля */

    property ListModel loginList: LoginListModel {}

    Timer {
        id: timer
        interval : 1000
        repeat:false;
    }

    LinearGradient {
       id: gradient
       start: Qt.point(50, 0)
       end: Qt.point(100, 480)
       anchors.fill: parent
       gradient: Gradient {
            GradientStop { position: 0.0; color: "#87ceeb" }
            GradientStop { position: 0.5; color: "#dda0dd" }
            GradientStop { position: 1.0; color: "#ff69b4" }
       }
       opacity: 0.6
    }
    Column {
        id:mainView
        spacing: 5
        width: root.width
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: logoPic
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/LoginForm/LogoPic/logo.png"
            Layout.alignment: Qt.AlignHCenter
        }

        state : "loginForm"
        states: [
            State {
                name: "loginForm"
                PropertyChanges { target: loader;  sourceComponent: Qt.createComponent("LoginForm.qml") }
            },
            State {
                name: "accountCreate"
                PropertyChanges { target: loader;  sourceComponent: Qt.createComponent("RegistrationForm.qml")}
            },
            State {
                name: "loginSuccess"
                PropertyChanges { target: loader;  sourceComponent: Qt.createComponent("WelcomeForm.qml")}
            },
            State {
                name: "recoverRequest"
                PropertyChanges { target: loader;  sourceComponent: Qt.createComponent("PswRecoverForm.qml")}
            }
        ]

        Loader {
            id: loader
            anchors.horizontalCenter: parent.horizontalCenter
            onStatusChanged: if (loader.status == Loader.Ready) loader.item.state = "Visible"
        }

        Connections {
            target: loader.item

            onLoginSuccess: function (login) {
                loader.item.state = "Invisible"
                delay(1000,function() {userName = login; mainView.state = "loginSuccess"})
            }

            onAccountCreate:()=> {
                loader.item.state = "Invisible"
                delay( 1000, function() { mainView.state = "accountCreate"} );
            }

            onRecoverRequest:()=> {
                loader.item.state = "Invisible"
                delay(1000,function() { mainView.state = "recoverRequest"})
            }
            onBack:()=> {
                loader.item.state = "Invisible"
                delay(1000,function() {mainView.state = "loginForm"})
            }

            onRegistrationSuccess:()=> {
                loader.item.state = "Invisible"
                delay(1000,function() {mainView.state = "loginForm"})
            }
            onLogout:()=> {
                loader.item.state = "Invisible"
                delay(1000,function() {mainView.state = "loginForm"})
            }
        }
    }

    function printUserRegisteredData(id) {
        console.log("Email:",loginList.get(id).email)
        console.log("Username:",loginList.get(id).username)
        console.log("Password:",loginList.get(id).password)
    }

    function findNamePswdCombination(username, password) {
        for(var i = 0; i < loginList.count; ++i) {
            if ((loginList.get(i).username === username) && (loginList.get(i).password === password))
            {
              return i
            }
        }
    return -1
    }

    function findEmail(email) {
        for(var i = 0; i < loginList.count; ++i) {
            if (loginList.get(i).email === email)
            {
              return i
            }
        }
    return -1
    }

    function findName(name) {
        for(var i = 0; i < loginList.count; ++i) {
            if (loginList.get(i).username === name)
            {
              return i
            }
        }
    return -1
    }

    function delay(delayTime, cb) {
        timer.triggered.connect(cb);
        timer.start();
    }
}
