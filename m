Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yDFLA-000V5iC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Getting Started ..... NOT
Date: Thu, 12 Mar 1998 21:16:36 +0000 (GMT)
In-Reply-To: <Pine.GSO.3.96.980313030936.24023A-100000@sparc> from "Tony C. Wu" at Mar 13, 98 03:35:36 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "Tony C. Wu" <tonywu@life.nthu.edu.tw>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980312211636.9y-bH6NxcpnjHWCZ46duxnwO-7IEZRxWXo0eLR-nbHo@z>

> 2.1.72_NOSL: put me in repair fs mode, but i can't change anything.
>              It said it couldn't read superblock on /dev/sdb

Ok. The disk image expects to be /dev/sdb
do


mount -n -o remount,rw /dev/sdb1  /

vi /etc/fstab

change /dev/sdb to /dev/sdb1

exit


Best of luck
