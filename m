Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: "Alistair Lambie" <alambie@wellington.sgi.com>
Message-ID: <9704041257.ZM3038@windy.wellington.sgi.com>
Date: Fri, 4 Apr 1997 12:57:06 +0000
In-Reply-To: Mike Shaver <shaver@neon.ingenia.ca>
        "Re: The Indy has landed..." (Apr  4, 12:24pm)
References: <199704040023.TAA20413@neon.ingenia.ca>
Subject: Re: The Indy has landed...
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>, Ralf Baechle <ralf@Julia.DE>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970404125706.A3LOmWjpEhP2cAm2yq6HRsVFomd2ETCg1jR2fvoM6Vo@z>

On Apr 4, 12:24pm, Mike Shaver wrote:
> Subject: Re: The Indy has landed...
> Thus spake Ralf Baechle:
> > > IRIX (bogomips.ingenia.com)
> >
> > (Hope this is R4600 - otherwise BogoMIPS won't be too impressive ...)
>
> bogomips 10# cat /proc/cpuinfo
> Cannot open /proc/cpuinfo: No such file or directory
> bogomips 11# dmesg | more
> dmesg: Command not found.
> bogomips 12# man dmesg
> No manual entry found for dmesg.
> bogomips 13#
>
> Not sure...I _think_ it's an R5K, but the packing bits and the machine
> itself are 3 time zones east.
>

I assume it's got Irix running at the moment.  If so, try 'hinv'.

> > Assuming you're using a Linux box as TFTP Server here are old versions of
> > my config files.  Iff(OS != Linux) while(1){swear();rtfm(damn);swear()} ;-)
>
> Actually (I guess I should have made this clearer...a couple of people
> have sent tftp help) I meant tips on what should go in the NFS root
> area.  Can I just pull stuff down from davem's private archive and
> untar, or have things changed since then?
>

Ariel....maybe you should put the tar's on netengr.engr:~/dm/alambie on
ftp://reality.sgi.com/private/dm/ till I get linux.sgi.com sorted out.  There
should be everything you need to get multiuser in there.

Cheers, Alistair

-- 
Alistair Lambie					    alambie@wellington.sgi.com
Silicon Graphics New Zealand				  SGI Voicemail: 56791
Level 5, Walsh Wrightson Tower,				    Ph: +64-4-802 1455
94-96 Dixon St, Wellington, NZ			  	   Fax: +64-4-802 1459
