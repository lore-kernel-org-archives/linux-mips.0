Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Tue, 8 Jul 1997 09:29:55 -0400
Message-ID: <199707081329.JAA01013@jenolan.caipgeneral>
From: "David S. Miller" <davem@jenolan.rutgers.edu>
In-reply-to: <199707081017.MAA21226@informatik.uni-koblenz.de> (message from
	Ralf Baechle on Tue, 8 Jul 1997 12:17:11 +0200 (MET DST))
Subject: Re: MIPS Distribution status (Was: Status ...)
Sender: owner-linux@cthulhu.engr.sgi.com
To: ralf@mailhost.uni-koblenz.de
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970708132955.2IKb5hGzsddbzJsUJoWCuysQnDSgBHBtyTO1zhogKTU@z>


Ok, looks like the mips-*-linux entry never made it into the top level
configure, the rest of the support code is in there though as
indicated by the __linux__ tests in mips.h
