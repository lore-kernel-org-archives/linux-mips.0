content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: how to build a kernel for the Origin 200 ?
Date: Tue, 6 Aug 2002 13:34:47 +0200
Message-ID: <D6FDE23B67E2A34691BDFFC03C9D3E3B4CEBBD@ams2k020.europe.panorg.com>
From: "AMS Hoogland Yvar" <Yvar.Hoogland@panalpina.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020806113447.dBWrqeId7uf4prBvd5YyScouXW98OJQB_TD0aC-mVMM@z>

Hi,

I'm pretty new to all this, but am planning on installing Debian on
an Origin 200 server I got from my IT dept.

However, when I got it it lacked a cd-rom and harddisk, I got both, 
a correct Toshiba CD-ROM and a 4.3 GB SCA harddisk in the bottom
(system disk) slot.

The hard disk is to my best knowledge empty ! So I do not have 
IRIX installed or available.

I hooked the server (which does not have a display connector) to
an Etherminal C thin client through a serial connection and its 
ANSI emulator

So know I can see the boot sequence and the prompt below the 5 options
looking like this:

+++++++++++++++
1) Start System
2) Install System Software
3) Run Diagnostics
4) Recover System
5) Enter Command Monitor

Option? 
+++++++++++++++

So where do I go from here ? I understand by now that I first need to build
a cross-compiler and binutils then crosscompile a kernel. I read the FAQ
at the linux-mips site.

My first concern is how to get the needed software onto the Origin's hdd, 
is it possible from cd-rom or are there other options ? And make it accessible.

Also I noticed that the Origin does not have fdisk ? Do I need to partition
anything ?

Lot of questions, I know, hope someone can spare some time to get me on
the road.

Appreciate it, Yvar
