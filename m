Date: Wed, 24 Oct 2001 16:42:06 -0400
From: "J. Scott Kasten" <jsk@tetracon-eng.net>
Subject: Re: I am looking for a mips machine
In-Reply-To: <20011024121944.B6520@lucon.org>
Message-ID: <Pine.SGI.4.33.0110241637200.11721-100000@thor.tetracon-eng.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011024204206.UL2WUBjaKZZDAnP7jXhttvcse9b86n2_MwldYOzSreM@z>


My general impression is that your looking for a "FAST" board, and a
little endian board make for mutually exclusive requirements.  Not that
little endian couldn't be fast, but just about every piece of hardware
I've seen running little endian has used one of the lesser mips chips in
it where they've cut corners multiplexing address and data over the same
pins and so forth.  Someone correct me if I'm wrong, but of all the ones
I've looked at, the little endian boards had the less capable hardware to
boot.  I think that's because the market was being driven by these little
Win CE things, and CE only supports little endian.

On Wed, 24 Oct 2001, H . J . Lu wrote:

> On Wed, Oct 24, 2001 at 11:19:27AM -0700, James Simmons wrote:
> >
> > I use a Cobalt Qube for alot of my developement. It works fine. I know it
> > is not in Ralph's tree yet but I plan to send him my work soon.
>
> I think Cobalt Qube is slow and is hard to expand the memory. I need at
> least 128MB RAM. Also the current mips kernel doesn't support it.
>
>
> H.J.
>
