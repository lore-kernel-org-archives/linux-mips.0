Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709110452.AAA03150@neon.ingenia.ca>
Subject: Re: Linux/SGI: Xsgi Shmiq/Qcntl
In-Reply-To: <199709110303.WAA25810@athena.nuclecu.unam.mx> from Miguel de Icaza at "Sep 10, 97 10:03:09 pm"
Date: Thu, 11 Sep 1997 00:52:56 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: linux@fir.engr.sgi.com
Message-ID: <19970911045256.1cUzoL16gMYiNms2-6Dlp_FrHyxRbK28j7zRQPoNWCo@z>

Thus spake Miguel de Icaza:
>     The code does an open on /dev/shmiq and then opens: sprintf (buf,
> "/dev/qcntl%d", mistery_variable) I want to know how it computes
> mistery_variable.  I am obviously screwing something in the shmiq
> emulation code. 

If it's like the rest of the shmiq stuff, it's probably the minor
number.   Remind me to test that stuff better now that I have an
Indy. =)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com)      Information Warfare Division  
#> Chief Tactical and Strategic Officer         "Saepe fidelis"        
#>                                                                     
#> "I like your game, but we have to change the rules." -- Anon        
#>                                                                     
