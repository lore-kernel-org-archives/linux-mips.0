Date: Tue, 23 Jan 2001 16:34:39 +0000 (GMT)
From: "Dr. David Gilbert" <gilbertd@treblig.org>
Subject: Re: Trying to boot an Indy
In-Reply-To: <wwgofwyckov.fsf@arthur.zdv.Uni-Mainz.DE>
Message-ID: <Pine.LNX.4.30.0101231633570.2812-100000@springhead.px.uk.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Christoph Martin <martin@uni-mainz.de>
Cc: Dave Gilbert <gilbertd@treblig.org>, linux-mips@oss.sgi.com
Message-ID: <20010123163439.tnlDOPvB2QjpUBjMfbP94zleaW9TWLrev0vqp2J2DgA@z>

On 23 Jan 2001, Christoph Martin wrote:

> Dave Gilbert <gilbertd@treblig.org> writes:

> > 1) I tried bootp - bootp()vmlinux - it says 'no server for vmlinux'.  The
> > bootp server is a Linux/Alpha box running 2.4.0-ac9 - I've already done
> > the trick with no_pmtu.  tcpdump shows bootp sending a packet with
> > apparently the correct mac address.
> >
>
> I have the same problem serving bootp from my i386 2.4.0 box. bootp
> with kernel 2.2.x on the same box works. And it is only the bootp from
> the command console that is failing. the bootp part later on in the
> kernel is working from the 2.4.0 box.

This sprang into life when I added the 'sa' entry in the bootp file - that
is the server address.

Dave

-- 
/------------------------------------------------------------------\
| Dr. David Alan Gilbert | Work:dg@px.uk.com +44-161-286-2000 Ex258|
| -------- G7FHJ --------|---------------------------------------- |
| Home: dave@treblig.org            http://www.treblig.org         |
\------------------------------------------------------------------/
