Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Sun, 12 Jul 1998 22:00:25 -0700
Message-ID: <199807130500.WAA22156@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: Indy serial ports
In-Reply-To: <19980712145324.03216@alpha.franken.de>
References: <19980712145324.03216@alpha.franken.de>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980713050025.D6y_6MR0vY2EC0vDgynX-EtE8rDGDZ3FKHCkfziVOHo@z>

Thomas Bogendoerfer writes:
 > Hi,
 > 
 > I'm about to start converting the SGI console to a abscon style console.
 > To make debugging easier I'm planning to use a serial console. But my
 > Indy doesn't have any "normal" serial connector. I guess the two serial
 > ports are those PS/2 connectors near the mouse and keyboard connectors.
 > As I don't have an converter I need the pinout of the PS/2 connectors
 > to build my own one. Any hints where I can find a description of that
 > ports ?

From IRIX serial(7):
                                                                     2
     The DIN-8 serial port connectors on the Indigo, Indy, and Indigo  have
     the following pin assignments.

                                     ---------
                                    / 8  7  6 \
                                   (  5  4  3  )
                                    \  2   1  /
                                     ---------

                     _4D_Compatible_Pin_Assignments_(RS-232)__
                      Pin   | Name    | Description
                     _______|_________|_______________________
                       1    | DTR     | Data Terminal Ready
                       2    | CTS     | Clear To Send
                       3    | TD      | Transmit Data
                       4    | SG      | Signal Ground
                       5    | RD      | Receive Data
                       6    | RTS     | Request To Send
                       7    | DCD     | Data Carrier Detect
                       8    | SG      | Signal Ground

                 Macintosh_SE_Compatible_Pin_Assignments_(RS-422)_
                 Pin  | Name  | Description
                 _____|_______|___________________________________
                  1   | HSKo  | Output Handshake
                  2   | HSKi  | Input Handshake Or External Clock
                  3   | TxD-  | Transmit Data -
                  4   | GND   | Signal Ground
                  5   | RxD-  | Receive Data -
                  6   | TxD+  | Transmit Data +
                  7   | GPi   | General Purpose Input
                  8   | RxD+  | Receive Data +

Note that the ports are in RS-232 mode by default.
