From: "Andrew Linfoot" <alinfoot@escafeldcomputing.co.uk>
Subject: RE: Passing kernel args
Date: Tue, 24 Apr 2001 20:09:13 +0100
Message-ID: <000701c0ccf2$1029ca20$0101a8c0@derfel>
In-Reply-To: <20010422001440.A1191@bilbo.physik.uni-konstanz.de>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010424190913.LVIxpz1BEHUTKSHGts-VlgvPPlwDuxg4z15S6NX4tnQ@z>

Just thought i would let you know of my experience with autobooting.

I'm having the same problems as Dave in that i must specify a space in
the OSLoadOptions " root=/dev/sda1 ro". However every time i shutdown or
reboot it is truncated to OSLoadOptions= root=/dev/s meaning i have to reset
it after every reboot.

any ideas as to what may be causing this?
I am runnning on an Indy R5K

Also i am using an ELF kernel and not ECOFF as specified in Guido's howto.

Cheers
Andy
