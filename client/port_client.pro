#-------------------------------------------------
#
# Project created by QtCreator 2016-06-21T08:40:33
#
#-------------------------------------------------

QT       += core gui\
        network\
        charts


greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = port_client
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    request.cpp

HEADERS  += mainwindow.h \
    request.h

FORMS    += mainwindow.ui
