Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xbRqY-0005FvC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Bintuils
Date: Fri, 28 Nov 1997 14:56:45 +0000 (GMT)
In-Reply-To: <19971128145410.36065@thoma.uni-koblenz.de> from "Ralf Baechle" at Nov 28, 97 02:54:11 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@uni-koblenz.de>
Cc: alan@lxorguk.ukuu.org.uk, ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19971128145645.gEgubTZ2065U7IAoSpMjyC7eVR43ZaBNRsDCmuXHcao@z>

>   - manually rebuild binutils 2.8.1 + patch.  When configuring binutils
>     2.8.1 do not use the --enable-shared option, it will make binutils
>     2.7 generate bad libraries.

Done that. I get a static and apparently workable binutils if I also turn
gcc optimisation off (otherwise gcc dumps)

>   - install the binutils just built

Done that

>   - You should now be able to rebuild the rpm without problems

gcc still dumps, if I fix that I get back to the original problem. This
is the 2.8.1 off sgi.com and has a "mips patch" listed in the spec file.

Im guessing the gcc one is a link bug that damaged gcc just slightly - zsh
also dumps gcc.

Alan
