Subject: Re: sysmips syscall
Date: Sat, 18 Nov 2000 17:26:54 +0000 (GMT)
In-Reply-To: <23098.974555179@ocs3.ocs-net> from "Keith Owens" at Nov 19, 2000 12:46:19 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E13xBlP-0001tb-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Keith Owens <kaos@melbourne.sgi.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001118172654.zV7O94YTuXx6QqWNEdj5YQTtGQSuMLepP0oTvGkQ_Sw@z>

> Use Dekker's algorithm between systems.  It requires cache coherent
> memory but does not need any inter cpu locking mechanisms.

Cache coherent and write ordered
