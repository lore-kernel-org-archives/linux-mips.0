Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199707311909.MAA17852@oz.engr.sgi.com>
Subject: Re: An update...
Date: Thu, 31 Jul 1997 12:09:26 -0700 (PDT)
In-Reply-To: <Pine.LNX.3.91.970731203002.4976C-100000@web.aec.at> from "Oliver Frommel" at Jul 31, 97 08:31:26 pm
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Oliver Frommel <oliver@aec.at>
Cc: adevries@engsoc.carleton.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970731190926.5SK-Zt1rjWT2RR9Xz5q2S0j2xIlK28xXgYrvTnyX0mI@z>

:
:On Thu, 31 Jul 1997, Miguel de Icaza wrote:
:
:> 
:> > - Is there anyway to get rid of that jazzy sound startup thing?  Sure, it
:> > puts all the Mac's in my office to shame, but after about the twentieth
:> > time it's a little bothering...
:> 
:>
:
:in the boot monitor enter "setenv volume 0"
:
:oliver
: 
It can also be done from the shell with "nvram volume 10"
or a similar low value (man nvram).

-- 
Peace, Ariel
