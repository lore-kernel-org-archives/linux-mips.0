Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199806161825.UAA05307@aisa.fi.muni.cz>
Subject: Re: RedHat 5.1 (Manhattan) ALPHA 1 for SGI/Indys
In-Reply-To: <Pine.LNX.3.95.980616120211.26590B-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jun 16, 98 12:07:58 pm"
Date: Tue, 16 Jun 1998 20:25:48 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: adelton@informatics.muni.cz, linux@cthulhu.engr.sgi.com
Message-ID: <19980616182548.ffTs8-BloW5RHMyzK9w9m5FBi2qOBpf-pQWm5DtS0ZM@z>

> 
> > I've set up root password in the menu but it wasn't there after
> > reboot -- not even /etc/passwd -- I had to boot init=/bin/bash.
> 
> Do you mean that /etc/passwd didn't exist at all?

Right. I can repeat the installation from the scratch tomorrow and
have closer look at the other consoles. But neither passwd, nor shadow
existed.

> Do you mean that mkswap segfaulted during install, or after?  I'll have a
> closer look.  The util-linux we're using is a little old.

I'm not sure what happened during install -- I just wanted to have it
done to see the real prompt ;-) But when I tried mkswap /dev/sdb2 on
the prompt, it said something about freeing free buffer? (or whatever)
and then gave register dump. Sorry, I'm at home and can't get to the
machine because sshd isn't running there yet, so I will send the exact
output tomorrow.

> We actually already have ssh on ftp.replay.com, IIRC.  I'm in the US
> (sigh...) so I can't export it.

No problem, I thing we can add mips.rpm to out ssh mirror.

> If you were interested, you could have a look at getting a util-linux RPM
> up to version 2.8.  util-linux is a gross thing.

OK, I'll try.

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------
