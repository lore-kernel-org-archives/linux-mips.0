Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199801122040.VAA20724@zaphod.et.tudelft.nl>
Subject: booting linux
Date: Mon, 12 Jan 1998 21:40:53 +0100 (CET)
In-Reply-To: 
From: Edwin Hakkennes <E.Hakkennes@ET.TUDelft.NL>
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux@cthulhu.engr.sgi.com
Cc: Edwin Hakkennes <E.Hakkennes@ET.TUDelft.NL>
Message-ID: <19980112204053.V1f8J7tG7zSU0tnU108AJMslTt80vuUiDovM6GnYaFQ@z>

Hi all

I reinstalled Irix 5.3 on our indy, and put the vmlinux-indy-2.1.67.tar.gz
kernel on the irix root as vmlinux. There is no root-file-system yet. I need 
to bring a disk...

When booting using 
stop for maintainance,
boot
(sash) boot -f /vmlinux /dev/sda1
it starts to boot, but it hangs after the following message:
Got a bus error IRQ, shouldn't happen yet.

This comes just after the serial devices probe and the registering of the
loop device.

Is this something releted to a missing root-file-system? I was expecting
something like
Panic, unable to mount root-fs

I'll bring a disk tomorrow and try to unpack the file-system there, but in 
the meantime, I'm curious what causes this error.

I'm also curious where to fined the installer program which is mentioned in 
Linux-installer.tgz/INSTALL and whether there is a solution to the rpm-binary
that is supposed not to work (as per th INSTALL doc)

Thanks for any insight! and for porting Linux/RedHat 5.0!

Edwin Hakkennes
