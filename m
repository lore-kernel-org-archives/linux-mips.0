Message-ID: <00f101bf9384$a2ec6230$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: FP emulation patch available
Date: Tue, 21 Mar 2000 23:27:19 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Dominic Sweetman <dom@algor.co.uk>
Cc: Linux SGI <linux@cthulhu.engr.sgi.com>, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000321222719.M5VydjQVtLxkN95X4P2sG0HbxuB3HZYuiA32FLPTb5U@z>

>> Denormalised operands (for example) will cause any computational
>> operation to blow up (change sign, load, store and move will survive -
>> can you think of much else?).  The requirement for MIPS hardware is
>> something like "you can throw an unimplemented exception in response
>> to any combination of operands and operation you don't like, so long
>> as it's rare".  That's why a complete emulator is probably a good
>> idea.
>>
>> Dominic Sweetman
>> dom@algor.co.uk
>
>OK, I'm convinced.  I believe I know how to make the Algorithmics
>emulator SMP-safe *and* more efficient in the general case, thanks
>in part to a suggestion from Ralf.  Time permitting, I will also wire it
>up to the unimplemented operation handler.  Give me a week or so
>to accumulate enough spare time...


OK, I've done it, and it seems to work very nicely indeed.
The combination of a real FPU with the Algorithmics emulator
for the Unimplemented corner case has given me the first
100% successful "paranoia" runs I've seen under MIPS Linux.
I also merged in some R3000 fixes that Harald pointed out
to me.  I'm holding off on distribution to give my colleagues
some time to merge in some CP0 hazard fixes, but we'll be 
putting the sources and patches up on the web in the next 
few days...

            Kevin K.
