Date: Fri, 30 Nov 2001 09:49:44 +0000 (GMT)
From: Dave Airlie <airlied@csn.ul.ie>
Subject: Re: Bug in Dwarf support?
In-Reply-To: <86048F07C015D311864100902760F1DD01B5E463@dlfw003a.dus.infineon.com>
Message-ID: <Pine.LNX.4.32.0111300947080.29181-100000@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Andre.Messerschmidt@infineon.com
Cc: linux-mips@oss.sgi.com
Message-ID: <20011130094944.246ZseqhqTw9g32fxDr-mGVM5RLbOu6fLCsY8Gn5aH4@z>


I had this with a debugger I was beta testing... there is a compile path
stored separate to the path of the file, it needs to use the compile
path, so it is a bug in the debugger not using the full standard.. you can
the info out with gdb (I can't remember the exact incantation...)

Dave.

On Fri, 30 Nov 2001 Andre.Messerschmidt@infineon.com wrote:

> Hi.
>
> When I compile kernel 2.4.3 with dwarf debug support (using H.J.Lu's gcc
> 2.96 binaries) I get no path information for source files.
> I did a hexdump of .debug_sfnames with readelf and the path is there but
> separated from the filename by a 0x00. For include files the path is ok.
> (i.e. the 0x00 is missing)
>
> Is this a bug or standard? I believe this prevents my debugger from
> recognizing the source tree structure.
>
> best regards
> Andre Messerschmidt
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied@skynet.ie
pam_smb / Linux DecStation / Linux VAX / ILUG person
