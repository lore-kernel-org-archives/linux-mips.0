Message-ID: <002201c11ef7$0d18d090$0adeeea9@peachtree.sgi.com>
From: "Nils C. Anderson" <andya@sgi.com>
References: <Pine.LNX.4.21.0108070002270.18149-100000@ns>
Subject: Re: Indy 64 or 32 bit?
Date: Tue, 7 Aug 2001 00:11:21 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: nick@snowman.net, George Gensure <werkt@csh.rit.edu>
Cc: Brandon Barker <bebarker@meginc.com>, linux-mips@oss.sgi.com
Message-ID: <20010807041121.k9om4Z1U_4RjIf6CXcMH2GBPP8k5Q7BLRXKoEF26CAw@z>


    Indy and Challenge S under Irix are 32 bits.

to verify just run `uname`

if it returns "IRIX" == 32 bit
if "IRIX64" == 64 bit.

Andy


----- Original Message -----
From: <nick@snowman.net>
To: "George Gensure" <werkt@csh.rit.edu>
Cc: "Brandon Barker" <bebarker@meginc.com>; <linux-mips@oss.sgi.com>
Sent: Tuesday, August 07, 2001 12:03 AM
Subject: Re: Indy 64 or 32 bit?


> IRIX runs indys 32bit.  I would assume it runs the challange s 32bit as
> well, though I'm not sure.  All SGIs newer than the indigo (so the indy,
> i2, etc) support 64bit mode, though some early indy/i2 proms may not be
> able to deal with 64bit code.
> Nick
>
> On Mon, 6 Aug 2001, George Gensure wrote:
>
> > The R5000 Indies are, in my experience 32 bit systems.  Feel free to
smack me
> > down if anyone has contrary information, however.
> >
> > George Gensure
> >
> > On Mon, 6 Aug 2001, Brandon Barker wrote:
> >
> > > I will be purchasing 2 SGI Indy R5000 models from reputable.com, and
was
> > > curious if these are 64 bit systems or 32 bit systems (for that
matter, are
> > > all/any Indys 32 or 64 bit systems).  My guess is 64 because I wiould
think
> > > IRIX has been 64 for quite some time, but was curious.  I use Linux on
x86
> > > but will probably use IRIX for a few weeks on the Indy's until I
become
> > > familiar enough with the machines to try installing Linux.  BTW, does
gcc
> > > work on IRIX?
> > >
> > > Thanks for the info,
> > > Brandon Barker
> > >
> >
>
>
