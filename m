From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202022049.VAA15305@copsun18.mips.com>
Subject: Re: PATCH: Fix ll/sc for mips (take 3)
Date: Sat, 2 Feb 2002 21:49:29 +0100 (MET)
In-Reply-To: <20020202120354.A1522@lucon.org> from "H . J . Lu" at Feb 02, 2002 12:03:54 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>
Cc: Justin Carlson <justinca@ri.cmu.edu>, Daniel Jacobowitz <dan@debian.org>, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Hiroyuki Machida <machida@sm.sony.co.jp>, libc-alpha@sources.redhat.com, linux-mips@oss.sgi.com, gcc@gcc.gnu.org
Message-ID: <20020202204929.wjO4bHGyjcpKx4tiqzlCsPOQXOQO5eNkBvyK11fcxlk@z>


H . J . Lu writes:
> Does everyone agree with this? If yes, I can make a patch not to use
> branch likely. But on the other hand, "gcc -mips2" will generate code
> using branch likely. If branch likely doesn't buy you anything, 
> shouldn't we change gcc not to generate branch likely instructions?

I would say it's still too early to actively remove them. There are many
processors out there (certainly in the embedded world most of them)
without branch prediction, and for all of those branch-likelys actually
help performance.

/Hartvig
