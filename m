Date: Sat, 16 Mar 2002 11:31:18 +0000 (GMT)
From: Dave Airlie <airlied@csn.ul.ie>
Subject: Re: DECStation kernel boot failure
In-Reply-To: <20020315195946.GA3020@excalibur.cologne.de>
Message-ID: <Pine.LNX.4.32.0203161129110.28645-100000@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Karsten Merker <karsten@excalibur.cologne.de>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020316113118.T1iVBiSNgUD04Bilu8wkO0tQ814ULfTrr69RLzxZ11Y@z>


>
> That was the LANCE driver for the 5000/200, which is different from
> the driver for all the 5000/xx, /1xx, /240 and /260. The Maxine
> should work with the default declance.c from the CVS.

Does the copy on my website still work ?

http://www.skynet.ie/~airlied/mips/declance_2_3_48.c

It was never merged as to do it properly required a re-write of the
driver, which I never got around to, and I only had a DS5000/200, I still
have one, but no build system at the moment ...

Dave.

 >
> Regards,
> Karsten
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied@skynet.ie
pam_smb / Linux DecStation / Linux VAX / ILUG person
