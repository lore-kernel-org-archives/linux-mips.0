Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199704082356.TAA04813@neon.ingenia.ca>
Subject: Re: It booooooooooots!
In-Reply-To: <9704091148.ZM9065@windy.wellington.sgi.com> from Alistair Lambie at "Apr 9, 97 11:48:25 am"
Date: Tue, 8 Apr 1997 19:56:31 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alistair Lambie <alambie@wellington.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970408235631.wGSb6cOppzulelHZLl74F5QgkijFND8cv8iJUtmme-4@z>

Thus spake Alistair Lambie:
> I used to have that...you probably haven't got a rarp server set up, so it
> can't find its address.  One of the things David was going to add was that
> ability to read it out of NVRAM...but that wasn't high on the priority list!
>  For now, the only way is to have a rarp server.

Actually, you can do it with
boot -f bootp()server:/vmlinux nfsaddrs=my.ip.ad.dr:nfs.ip.ad.dr

It mounts it now (I have the NFS daemon running with debugging on so
that I can watch) but it just stops after it looks at tty[4123 -- in
that order].

I'm going to see how the SPARC guys did it; I think it's just a matter
of getting the device entries correct.

> Did you get my root filesystem etc off http://reality.sgi.com/ariel/alambie.
> This should give you the bits you need to get multiuser (init), set up
> networking and mount disks.

Yeah, and that's what I'm using for my root filesystem.
It mounts everything and checks out stuff like /var/log/utmp (!), but
then hangs after it looks at the ttys.

Curious...

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>           Resident Linux bigot and kernel hacker. (OOPS!)           
#> `If you get bitten by a bug, tough luck...the one thing I won't do  
#> is feel sorry for you.  In fact, I might ask you to do it all over  
#> again, just to get more information.  I'm a heartless bastard.'     
#>                       -- Linus Torvalds (on development kernels)    
