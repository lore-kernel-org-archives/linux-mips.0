From: Justin Carlson <carlson@sibyte.com>
Reply-To: carlson@sibyte.com
Subject: RE: Multiple processor support?
Date: Fri, 23 Mar 2001 16:08:13 -0800
Content-Type: text/plain
References: <NEBBLJGMNKKEEMNLHGAIKELLCAAA.mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIKELLCAAA.mdharm@momenco.com>
MIME-Version: 1.0
Message-ID: <01032316143609.00779@plugh.sibyte.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Matthew Dharm <mdharm@momenco.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010324000813.bCFNQVpWeleHGAPZweVnHK6eAEINRcdOQHAqrFsMiy0@z>

On Fri, 23 Mar 2001, Matthew Dharm wrote:
> Well, I'd like to know about both, frankly.  Tho I'm more interested
> in whichever is designed to run on RM7000 series processors.

To the best of my knowledge, the mips64 tree only works in SMP on the ip-27
which is r10K based.  There would be a bit of work to get an RM7K  based
multiprocessor system to run. A fair amount of the "generic" code in
that tree is also pretty ip-27 specific, and so would need to be cleaned up.

I'm working on mips32 SMP support at the moment; there are no existing ports of
this tree to an SMP platform.  The mips64 stuff is certainly much, much more 
mature.  I don't know of any reasons not to use the mips64 side for an RM7K.

-Justin
