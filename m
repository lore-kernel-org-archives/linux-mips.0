Date: Tue, 6 Nov 2001 22:48:54 +0000 (GMT)
From: Dave Airlie <airlied@csn.ul.ie>
Subject: Re: [LV] FYI: Mopd ELF support
In-Reply-To: <Pine.GSO.3.96.1011031131020.10781C-100000@delta.ds2.pg.gda.pl>
Message-ID: <Pine.LNX.4.32.0111062247250.14556-100000@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-vax@mithra.physics.montana.edu
Cc: linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20011106224854.YowRAXRzHwLbPhMGUxu8ZaBO7kK3T7Fl0RIIbb2ZZqU@z>


>  Since I'll be away till Tuesday, expect an update in the middle of the
> next week.  I'm assuming ELF loading works, right?
>
not sure the VAX is handling this too well..

if I boot the vmlinux ELF file our build system produces it won't boot it
but I think this is due to our vmlinux file being linked for running with
VM switched on, and the mop loads it into memory that doesn't exist..

Dave.

>   Maciej
>
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied@skynet.ie
pam_smb / Linux DecStation / Linux VAX / ILUG person
