Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708160105.VAA26202@neon.ingenia.ca>
Subject: Re: boot linux - wish
In-Reply-To: <199708152147.QAA30844@athena.nuclecu.unam.mx> from Miguel de Icaza at "Aug 15, 97 04:47:24 pm"
Date: Fri, 15 Aug 1997 21:05:34 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: ariel@sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970816010534.Bg_ti6Xj6fmcbPeswyUELtNyWb_B9WfrHE3PJP4xz8Q@z>

Thus spake Miguel de Icaza:
> Agreed.  I really preffer this way of setting up Linux, but this
> basically forces you to have an NFS server with the installation files
> somewhere accessible.

Really?
If I stick all the RH stuff in an initrd and then they do FTP install,
then they should be able to use it via boot /vmlinux or boot -f
bootp()..., no?

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>           Resident Linux bigot and kernel hacker. (OOPS!)           
#> `If you get bitten by a bug, tough luck...the one thing I won't do  
#> is feel sorry for you.  In fact, I might ask you to do it all over  
#> again, just to get more information.  I'm a heartless bastard.'     
#>                       -- Linus Torvalds (on development kernels)    
