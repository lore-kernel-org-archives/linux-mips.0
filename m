Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708151709.NAA22391@neon.ingenia.ca>
Subject: Re: Local disk boot HOWTO
In-Reply-To: <9708150958.ZM1050@xtp.engr.sgi.com> from Greg Chesson at "Aug 15, 97 09:58:08 am"
Date: Fri, 15 Aug 1997 13:09:36 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Greg Chesson <greg@xtp.engr.sgi.com>
Cc: eak@detroit.sgi.com, ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970815170936.cYWQqYOJfrMyVSL25gky8qF-gIfkc_Bxe69OyGPRKrY@z>

Thus spake Greg Chesson:
> > > - put vmlinux on the IRIX /
> > > - boot into sash
> > > boot /vmlinux root=/dev/sdb1
> 
> seems to me you'd have to also patch vmlinux to get the device ID
> correct for the root disk.

The root= parameter tells it where its root device is.
(It magically parses the [hs]d[ab][0-8] part into major/minor.)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com)      Information Warfare Division  
#> Chief Tactical and Strategic Officer         "Saepe fidelis"        
#>                                                                     
#> "I like your game, but we have to change the rules." -- Anon        
#>                                                                     
