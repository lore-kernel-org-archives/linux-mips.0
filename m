Date: Mon, 14 Oct 2002 23:04:06 +0200 (CEST)
From: Michael Matz <matz@suse.de>
Subject: Re: MIPS gas relaxation still doesn't work
In-Reply-To: <orwuokzs9k.fsf@free.redhat.lsd.ic.unicamp.br>
Message-ID: <Pine.LNX.4.33.0210142301560.20702-100000@wotan.suse.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <matz@suse.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alexandre Oliva <aoliva@redhat.com>
Cc: "H. J. Lu" <hjl@lucon.org>, "David S. Miller" <davem@redhat.com>, rsandifo@redhat.com, linux-mips@linux-mips.org, gcc@gcc.gnu.org, binutils@sources.redhat.com
Message-ID: <20021014210406.6irtYq3vLK7BGd6c8NLYWFx1-yGk1tgRKHwJ9_W5V5E@z>

Hi,

On 14 Oct 2002, Alexandre Oliva wrote:

> > If gcc just emits
>
> > 	bne     $2,$0,$L7493
> > 	j       $L2
>
> IIRC, that's exactly what GCC will emit if you don't tell it to try to
> fill delay slots.  If it tries to fill delay slots and fails, I doubt
> the assembler is going to succeed at that.

I think that isn't hj's point.  He wanta gas to take advantage of
relaxation, and gcc is hindering that for no good reason.  I admit I have
no idea of Mips, though, so I don't know if relaxation somehow is
depending on delay slot filling at all ;-)


Ciao,
Michael.
