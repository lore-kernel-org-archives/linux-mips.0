From: "Jon Burgess" <Jon_Burgess@eur.3com.com>
Message-ID: <80256B4F.00416BF5.00@notesmta.eur.3com.com>
Date: Mon, 28 Jan 2002 11:39:56 +0000
Subject: Re: INSMOD failing on MIPS
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-linux-mips@oss.sgi.com
To: Venkata Rajesh Bikkina <rajeshbv@intotoinc.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020128113956.uFUp37HqketKmZRoV-AcmaXRLnUzcruRty9Cm3i36yw@z>



>But when i link two '.o' files with ld as
>"mipsel-linux-ld -r -o temp.o temp.o temp1.o"
>and insert the output 'temp.o' it is crashing.

I've seen this before, I think the solution is to use:

mipsel-linux-ld -G 0 -r -o temp.o temp.o temp1.o

Without the '-G0' the linker places small common variables into a '.scommon'
section which insmod fails to relocate.

'insmod' should complain in this situation or try to relocate these symbols
properly.

     Jon Burgess
