From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: ip22 watchdog timer
Date: Fri, 15 Feb 2002 13:02:17 -0800
Message-ID: <NEBBLJGMNKKEEMNLHGAIGEIPCFAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020215160601.A845@dea.linux-mips.net>
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Guido Guenther <agx@sigxcpu.org>, linux-mips@oss.sgi.com
Message-ID: <20020215210217.zMV30qYHDiPZ-i4B1uSjhgY2dNqaFm5g3XeUJnqK-kU@z>

Oddly enough, I have the exact opposite attitude...

I will barely accept inlined patches (to the usb-storage driver, which
I maintain).  About 85-90% of the inlined patches I get won't apply
cleanly because of whitespace mangling.  MIME-attachments (of type
text/plain) seem to have a _much_ higher success rate.

Yes, the transition was painful.  Heck, it still is.  Some versions of
Outlook still don't understand the RFC-compliant way of attaching a
digital signature to a message -- I get complaints from people every
so often that all they see is a blank message with two attachments,
one of which is the "message" itself, and the other is my signature.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: owner-linux-mips@oss.sgi.com
> [mailto:owner-linux-mips@oss.sgi.com]On Behalf Of Ralf Baechle
> Sent: Friday, February 15, 2002 7:06 AM
> To: Maciej W. Rozycki
> Cc: Guido Guenther; linux-mips@oss.sgi.com
> Subject: Re: ip22 watchdog timer
>
>
> On Fri, Feb 15, 2002 at 03:41:49PM +0100, Maciej W. Rozycki wrote:
>
> > > How true.  MIME - broken solution for a broken design
> ;)  More serious,
> >
> >  Why broken?  It's not broken for what it was invented
> to, i.e. for
> > passing unsafe characters via SMTP.  Source patches do
> not qualify as
> > containing such.
>
> The transition time from pre-MIME to MIME was pretty
> painful.  If you'd
> have gone through the same pains that I did during the MIME
> introduction
> you'd probably understand why I call it a broken fix for a
> broken system.
> Fortunately now that the childhood problems have been
> solved MIME looks
> alot saner but still I prefer plaintext for patches.
>
>   Ralf
>
