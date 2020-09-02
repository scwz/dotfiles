#!/usr/bin/env python3

import os
import sys
import getpass
from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import QApplication, QWidget, QHBoxLayout, QPushButton, QMessageBox, QVBoxLayout, QLabel

def send_alert(msg):
    alert = QMessageBox()
    alert.setText(msg)
    alert.exec_()


def lock():
    os.system("i3lock -c 2f343f")


def suspend():
    lock()
    os.system("dbus-send --system --print-reply \
              --dest=org.freedesktop.login1 /org/freedesktop/login1 \
                \"org.freedesktop.login1.Manager.Suspend\" boolean:true")


def reboot():
    os.system("dbus-send --system --print-reply \
              --dest=org.freedesktop.login1 /org/freedesktop/login1 \
                \"org.freedesktop.login1.Manager.Reboot\" boolean:true")


def shutdown():
    os.system("dbus-send --system --print-reply \
              --dest=org.freedesktop.login1 /org/freedesktop/login1 \
                \"org.freedesktop.login1.Manager.PowerOff\" boolean:true")


class i3_exit(QWidget):
    def __init__(self):
        super().__init__()
        self.title = f"Log out {getpass.getuser()}? Choose an option:"
        self.setWindowTitle(self.title)
        self.setWindowFlags(Qt.Window | Qt.CustomizeWindowHint | Qt.WindowStaysOnTopHint)
        self.setFixedWidth(500)
        self.setFixedHeight(80)
        self.create_window()

    def cancel_action(self):
        self.disable_buttons()
        sys.exit(QApplication.quit())

    def logout_action(self):
        self.disable_buttons()
        send_alert("logging out")
        self.status.setText("Exiting i3, please standby...")

        #os.system("i3-msg exit")

    def suspend_action(self):
        self.disable_buttons()
        self.status.setText("Suspending, please standby...")
        suspend()
        sys.exit(QApplication.quit())

    def reboot_action(self):
        self.disable_buttons()
        self.status.setText("Rebooting, please standby...")
        reboot()
    
    def shutdown_action(self):
        self.disable_buttons()
        self.status.setText("Shutting down, please standby...")
        shutdown()

    def disable_buttons(self):
        self.suspend.setEnabled(False)
        self.logout.setEnabled(False)
        self.reboot.setEnabled(False)
        self.shutdown.setEnabled(False)
        self.cancel.setEnabled(False)

    def create_window(self):
        status_hbox = QHBoxLayout()
        btn_hbox = QHBoxLayout()

        # suspend button
        self.suspend = QPushButton('Suspend')
        self.suspend.clicked.connect(self.suspend_action)

        # logout button
        self.logout = QPushButton('Logout')
        self.logout.clicked.connect(self.logout_action)

        # reboot button
        self.reboot = QPushButton('Reboot')
        self.reboot.clicked.connect(self.reboot_action)

        # shutdown button
        self.shutdown = QPushButton('Shutdown')
        self.shutdown.clicked.connect(self.shutdown_action)

        # cancel button
        self.cancel = QPushButton('Cancel')
        self.cancel.clicked.connect(self.cancel_action)

        # add buttons to lower hbox
        btn_hbox.addWidget(self.suspend)
        btn_hbox.addWidget(self.logout)
        btn_hbox.addWidget(self.reboot)
        btn_hbox.addWidget(self.shutdown)
        btn_hbox.addWidget(self.cancel)

        # status text
        self.status = QLabel(self.title)
        self.status.setAlignment(Qt.AlignCenter)

        # add status to higher hbox
        status_hbox.addWidget(self.status)

        # add both previous hboxes to a parent vbox
        layout = QVBoxLayout()
        layout.addLayout(status_hbox) 
        layout.addLayout(btn_hbox)

        self.setLayout(layout)
        self.show()


if __name__ == '__main__':
    app = QApplication([])
    window = i3_exit()
    sys.exit(app.exec_())
