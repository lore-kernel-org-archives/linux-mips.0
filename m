Received: from newman.mips.com (ns-dmz [206.31.31.225])
	by mx2.mips.com (8.12.5/8.12.5) with ESMTP id gB49gMNf022135
	for <linux-mips@linux-mips.org>; Wed, 4 Dec 2002 01:42:22 -0800 (PST)
Received: from grendel (grendel [192.168.236.16])
	by newman.mips.com (8.9.3/8.9.0) with SMTP id BAA07879
	for <linux-mips@linux-mips.org>; Wed, 4 Dec 2002 01:42:21 -0800 (PST)
Message-ID: <008201c29b7a$089bf870$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20021203224504.B13437@mvista.com> <007501c29b78$f34680e0$10eca8c0@grendel>
Subject: Re: possible Malta 4Kc cache problem ...
Date: Wed, 4 Dec 2002 10:46:21 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20021204094621.lrxh2xfCfIMFQx7Tt7Wde2kiMR2SuZdrMSRHY4W5vLw@z>

> Which version of the 4Kc manual are you looking at?  I'm looking
> at a very recent version of the 4Kc Software User's Manual
> (version 1.17, dated September 25, 2002), and it only shows
> Hit_Writeback_D to be invalid for *secondary and teritary*
> caches, which makes sense, since the 4KSc doesn't have any.

Note for the pendantic - that "S" was a typo, though of
course the lack of secondary and tertiary caches applies
to the whole 4K family, c, Ec, Sc, and Sd.
