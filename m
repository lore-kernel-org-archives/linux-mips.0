Message-ID: <00b401c598ed$6be49220$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
References: <009b01c598d5$2ede3e20$106215ac@realtek.com.tw> <42F1F81A.6020002@mips.com>
Subject: Re: Compiling uClibc with MIPS SDE6
Date: Thu, 4 Aug 2005 20:09:53 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Nigel Stephens <nigel@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20050804120953.z6vcAB67eMPBXNnlVjdCNaklJbJDWCJpY14kMwH2bjM@z>


Hi Nigel,
I had already noticed this difference.
But why the application with debug information is not so big, whereas the
libraries are?
And the SDE 6 document says that using -gstabs flag can make it compile with
STABS debug format.
I replaced -g3 with -gstabs flag when compiling uClibc, but it cannot
compile successfully.

Regards,
Colin



----- Original Message ----- 
From: "Nigel Stephens" <nigel@mips.com>
To: "colin" <colin@realtek.com.tw>
Cc: <linux-mips@linux-mips.org>
Sent: Thursday, August 04, 2005 7:12 PM
Subject: Re: Compiling uClibc with MIPS SDE6


>
>
> colin wrote:
>
> >Hi there,
> >I encounter a problem when compiling uClibc with SDE6. If compiling with
> >debug information enabled, the output executable file of busybox is about
> >the same with the one that is compiled with SDE5, but uClibc libraries
are
> >over 10 times the size of the ones that are compiled with SDE5. I am
> >wondering if it is because GCC 3.4.4 of SDE6 has changed some parameters
> >setting?
> >
> >
> >
>
> SDE 6 uses Dwarf-2 debug data, whereas SDE 5 used Stabs. That may
> explain the difference.
>
> Nigel
>
> -- 
>                          Nigel Stephens         Mailto:nigel@mips.com
>     _    _ ____  ___     MIPS Technologies      Phone.: +44 1223 706200
>     |\  /|||___)(___     The Fruit Farm         Direct: +44 1223 706207
>     | \/ |||    ____)    Ely Road, Chittering   Fax...: +44 1223 706250
>      TECHNOLOGIES UK     Cambridge CB5 9PH      Cell..: +44 7976 686470
>                          England                http://www.mips.com
>
