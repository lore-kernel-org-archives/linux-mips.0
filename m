Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Fri, 13 Jun 1997 13:37:35 -0700
Message-ID: <199706132037.NAA29267@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: gcc for Irix.
In-Reply-To: <199706131750.KAA09670@yon.engr.sgi.com>
References: <199706131654.JAA28555@fir.engr.sgi.com>
	<199706131750.KAA09670@yon.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ariel Faigon <ariel@sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970613203735.hEqz3CCk_xO_ro4IXUg7zRvIpznlHMk2PcGjFI9vei4@z>

Ariel Faigon writes:
 > :
 > :Miguel de Icaza writes:
 > :...
 > : >    I am running into a little problem.  The binary gcc that is
 > : > available on the free software collection is for Irix 5.3 and the
 > : > include files that are packaged with it are not quite ok for Irix 6.2
 > :...
 > :
 > :      In what way do the 5.3 include files cause problems?
 > :
 > 
 > [Note: I'm taking care of Miguel in private email]
 > 
 > The headers that come with gcc are:
 > 
 > 	1) Only a very small subset of the full set of headers
 > 	   which were preprocessed by gcc 'fix_header' utility.
 > 
 > 	2) Correspond to the OS version on which gcc was built
 > 	   which may be incompatible in subtle ways with the
 > 	   runtime libraries on a later OS version.
 > 
 > Since Miguel's Indy is (apparently) a 6.2 IRIX, possibly
 > without all the necessary header patches, and the gcc he
 > is trying was built on 5.3, I can see why he has header
 > problems.

       If the old headers do not work on the new system, that is a
bug, not a feature.  There had better not be any subtle
incompatibilities.  (New headers will not work on an old system, but
that is a different problem.)
