Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708121836.OAA12605@neon.ingenia.ca>
Subject: Re: Precompiled kernel available ?
In-Reply-To: <wsnen7zuuqm.fsf@pingwin.icm.edu.pl> from Jan Rychter at "Aug 12, 97 08:22:25 pm"
Date: Tue, 12 Aug 1997 14:36:36 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Jan Rychter <jwr@icm.edu.pl>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970812183636.buyOvL7WM_0VqO1ebdt9qlqDYNzA6KbHy3ZTfeal0rk@z>

Thus spake Jan Rychter:
> int-handler.S: Assembler messages:
> int-handler.S:64: Error: .previous without corresponding .section; ignored
> int-handler.S:70: Error: .previous without corresponding .section; ignored
> int-handler.S:73: Error: .previous without corresponding .section; ignored
> int-handler.S:172: Error: .previous without corresponding .section; ignored
> int-handler.S:250: Error: .previous without corresponding .section; ignored
> int-handler.S:270: Error: .previous without corresponding .section; ignored
> int-handler.S:271: Error: .previous without corresponding .section; ignored
> int-handler.S:294: Error: .previous without corresponding .section; ignored

Are you using the Intel crosstools from the crossdev directory?
You'll need newer ones, we think, and I'm going to build a new tarball
shortly.  (Tonight?)

> So, any hope for a ready-to-run-barely-bootable-but-binary thing on ftp
> somewhere ? I was kinda expecting this from mr. David "SPARC precompiled
> kernels for people" Miller :-)

When I get my crosstools working again, I'll build something to put
up.

(I can't test it, unfortunately, but hey...)

> BTW, isn't this a typo ?
> 
> --- sni.h-original      Sat Jun 14 19:38:41 1997
> +++ sni.h       Sat Jun 14 19:38:45 1997
> @@ -15,7 +15,7 @@
>  /*
>   * ASIC PCI registers for little endian configuration.
>   */
> -#ifndef __MIPSEL__
> +#ifdef __MIPSEL__
>  #error "Fix me for big endian"
>  #endif
>  #define PCIMT_UCONF            0xbfff0000

Don't think so.
If it's not little-endian (#ifndef __MIPSEL__), then it's big-endian
and needs to be fixed.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>            Chief System Architect and Herder of Bits                
#>                                                                     
#> "Yoda say, `Just slap a little public key crypto into it' does not  
#>      a secure system make." -- Marcus J. Ranum (mjr@clark.net)      
