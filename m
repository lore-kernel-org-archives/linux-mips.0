Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708151337.JAA20136@neon.ingenia.ca>
Subject: Re: Local disk boot HOWTO
In-Reply-To: <33F45BBC.84D44D8F@cygnus.detroit.sgi.com> from Eric Kimminau at "Aug 15, 97 09:38:04 am"
Date: Fri, 15 Aug 1997 09:37:25 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: eak@detroit.sgi.com
Cc: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970815133725.3m6qtmsY185cPxardB0h5L8f_tI8mmDEH51H2Ztb9bU@z>

Thus spake Eric Kimminau:
> OK, this IS simple enough. Does anyone have a tar of a functional Linux
> installation I can snag and uncompress on my second disk?

ftp://ftp.linux.sgi.com/pub/mips-linux/root-be-0.00.cpio.gz
should work fine.

(20MB, BTW)

> My assumption would be I would then just modify
> /dev/sdb1/etc/hosts,hostname, etc. for networking and then reboot into
> Linux? 

Something like that.
You can edit them after you reboot, though.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                 UNIX medicine man -- dark magick, cheap!            
#>                                                                     
#>  When the going gets tough, the tough give cryptic error messages.  
#>          "We believe in rough consensus and running code."          
