Date: Wed, 30 May 2001 14:34:41 -0400
From: "J. Scott Kasten" <jsk@tetracon-eng.net>
Subject: Re: Pthreads.
In-Reply-To: <3B152E51.ACF145BE@mvista.com>
Message-ID: <Pine.SGI.4.33.0105301431160.11351-100000@thor.tetracon-eng.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010530183441.m7hqWBu0eswbyEdlpuIdOyMeGido79jP0vqzGUYA8y8@z>


On Wed, 30 May 2001, Jun Sun wrote:

> "J. Scott Kasten" wrote:
> >
> > If I recall correctly, some time ago, Jun Sun was looking at pthreads.
> > What is the status of threads in glibc-2.0.6/.7 and glibc-2.2.x for mips?
> > I.E. works, broken, how bad, to do???
> >
>
> I found a bug in the kernel that causes register corruption, which causes
> pthread to fail.  The bug has been fixed for a while in the CVS tree.  I don't
> recall any glibc specific patches.

If I recall correctly, that was S0 not being preserved under certain
system calls.  Which I have taken care of.

>
> Yes, it runs fine on my machines.
>
> Jun
>

When you say runs fine, do you mean the 2.0.x, the 2.2.x or both?

Thanks for your response.
