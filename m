From: Dominic Sweetman <dom@algor.co.uk>
MIME-Version: 1.0
Message-ID: <15566.28397.770794.272735@gladsmuir.algor.co.uk>
Date: Tue, 30 Apr 2002 11:16:13 +0100
Subject: Re: [Fwd: Current state of MIPS16 support?]
In-Reply-To: <3CBFEAA9.9070707@algor.co.uk>
References: <3CBFEAA9.9070707@algor.co.uk>
Content-Type: text/plain; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Johannes Stezenbach <js@convergence.de>, Eric Christopher <echristo@redhat.com>
Cc: gcc@gcc.gnu.org, linux-mips@oss.sgi.com, dom@algor.co.uk, sde@algor.co.uk
Message-ID: <20020430101613.-e-yuuFmfx9TxIujbAGu4SeDUPk2G-bEwbikv7ECcm8@z>


On 17th April (yes, I know that's a long time) Johannes wrote:

> I quickly discovered that mips16 support in gcc-2.95 is broken.
> ...
> gcc-3.1 does seem to generate correct code for my tiny
> test programs, but lacks mips16 support routines in
> libgcc.a when configured for target mips-linux.
> ...
> Dominic Sweetman from Algorithmics mentioned in a posting
> to the linux-mips list (http://oss.sgi.com/mips/mail.html)
> that they have numerous patches against an old gcc version.
> Has someone had a look at the Algorithmics gcc, or even
> attempted to incorporate thier patches into gcc-3.x?

I really owe you guys a reply, so I'll go for a cross-post.

Eric replied:

> mips16 support was broken for quite some time. Recently a lot of bug
> fixes have gone into making it quite usable, though fairly unstable...

Sounds fair.

> I have not looked at the Algorithmics code because I don't have
> copyright on it...

We do publish our sources on our web server.  Not only are they GPL
but we have a copyright assignment to the FSF in place (which I know
was sent to Jim Wilson of Cygnus, albeit in 1993...)

We're operating from a baseline which was a Cygnus/RedHat "2.96"
release made to MIPS Technologies in late 2000.  A snapshot from a
contract which had run into some kind of dissension, it had some new
MIPS16 support but it was very buggy (the regular 32-bit MIPS code
generator, too).  It has some nice features, though, like the "Haifa"
scheduler and the DFA extensions to machine descriptions for
superscalar CPUs.

It's true we have not contributed patches lately.  We don't really
have the resouces; our success rate used to be very low, and since
we're not working around the developing 3.x sources the prospects seem
even dimmer.

We're working (with funding from MIPS Technologies) on building a
toolchain which:

o Can build Linux kernel, libraries and applications alike;

o Is substantially more efficient than other GCC versions when
  producing MIPS application ("MIPS/ABI", PIC) code;

o Will produce ugly-but-correct PIC code for MIPS16 functions, so
  MIPS16 can be tested in a standard Linux environment;

o Operates to a known and documented ABI (even the forgotten details,
  like gprof...)

(The modesty of those ambitions should be measured against the reality
of today's Linux/MIPS...)

We should be done in 6 weeks or so.  Our intention is to provide this
port as both source and binary RPMs for free download, and to
encourage its widespread use.

We appreciate it would be great if this work was converged into a
robust 3.x compiler (though the change in C++ code conventions means,
I think, that it will be a long time before such a compiler can be
used by a majority of substantial embedded projects).  We're
canvassing anyone we can think of with the funds or influence to help
make it happen.

It would be even more valuable if we could ensure that MIPS becomes a
"first-class" architecture for the evolving GCC - but the latter
surely is a big commitment for the core GCC group.

It's a pity that the different priorities of various funders and
developers mean that there is no baseline toolkit for Linux/MIPS, so
that such resources as are available are frequently used to re-invent
the wheel.

Anyone got any ideas how to make it better?

--
Dominic Sweetman
Algorithmics Ltd
The Fruit Farm, Ely Road, Chittering, CAMBS CB5 9PH, ENGLAND
phone +44 1223 706200/fax +44 1223 706250/direct +44 1223 706205
http://www.algor.co.uk
