Message-ID: <00f001bf73d4$4b5f21d0$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Enhanced 2.2.12 MIPS Kernel Sources  Available
Date: Thu, 10 Feb 2000 15:36:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Gleb O. Raiko" <raiko@niisi.msk.ru>
Cc: linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <20000210143655.Qi7Q8mqd6fJtgou5yRVoA3zTikAhcuxL1IeX8wHB184@z>

>It'll be great if you would put just patches too. I guess, it'll be easy
>for us to look through set of patches instead of downloading entire
>2.2.12 and making diff -ruN on it. Then, there might be a core patch
>that decribes changes in machine independent part of the kernel and the
>rest might cover specific boards. Most of developers here will be
>interested in the core patch, I guess.


OK, there is now a patch file available on the Paralogos site
(http://www.paralogos.com/mipslinux/) with the deltas relative
to the kernel.org 2.2.12 distribution.  It covers the whole kernel
tree - I don't think I can reasonably decompose the changes
without introducing a gratuitous opportunity to generate bugs.

            Happy hacking,

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
