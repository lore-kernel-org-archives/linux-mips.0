Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199803041745.JAA54870@oz.engr.sgi.com>
Subject: Re: CVS notifications
Date: Wed, 4 Mar 1998 09:45:40 -0800 (PST)
In-Reply-To: <199803041737.LAA28458@athena.nuclecu.unam.mx> from "Miguel de Icaza" at Mar 4, 98 11:37:02 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: ralf@uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19980304174540.HRfh2Nrqg3S_VyLRmp68w0t6VA3ENb14NkTrfAuIXgI@z>

:
:
:> Did anybody change the mail setup on linus?  I don't receive any mail
:> notifications for my CVS commits anymore.
:
:Neither do I.
:
This seems to be a temporary problem with our mail server.
As the owner of the list I've been getting all the bounces.

The reason is probably related to the fact we are starting to
do more aggressive testing of IRIX 6.5 by putting it on all
the critical campus servers:

	% rsh guest@relay uname -a
	IRIX64 cthulhu 6.5-BETA-1274425944 02281110 IP19
	---------------^^^^^^^^^^^^^^^^^^^

No worries, this is going to get fixed.

-- 
Peace, Ariel
