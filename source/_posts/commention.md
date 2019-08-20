# How to creat a hello qt demo
## These are commentions about how to creat a hello qt demo
## Moudles
Qt has an impressive collection of modules, including

    1. QtCore, a base library that provides containers, thread management, event management, and much more
    2. QtGui and QtWidgets, a GUI toolkit for Desktop, that provides a lot of graphical components to design applications.
    3. QtNetwork, that provides a useful set of classes to deal with network communications
    4. QtWebkit, the webkit engine, that enable the use of web pages and web apps in a Qt application.
    5. QtSQL, a full featured SQL RDBM abstraction layer extensible with own drivers, support for ODBC, SQLITE, MySQL and PostgreSQL is available out of the box
    6. QtXML, support for simple XML parsing (SAX) and DOM
    7. QtXmlPatterns, support for XSLT, XPath, XQuery and Schema validation

## How to creat a qt project with .pro file

    1. TEMPLATE describes the type to build. It can be an application, a library, or simply subdirectories.
    2. TARGET is the name of the app or the library.
    3. QT is used to indicate what libraries (Qt modules) are being used in this project. Since our first app is a small GUI, we will need QtCore and QtGui.

## Signals and slots
Instead of having observable objects and observers, and registering them, Qt provides two high level concepts: signals and slots.

    1. A signal is a message that an object can send, most of the time to inform of a status change.
    2. A slot is a function that is used to accept and respond to a signal.

Here are some examples of signals and slots from our well known QPushButton class.

    1. clicked
    2. pressed
    3. released

As you can see, their names are quite explicit. These signals are sent when the user clicked (pressed then released), pressed or released the button.

Here are some slots, from different classes

    1. QApplication::quit
    2. QWidget::setEnabled
    3. QPushButton::setText

In order to respond to a signal, a slot must be connected to a signal. Qt provides the method QObject::connect. It is used this way, with the two macros SIGNAL and SLOT 

```c++
FooObjectA *fooA = new FooObjectA();
FooObjectB *fooB = new FooObjectB();

QObject::connect(fooA, SIGNAL (bared()), fooB, SLOT (baz()));
```

### window.cpp sample
```c++
#include <QApplication>
#include <QProgressBar>
#include <QSlider>

int main(int argc, char **argv)
{
 QApplication app (argc, argv);

 // Create a container window
 QWidget window;
 window.setFixedSize(200, 80);

 // Create a progress bar
 // with the range between 0 and 100, and a starting value of 0
 QProgressBar *progressBar = new QProgressBar(&window);
 progressBar->setRange(0, 100);
 progressBar->setValue(0);
 progressBar->setGeometry(10, 10, 180, 30);

 // Create a horizontal slider
 // with the range between 0 and 100, and a starting value of 0
 QSlider *slider = new QSlider(&window);
 slider->setOrientation(Qt::Horizontal);
 slider->setRange(0, 100);
 slider->setValue(0);
 slider->setGeometry(10, 40, 180, 30);

 window.show();

 // Connection
 // This connection set the value of the progress bar
 // while the slider's value changes
 QObject::connect(slider, SIGNAL (valueChanged(int)), progressBar, SLOT (setValue(int)));

 return app.exec();
}
```
