From: "Len Smith" <lsmith@systemdynamix.com>
Subject: SGI320/Linux - Zip Drive and COM port.
Date: Wed, 5 Jan 2000 14:25:07 -0500
Message-ID: <LOBBKIACINGIEBKLGDKHMEIKCEAA.lsmith@systemdynamix.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: linux@cthulhu.engr.sgi.com
Message-ID: <20000105192507.BT1wLOjm262BuyQ1OH1nbhBi7CRse7Si0wGKDzIx_KQ@z>

I am attempting to deal with several issues with RH 6.0 Linux (2.2.10) on
the SGI Visual Workstation that I am unable to resolve.  I am sure that the
resolutions are quite simple, but I have tried the HOWTO route and asked
others without success.  Normally I am reluctant to seek help, opting to
work the problem out for myself, but I seem unable to do so in this case.

First, I recently installed an SGI supplied IOMEGA ZIP-100 into floppy bay
#2 on the VWS.  It installed easily and it works correctly under NT.  It is
recognized by Linux as "hdd" on the third probe during boot.  I am unable to
mount the device.  The HOWTOs reference SCSI drives (this is an IDE, I
believe) or parallel-attached devices.  So I can't find support assistance
for internal drives.  Do you have any guidance in this area?

Also, I am having difficulty accessing COM1 on the VWS.  I get an error on
"setserial -g /dev/ttys0" or "/dev/cua0" under root.  Both devices are
present and seem to be correct.  The port works correctly under NT.  If I
try "setserial auto_irq skip_test autoconfig" I receive a "device not found"
error.  If you have guidance here I would be grateful as well.

I thank your for your time.

Regards,

Len Smith
lsmith@systemdynamix.com
