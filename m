From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200207080716.g687GvM10243@coplin09.mips.com>
Subject: Re: MIPS Atlas board
Date: Mon, 8 Jul 2002 09:16:57 +0200 (CEST)
In-Reply-To: <20020707211930.A26692@dea.linux-mips.net> from "Ralf Baechle" at Jul 07, 2002 09:19:30 
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Muthukumar Ratty <muthu5@sbcglobal.net>, linux-mips@oss.sgi.com
Message-ID: <20020708071657.UUIRzbxnWlCSECgX-OalUJOIieFBkvmvqz8vKJedZzY@z>



Ralf Baechle writes:
> On Sun, Jul 07, 2002 at 11:09:00AM -0700, Muthukumar Ratty wrote:

> > BTW I was running network performance tools and the max I could read from
> > Atlas board is ~0.3M. Is this a problem with the hardware?
> 
> Hard to say without any kind of closer analysis.  The number certainly
> seems to be too low.  What network benchmark did you run, what processor
> and clock rate does your Atlas have?

There are known issues with the ethernet controller in the Philips 9730
device. For network-intensive applications, use a plug-in card.

/Hartvig
