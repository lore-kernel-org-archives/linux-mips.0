From: "Gill" <gill.robles@exterity.co.uk>
Subject: No PCI memory response
Date: Mon, 4 Apr 2005 15:44:51 +0100
Message-ID: <000001c53924$db7c75e0$2000a8c0@gillpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-Path: <gill.robles@exterity.co.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050404144451.2x1ZHFGFarQJZVfG4YY-b9PTaXSLAbi7b0SmfSiXorg@z>

Can anyone help?  We're trying to talk to a RealTek RTL8139 device across
the PCI bus, and, although linux can access configuration registers on the
device, it does not access memory space correctly, and we are unable to read
back any sensible values from the RTL8139 registers. 

We are using the latest 2.6 linux on an Alchemy DB1550 board.

Any help would be much appreciated!


Gill
