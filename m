Subject: Re: Filesystem corruption
Date: Mon, 5 Feb 2001 12:10:37 +0000 (GMT)
In-Reply-To: <20010205020241.A30062@bacchus.dhis.org> from "Ralf Baechle" at Feb 05, 2001 02:02:41 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14PkTf-0003DK-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Carsten Langgaard <carstenl@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20010205121037.mwoNfVXpHqDMNacfeF0cQgYccDTY5Sg6DQbBd580Y3w@z>

> 2.4.1 is known to cause fs corruption for all architectures; 2.4.0 should
> actually be fine.  I just reached 8 days of uptime on a 32p Origin 2000,
> so it can't be that bad.

Im tracking fs corruption and worse on 2.4.0 as well (zero page corruptions
since 2.4.0test10 for example)

I dont believe any 2.4 is currently 'safe'
