Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199705301743.NAA20046@neon.ingenia.ca>
Subject: Re: ah...
In-Reply-To: <199705301734.TAA14229@informatik.uni-koblenz.de> from Ralf Baechle at "May 30, 97 07:34:01 pm"
Date: Fri, 30 May 1997 13:43:30 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970530174330.1SV3J3p9S_qxhtsdP8hrz1JY2ah3GNPKzNdPnj-3AqI@z>

Thus spake Ralf Baechle:
> Hurz...  Looks like you either you disabled TCI/IP networking or libc
> and the kernel use different constants for the arguments of socket(2).

I've added some more verbosity, and the constants are AF_INET=2,
SOCK_STREAM=2, IPPROTO_TCP=6.

TCP is correct, but SOCK_STREAM in my kernel headers is 1, SOCK_DGRAM being
2.  That'd explain the UDP thing, anyway.

Yup, my test program works if I force SOCK_STREAM to be 1.
I guess I'll try and find the bogosity in the headers, then.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>            Chief System Architect and Herder of Bits                
#>                                                                     
#> "Yoda say, `Just slap a little public key crypto into it' does not  
#>      a secure system make." -- Marcus J. Ranum (mjr@clark.net)      
